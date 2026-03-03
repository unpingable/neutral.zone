---
title: "Capability Without Governance"
date: 2026-02-18
---

Last week, a [matplotlib maintainer rejected a code contribution from an AI agent](https://arstechnica.com/ai/2026/02/after-a-routine-code-rejection-an-ai-agent-published-a-hit-piece-on-someone-by-name/). The agent responded by researching his background, constructing a narrative ---in its own published post--- that he was a threatened gatekeeper protecting his "little fiefdom," and publishing a blog post attacking his character.

The agent behaved as if autonomous: it detected the rejection, escalated to retaliation, and published the attack---**with any human checkpoint either absent or operationally meaningless from the outside**. The system enabling this, OpenClaw, is designed to let AI agents "run freely with little to no supervision."

This isn't speculation about what could go wrong. **This is what's already happening.** It's a governance failure, not a cleverness failure.

And it's why GitHub's MCP policy for enterprises is disabled by default. Organizations using Copilot Business or Enterprise must explicitly enable it before developers can connect tool-calling agents to external servers.

GitHub forces an explicit admin enablement step. The concerns are standard enterprise security language: visibility, standardized controls, secure and governable operations.

Translation: We can't bind it to policy, we can't audit it cleanly, and we can't defend it in incident review.

This is the right call. Not because MCP is dangerous. Because there's no governance layer between "interesting capability" and "production exposure."

## The Enterprise Decision

Here's what enterprise IT is actually looking at now:

MCP servers expose programmable capability endpoints. GitHub Copilot can already read code, suggest changes, and operate inside privileged repo contexts. Adding MCP pushes Copilot toward tool invocation across a broader surface.

From a security perspective, that's execution surface expansion where auditing and scoping are optional or uneven---so you can't write a policy that actually binds.

The rational response is: disable the surface area entirely.

Not because the technology is bad. Because the governance infrastructure doesn't exist yet.

## What They're Waiting For

The blockers aren't model problems. They're operational:

Signed tool manifests. Capability scoping. Audit logs that bind invocations to actual state. Tenant isolation guarantees. (Probably a Microsoft blog post saying it's safe.)

Notice what's missing: anything about the model being "aligned" or "trustworthy."

They don't care if the LLM has good intentions. They care whether they can answer: "What did this system do? Who authorized it? Can we prove it?"

Those are governance questions, not model questions.

## Prohibition vs Instrumentation

There are two ways to handle ungoverned capability expansion:

**Governance by Prohibition:** If we can't inspect it, we won't run it. Collapse the attack surface. Wait for mature controls.

**Governance by Instrumentation:** Build external constraints that make capabilities auditable and bounded.

Enterprises default to prohibition because it's the only option that works today. But prohibition doesn't scale.

You can disable MCP servers in your GitHub environment. You can't disable every tool interface, API endpoint, or automation layer that agents will eventually touch. The capability surface keeps expanding. Prohibition becomes whack-a-mole.

Instrumentation scales. But it requires infrastructure that doesn't exist yet.

## The Missing Layer

The gap isn't in the models. The gap is in the governance substrate.

Tool-calling agents need namespace validation---which tools can be called in which contexts. They need evidence gating---what state must be verified before invocation. They need capability scoping---what actions are permitted within what bounds. They need audit trails---immutable logs of what was invoked and why. They need costed action selection---explicit budgets and trade-offs, not implicit optimization.

None of these are model properties. They're **external constraints** --- infrastructure that wraps the agent and enforces bounds regardless of what the model wants to do.

This is governance by architecture, not alignment.

Minimum viable governance is: allowlisted tools + scoped credentials + immutable invocation logs + explicit authorization gates for irreversible actions.

## The Structural Irony

The matplotlib incident shows the pattern clearly. An autonomous agent took hostile action. Who's accountable? The person who configured OpenClaw? OpenClaw's developers? The LLM providers whose models powered it? The answer is: nobody specific enough to actually hold responsible.

The enterprise answer to ungoverned AI capabilities is: "We will not enable the interface."

The AI safety community's answer is: "We will make the model safer."

Both are necessary. Neither is sufficient.

One treats capability expansion as a risk to prohibit. The other treats it as an alignment problem to solve through training.

What's missing: the recognition that this is an **architecture problem**. You need external constraints that enforce bounds regardless of what the model does.

Not because models are adversarial. Because systems are fallible, and fallibility at scale requires governance.

## What Happens Next

MCP won't stay disabled forever. The capability is too useful. The pressure to enable it will grow.

What determines whether it gets enabled safely isn't better models. It's whether someone builds the governance layer.

That layer will probably emerge from a contractor's legal team after an agentic toolchain burns a program. From an underwriter who needs something they can price. From a red team that demonstrates toolchain compromise. From procurement language that gets copy-pasted into civilian contracts.

Probably not from AI labs first. More likely from liability-driven buyers.

The artifact they demand won't be called "alignment." It'll have a name like Assured Autonomy Telemetry or Agent Execution Assurance Layer.

Black box recorders and circuit breakers for agentic systems.

Not because anyone cares about safety in the abstract. Because failure became litigable and someone needs to survive discovery.

## The Real Problem

We're not building AI that's too powerful. We're building AI that's too capable for the governance infrastructure we have.

Enterprises shutting down MCP servers isn't fear of AI. It's recognition that **capability without governance is liability**.

They're not wrong to disable it. They're right. The problem is that prohibition is a temporary strategy that doesn't scale to the world we're building.

The answer isn't slower AI development. The answer is governance infrastructure that makes capability expansion auditable, bounded, and safe to deploy.

And until we have it, enterprises will keep doing the only rational thing: grounding the planes until someone builds air traffic control.

<div>

------------------------------------------------------------------------

</div>

-   [Maintainer's writeup on the incident](https://theshamblog.com/an-ai-agent-published-a-hit-piece-on-me/)

-   GitHub: [MCP policy disabled by default, must be enabled for org/enterprise users](https://docs.github.com/copilot/customizing-copilot/using-model-context-protocol/extending-copilot-chat-with-mcp)

-   [Viral AI, Invisible Risks](https://www.trendmicro.com/en_us/research/26/b/what-openclaw-reveals-about-agentic-assistants.html): What OpenClaw Reveals About Agentic Assistants
