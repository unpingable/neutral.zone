# Substack sync

Fetch on crow, publish through the existing GitHub Pages workflow. Substack
blocked GitHub Actions fetches when the local importer was introduced
(`4da3130`), so the feed fetch stays local.

The weekly user timer runs Mondays at 09:00 America/New_York, catching up once
after downtime. This checkout uses HTTPS for `origin`, with a repository-local
credential helper invoking the existing authenticated `/usr/bin/gh auth
git-credential`. The former `github-unpingable` SSH identity was rejected during
the repair; no key was changed or replaced. The user manager must remain running
without a login (`loginctl show-user jbeck -p Linger`).

Run these commands on crow from `/data/git/neutral.zone`:

```sh
# Import only, for review. Existing articles are never overwritten.
./scripts/sync-substack.sh

# On clean main: fast-forward, import, commit new articles, and push.
# A failed push is retried even when there are no new feed items.
./scripts/sync-substack.sh --publish
```

The script needs Bash, curl, Python 3, pandoc, flock, and Git. A failed fetch or
conversion exits unsuccessfully. Each run uses its own temporary feed file and
holds a Git-directory lock. Conversions finish before article files are written.
Publishing refuses a dirty tree or any branch other than main. After reviewing
an import-only run, commit its files before using `--publish`.

RSS contains only the latest 20 posts at the time of this repair. Weekly sync
imports new entries present in that feed; it cannot recover older posts that
have already fallen out. The archive and homepage use the same published Hugo
pages. The archive also lists standalone essays at their original URLs and
offers year links.

## Dependencies on this host

System-wide installation of pandoc requires a sudo password. This checkout has
an ignored `.tools/` installation of Ubuntu's pandoc 3.1.3 and pandoc-data
3.1.3-1 packages instead. `.tools/bin/pandoc` invokes the extracted binary with
its matching data directory. The importer searches this directory after PATH.

The site owner maintains that installation. It is needed by the weekly timer;
retire it after a system pandoc is installed and a real import plus the tests
below succeed. The downloaded `.deb` files are disposable after extraction.

## Install or update the weekly timer

Run on crow as jbeck after integrating the change on main:

```sh
install -m 644 ops/systemd/neutral-zone-sync.service ops/systemd/neutral-zone-sync.timer "$HOME/.config/systemd/user/"
systemd-analyze --user verify "$HOME/.config/systemd/user/neutral-zone-sync.service" "$HOME/.config/systemd/user/neutral-zone-sync.timer"
systemctl --user daemon-reload
systemctl --user enable --now neutral-zone-sync.timer
systemctl --user start neutral-zone-sync.service
systemctl --user list-timers neutral-zone-sync.timer
systemctl --user show neutral-zone-sync.service -p Result -p ExecMainStatus
journalctl --user -u neutral-zone-sync.service -n 50 --no-pager
```

The journal records each outcome; failures leave the service failed. GitHub
Actions records the subsequent Hugo build and Pages deployment. Confirm the
latest run and the new post at <https://neutral.zone/> before calling a publish
complete. These commands use crow's user bus, so a restricted agent sandbox
may require execution approval.

## Checks and rollback

```sh
PATH="$PATH:$PWD/.tools/bin" python3 -m unittest discover -s tests -v
bash -n scripts/sync-substack.sh
# Use Hugo 0.145.0, matching .github/workflows/hugo.yml.
hugo --gc --minify
```

The tests use real Git repositories and pandoc, with a local feed fixture in
place of the network. They cover repeat imports, failed fetch/conversion,
refusal of unfinished work, publishing, and retrying an unpushed commit.

To stop automatic publishing, run `systemctl --user disable --now
neutral-zone-sync.timer` on crow. Revert the relevant source commit and push
main to restore the previous Pages build. Existing article URLs are preserved
by the homepage/navigation cleanup.
