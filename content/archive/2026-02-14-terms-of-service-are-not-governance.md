---
title: "Terms of Service Are Not Governance"
date: 2026-02-14
---

*The Pentagon reportedly used an AI model in a military operation with a reported death toll in the dozens. The vendor can't safely ask if it's true.*

<div>

------------------------------------------------------------------------

</div>

On February 13, 2026, the [Wall Street Journal reported](https://on.wsj.com/3OhxgEK) that the Pentagon used Anthropic's Claude during the classified operation to capture Nicolás Maduro. [Reuters repeated the claim](https://www.usnews.com/news/world/articles/2026-02-13/us-used-anthropics-claude-during-the-venezuela-raid-wsj-reports). Couldn't independently verify it. [Axios added the detail that matters](https://www.axios.com/2026/02/13/anthropic-claude-maduro-raid-pentagon): sources said Claude was used during the active operation --- not just in preparation --- and when Anthropic inquired whether their system had been deployed, the Pentagon's response was not reassurance. It was irritation.

A senior administration official [told Axios](https://www.axios.com/2026/02/13/anthropic-claude-maduro-raid-pentagon) the Department of Defense would be "reevaluating its partnership" with Anthropic --- not because AI was used in a raid where Cuba says 32 of its officers assigned to protect Maduro were killed, but because the company had the temerity to ask.

Read that again. The vendor's crime was requesting compliance visibility into their own product.

From the Pentagon's perspective, this has its own logic. A vendor requesting operational visibility inside a classified environment isn't "oversight" --- it reads as a security architecture violation. A viewport into a SCIF is a hole in a SCIF. And that's exactly the problem: their security model makes external governance structurally impossible. Policy compliance on classified systems is unfalsifiable by design.

<div>

------------------------------------------------------------------------

</div>

## What We Know, and the Shape of What We Don't

The factual floor is thin and load-bearing:

Claude was reportedly used in a military operation --- [Reuters reports](https://www.usnews.com/news/world/articles/2026-02-13/us-used-anthropics-claude-during-the-venezuela-raid-wsj-reports) the WSJ claim places access through Anthropic's partnership with Palantir, on classified networks. Anthropic itself has [publicly marketed this exact configuration](https://www.anthropic.com/news/anthropic-and-the-department-of-defense-to-advance-responsible-ai-in-defense-operations): Claude integrated into "mission workflows on classified networks" with partners like Palantir. Reuters has [separately reported](https://www.usnews.com/news/top-news/articles/2026-02-11/exclusive-pentagon-pushing-ai-companies-to-expand-on-classified-networks-sources-say) that the Pentagon is pushing AI companies to make their models available on classified systems without many of the standard restrictions labs apply to ordinary users.

What we don't know is everything that would make accountability possible.

We don't know what "used Claude" means in operational terms --- summarization, translation, entity resolution, query interface, recommendation engine, something else. We don't know whether the model's outputs shaped decisions or merely compressed briefings. We don't know whether Anthropic's usage policies --- which explicitly prohibit facilitating violence, developing weapons, or conducting surveillance --- were technically enforced inside the classified environment, or existed only as contract language in a filing cabinet in San Francisco.

We don't know whether anyone, anywhere, maintained a replayable record --- prompt, retrieved corpus, model output, downstream consumer --- sufficient to reconstruct what happened and why.

The absence of these answers is not an accident. It is the system working as designed. Classification doesn't just protect secrets. It protects process from scrutiny.

<div>

------------------------------------------------------------------------

</div>

## "Just Summarization" Is Not a Safe Category

The instinct will be to triage this into familiar bins. If Claude "just" summarized situation reports or translated intercepted communications, then it's a tool, not a weapon. If it recommended targets, that's different.

This framing is wrong, and it's wrong in a way that matters.

A language model integrated into a fused intelligence environment doesn't need to issue commands to reshape outcomes. It needs to do exactly three things:

First, compress time. Faster synthesis produces faster decisions. Faster decisions leave less room for adversarial doubt, for the analyst who says *wait, that doesn't match*, for the institutional friction that sometimes prevents catastrophic mistakes. When you accelerate the narrative, you accelerate the action. The latency between evidence and decision is not dead time. It's where judgment lives.

Second, launder uncertainty. Raw intelligence is messy, contradictory, provisional. It arrives in fragments from sources of varying reliability, saturated with jargon and hedging and gaps. A language model takes that mess and produces "a coherent narrative" --- well-structured, grammatically clean, authoritative in tone. The problem is that coherence is not accuracy. A well-written briefing *feels* more certain than the underlying evidence warrants. The model doesn't lie. It irons the wrinkles out of reality, and the wrinkles were load-bearing.

Third, become the interface. Once an LLM is the easiest way to interrogate a data environment, it becomes the default path to reality. Operators query the model instead of the underlying system because it's faster, more intuitive, more pleasant. At that point, the model is no longer a tool sitting beside the analyst. It's the choke point between the analyst and the world. Whatever the model doesn't surface effectively ceases to exist.

None of this requires autonomy. None of it requires the model to "make decisions." It just requires the model to mediate the evidence-to-action pathway without anyone maintaining independent access to the ground truth underneath.

The analogy isn't an autopilot flying the plane. It's an instrument panel that quietly rounds the numbers.

<div>

------------------------------------------------------------------------

</div>

## The Governance Paradox

Anthropic's usage policies say Claude cannot be used to facilitate violence, develop weapons, or conduct surveillance. These are clear statements. They are also, in the context of classified military deployment, structurally unenforceable.

Here is the problem. A usage policy is a constraint. A constraint requires observation and enforcement to be real. Classified environments are, by design, systems where outside observation is prohibited and internal enforcement is politically selective. You cannot audit what you cannot see. You cannot enforce a policy inside a substrate that treats your request for compliance information as a security threat.

So when Anthropic says "any use of Claude is required to comply with our Usage Policies," what does that sentence actually mean inside a SCIF? Who checks? Who logs? Who has standing to object? And if the answer to all three questions is "the customer, who just told you to stop asking" --- then the policy is not a governance mechanism. It's a press release.

This is not a novel observation. It's the central problem of every regime where the entity being regulated controls the information environment. Arms manufacturers have lived in this gap for decades. What's new is that the product in question is not a missile or a radar system. It's a general-purpose cognitive tool whose behavior changes based on context, whose outputs are probabilistic, and whose integration into operational workflows creates dependencies that are invisible until they fail.

<div>

------------------------------------------------------------------------

</div>

## Procurement Power Eats Principles

Axios frames a \$200 million contract and quotes Defense Secretary Hegseth's reported remarks that the Pentagon won't use models that "won't allow you to fight wars." Safety is a negotiating position. It has a price tag.

The structural trap for Anthropic specifically is that they are, by all reporting, the only AI company currently deployed on the military's classified platforms --- via Palantir, whose entire business model is turning the world into queryable objects. Being first in classified environments means you absorb every scandal, establish every precedent, and normalize every pattern. OpenAI, Google, and xAI get to watch Anthropic navigate the minefield and then walk the cleared path with looser restrictions and less public commitment to safety. In procurement terms, the Palantir integration makes Anthropic a component supplier inside someone else's platform --- and component suppliers don't get governance standing once the part ships.

The administration's threat to "reevaluate the partnership" if Anthropic keeps asking questions is not a bug. It's the mechanism. Vendor oversight doesn't get defeated in a dramatic confrontation. It gets extinguished by procurement logic: either you're a reliable supplier, or you're a liability. There is no third option where you supply capability to classified systems and also maintain meaningful compliance visibility.

Every defense contractor in history has faced this choice. Most of them made it a long time ago.

<div>

------------------------------------------------------------------------

</div>

## What "Governed" Would Actually Require

Not new policies. Not better mission statements. Not another blog post about responsible AI. For the word "compliance" to mean anything at all inside classified deployment, you would need:

Replayable provenance: an immutable record of every prompt, every piece of retrieved context, every model output, and every downstream consumer, sufficient to reconstruct the chain from evidence to action after the fact. Without this, "compliant" is an adjective with no verb behind it.

Boundary controls: hard limits on what categories of queries or actions are even possible within a given deployment, enforced at the system level rather than the policy level. Not "the model shouldn't do X" but "the system cannot do X," in the same way that a read-only filesystem cannot write. Without this, "policy" is just preference.

Classification-surviving enforcement: some mechanism by which constraints persist inside classified environments independent of the customer's willingness to honor them. And if that phrase sounds like a technical oxymoron --- if the very nature of classification makes independent enforcement impossible --- then "safety-first AI on classified networks" is an oxymoron too, and we should say so plainly rather than pretending the contract language bridges a gap that is structurally unbridgeable.

If the constraint can be classified away, it isn't a constraint.

<div>

------------------------------------------------------------------------

</div>

## The Question That Bites

There is a version of this story that's about Claude specifically --- about Anthropic's positioning, about the irony of a "safety-first" company's product reportedly deployed in a military raid. That version is satisfying and small.

The larger version is about what happens when any vendor ships cognitive capability into an environment where their own governance model becomes unobservable. Anthropic is the case study. The diagnosis is universal. Every AI company building government partnerships is walking into the same structural trap. Most of them aren't even pretending to resist.

The question worth holding onto is not "did an AI pick targets." It's simpler and worse:

If the vendor cannot ask "was my system used," then what is a usage policy for?

If the answer is "marketing," then we should stop pretending these companies govern their products and start asking who actually does.

Right now, the answer is: the customer. On classified systems. With no outside visibility.

That's what 'reevaluate the partnership' means in practice.

<div>

------------------------------------------------------------------------

</div>

*Independent analysis; no affiliation with Anthropic, Palantir, or DoD.*
