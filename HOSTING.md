# Hosting topology

neutral.zone is split across two providers. This file is the actual map.
The public-facing footer note is dry on purpose; this is the operator copy.

## Apex (GitHub Pages)

- `neutral.zone` → A record to GitHub Pages (`185.199.10x.153`)
- `www.neutral.zone` → CNAME to apex
- Source: this repo (Hugo build, deployed via GitHub Pages)

## Subdomains (Linode + Caddy)

- `labelwatch.neutral.zone` — static ATProto label reports. Public.
- `stechometer.neutral.zone` — client-side activity gauge. Public.
- `nq.neutral.zone` — reverse proxy to internal NQ surface (`172.17.0.1:9848`).
  Intentionally unlisted on the public index. In active use by tooling.

## Reserved (DNS only, not served)

- `driftwatch.neutral.zone` — A record reserved, no Caddy block.
  Hitting it currently fails handshake / 404s through Caddy default.

## Boundary

- GitHub Pages owns the foyer (apex + writing).
- Linode owns the machinery (tool subdomains, proxies, anything that
  needs Caddy routing or live services).
- The split is deliberate. Consolidation triggers are listed below;
  none are active.

## Consolidation triggers (none active)

- Same deploy path needed for all public artifacts.
- Apex needs Caddy routing/proxy behavior.
- GitHub Pages becomes annoying for redirects/headers.
- Split-brain DNS/hosting becomes a real cost, not an aesthetic itch.
