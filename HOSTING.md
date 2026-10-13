# Hosting topology

> Historical hosting snapshot last changed 2026-05-13. The subdomain and
> service-status statements below are not a current operational inventory.
> Recheck DNS, Caddy and service state before using this page for operational
> decisions; the owning service repositories carry their own dated evidence.

neutral.zone was documented here as split across two providers.
The public-facing footer note is dry on purpose; this is the operator copy.

## Apex recorded in May 2026 (GitHub Pages)

- `neutral.zone` → A record to GitHub Pages (`185.199.10x.153`)
- `www.neutral.zone` → CNAME to apex
- Source: this repo (Hugo build, deployed via GitHub Pages)

## Subdomains recorded in May 2026 (Linode + Caddy)

- `labelwatch.neutral.zone` — static ATProto label reports. Public.
- `stechometer.neutral.zone` — client-side activity gauge. Public.
- `nq.neutral.zone` — reverse proxy to internal NQ surface (`172.17.0.1:9848`).
  Intentionally unlisted on the public index; recorded as used by tooling then.

## Reserved in May 2026 (DNS only, not served)

- `driftwatch.neutral.zone` — A record reserved, no Caddy block.
  At that observation, requests failed handshake / returned 404 through Caddy default.

## Boundary recorded in May 2026

- GitHub Pages owned the foyer (apex + writing).
- Linode owned the machinery (tool subdomains, proxies, anything that
  needed Caddy routing or live services).
- The split was deliberate. Consolidation triggers were listed below;
  none were active in this snapshot.

## Consolidation triggers recorded in May 2026

- Same deploy path needed for all public artifacts.
- Apex needs Caddy routing/proxy behavior.
- GitHub Pages becomes annoying for redirects/headers.
- Split-brain DNS/hosting becomes a real cost, not an aesthetic itch.
