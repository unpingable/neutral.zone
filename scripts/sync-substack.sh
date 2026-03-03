#!/usr/bin/env bash
# Fetch new posts from Substack RSS, convert to Hugo markdown, and commit.
# Run from the repo root: ./scripts/sync-substack.sh
set -euo pipefail

FEED_URL="https://neutralzone.substack.com/feed"
CONTENT_DIR="content/archive"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

echo "Fetching RSS feed..."
curl -sL \
  -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36" \
  "$FEED_URL" -o /tmp/nz-feed.xml

python3 << 'PYEOF'
import xml.etree.ElementTree as ET
import subprocess, os, re, sys
from email.utils import parsedate_to_datetime

CONTENT_DIR = "content/archive"

with open("/tmp/nz-feed.xml", "rb") as f:
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

    slug_match = re.search(r"/p/([^?#]+)", link)
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
        print(f"  SKIP (pandoc error): {title}")
        continue

    body = result.stdout.strip()
    safe_title = title.replace('"', '\\"')

    with open(os.path.join(CONTENT_DIR, filename), "w") as f:
        f.write(f'---\ntitle: "{safe_title}"\ndate: {date_ymd}\n---\n\n{body}\n')

    new_files.append((filename, title))
    print(f"  NEW: {filename} — {title}")

if not new_files:
    print("\nNo new posts.")
else:
    print(f"\n{len(new_files)} new post(s) added.")
    for fn, t in new_files:
        print(f"  + {fn}")
PYEOF
