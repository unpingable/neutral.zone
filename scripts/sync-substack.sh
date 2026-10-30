#!/usr/bin/env bash
# Import new posts; --publish also commits and pushes main to GitHub Pages.
set -euo pipefail

FEED_URL="https://neutralzone.substack.com/feed"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

PUBLISH=false
case "${1:-}" in
  "") ;;
  --publish) PUBLISH=true ;;
  *) echo "Usage: $0 [--publish]" >&2; exit 2 ;;
esac
if (( $# > 1 )); then
  echo "Usage: $0 [--publish]" >&2
  exit 2
fi

# Allow a local pandoc installation on hosts without sudo.
export PATH="$PATH:$REPO_ROOT/.tools/bin"
for dependency in curl python3 pandoc flock git; do
  command -v "$dependency" >/dev/null || {
    echo "ERROR: Missing $dependency. See SYNC.md." >&2
    exit 1
  }
done

exec 9>"$(git rev-parse --git-common-dir)/sync-substack.lock"
flock -n 9 || { echo "ERROR: Another sync is running." >&2; exit 1; }

if "$PUBLISH"; then
  if [[ $(git branch --show-current) != main ]] || [[ -n $(git status --porcelain) ]]; then
    echo "ERROR: --publish requires main with a clean working tree. Commit or set aside your work first." >&2
    exit 1
  fi
  git pull --ff-only origin main
fi

FEED_FILE=$(mktemp)
trap 'rm -f "$FEED_FILE"' EXIT
echo "Fetching RSS feed..."
curl --fail --silent --show-error --location --connect-timeout 15 --max-time 90 \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36' \
  "$FEED_URL" -o "$FEED_FILE"

python3 - "$FEED_FILE" << 'PYEOF'
import xml.etree.ElementTree as ET
import subprocess, os, re, sys, json
from email.utils import parsedate_to_datetime

CONTENT_DIR = "content/archive"

with open(sys.argv[1], "rb") as f:
    raw = f.read()

# Quick sanity check
if b"<rss" not in raw[:500]:
    print("ERROR: Feed response is not RSS (possibly a Cloudflare challenge).")
    print("First 200 bytes:", raw[:200].decode(errors="replace"))
    sys.exit(1)

root = ET.fromstring(raw)
items = root.findall(".//item")
print(f"Found {len(items)} items in feed")

new_files = []
existing = set(os.listdir(CONTENT_DIR))

for item in items:
    title = item.findtext("title", "").strip()
    link = item.findtext("link", "").strip()
    pub_date = item.findtext("pubDate", "").strip()

    content = ""
    for child in item:
        if child.tag.endswith("encoded"):
            content = (child.text or "").strip()
            break

    if not title or not link or not pub_date or not content:
        print(f"  SKIP (missing fields): {title or link}")
        continue

    try:
        dt = parsedate_to_datetime(pub_date)
        date_ymd = dt.strftime("%Y-%m-%d")
    except Exception:
        print(f"  SKIP (bad date): {title}")
        continue

    slug_match = re.search(r"/p/([A-Za-z0-9_-]+)(?:[?#].*)?$", link)
    if not slug_match:
        print(f"  SKIP (no slug): {title}")
        continue
    slug = slug_match.group(1)

    filename = f"{date_ymd}-{slug}.md"
    if filename in existing:
        continue

    result = subprocess.run(
        ["pandoc", "-f", "html", "-t", "markdown", "--wrap=none"],
        input=content, capture_output=True, text=True
    )
    if result.returncode != 0:
        print(f"ERROR: pandoc failed for {title}: {result.stderr}", file=sys.stderr)
        sys.exit(1)

    body = result.stdout.strip()
    safe_title = json.dumps(title, ensure_ascii=False)
    document = f'---\ntitle: {safe_title}\ndate: {date_ymd}\n---\n\n{body}\n'
    new_files.append((filename, document))
    existing.add(filename)

# Convert the entire batch before writing any files: a failed conversion is retryable.
for filename, document in new_files:
    with open(os.path.join(CONTENT_DIR, filename), "x", encoding="utf-8") as f:
        f.write(document)

if not new_files:
    print("\nNo new posts.")
else:
    print(f"\n{len(new_files)} new post(s) added.")
    for fn, t in new_files:
        print(f"  + {fn}")
PYEOF

if "$PUBLISH"; then
  git add -- content/archive
  if ! git diff --cached --quiet; then
    git commit -m "sync: new posts from Substack RSS"
  fi
  # Retry an earlier failed push even if this feed contains no new posts.
  git push origin main
fi
