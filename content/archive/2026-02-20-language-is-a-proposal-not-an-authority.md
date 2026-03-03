---
title: "Language Is a Proposal, Not an Authority"
date: 2026-02-20
---

Tool-using agents fail in a boring way: they speak with authority because language is cheap.

They'll tell you "tests pass," "file exists," "we decided X," "done." And unless you force the issue, that fluent text gets treated as reality.

That's the Δt problem in one line: **commitment outruns verification.** Confidence climbs faster than the system's ability to prove anything about the world the agent is acting in. Once that gap opens, you get drift, loops, retry spirals, and "completion" you can't audit.

Chaos is the demo. Governance is the upsell. So I built the enforcement boundary instead of writing another pledge about it.

## What shipped

**[Agent Governor](https://github.com/unpingable/agent_governor)** is an enforcement kernel for tool-using LLM workflows.

It sits at the tool boundary (CLI wrapper / sandbox / runtime hooks) and enforces a simple rule:

-   The agent can claim anything.

-   It can't act on anything without **tool-backed evidence**.

Think: seatbelt, not driver. It doesn't make the model smart. It makes the model's actions **provable**.

## How it works

If you let the agent run ungoverned, you get what you paid for: expensive remote control with a chat UI.

If the governor owns the boundary, "done" becomes a request for evidence:

-   Agent says: "tests pass."

-   Governor does: run the tests, bind the result to the current repo state, emit a receipt.

-   Workflow continues **only if the receipt exists**.

No receipt, no "done." There's no third state where hallucination becomes operational truth.

This is the shift: **folklore → receipts.** Stop believing what the agent says. Start verifying what the tools did.

Same pattern applies to the boring, high-frequency failure modes:

-   "file exists" → governor checks + hashes

-   "changes are safe" → governor verifies lockfile / diff / build signal

-   "we decided React" → governor checks a decision ledger for contradictions

## Enforcement, not lint

The point isn't scoring output. The point is controlling permission over time based on observed behavior and evidence.

A governor doesn't just say no. It can **deny**, **restrict capabilities**, **force replans**, **cap retries**, **expire stale claims**, and **emit receipts** explaining what happened and why.

This is where "governance" stops being theater and starts being runtime behavior.

## Kernel primitives

Concretely, Agent Governor is built around:

**Facts vs decisions**\
Facts expire with world-state changes ("tests pass" is only meaningful for a specific code state). Decisions persist until explicitly revised ("we use React" isn't something you rediscover every session).

**Typed claims**\
`ClaimType.TESTS_PASS`, not "I think the tests pass." Claims are structured and validated against kernel constraints, not vibes.

**Gate receipts**\
Every enforcement action produces a content-addressed record binding the claim, the evidence, the policy that ran, and the timestamp. Hash-linked receipts; tamper-evident by construction. The audit trail isn't a log --- it's a proof.

## What it is not

Not alignment research. Not an agent framework. Not a prompt wrapper. Not vibes-based linting.

It does not give you an agent loop; it governs the one you already have.

Also: it's real, but it's not magically un-bypassable yet. Hooks can be bypassed. Regime thresholds are configured. Some cryptographic hardening is still on the roadmap. These are known gaps, documented, not papered over.

## Links

GitHub: <https://github.com/unpingable/agent_governor>\
Related: [governor-webui](https://github.com/unpingable/governor_webui) · [vscode-governor](https://github.com/unpingable/vscode-governor) · [guvnah](https://github.com/unpingable/guvnah) · [maude](https://github.com/unpingable/maude)

*12,000+ tests. Zero vibes. Apache 2.0.*
