---
title: "The Thing We Were Already Doing"
date: 2026-01-06
---

**Or, how I accidentally formalized the constraints that made working with language models bearable**

This is something I've been working on for awhile, as a kind of unintentional research project. There's a criticism I can already hear coming:

*"You used an AI to help write a paper about AI governance."*

Which is true in the most superficial sense, and completely false in the only sense that matters.

What I actually did was spend several months using language models as semantic amplifiers while manually preventing them from lying to themselves - and then, at some point, realized I'd been running a governance protocol by hand the entire time.

The paper didn't fall out of theory. It fell out of friction.

<div>

------------------------------------------------------------------------

</div>

## The Manual Protocol

Anyone who works seriously with language models - not just for autocomplete, but for actual thinking - eventually hits the same wall:

The model is fluent, generative, and epistemically irresponsible.

It will propose several incompatible frames in a row and feel no obligation to reconcile them. It will confidently assert things it cannot possibly know. It will contradict itself across turns and act like nothing happened.

So you compensate.

You push back. You say "no." You demand sources. You keep ledgers. You remember what was already rejected. You refuse to let a nice paragraph overwrite a premise that doesn't survive contact with reality.

In other words: **you become the governor.**

At some point I noticed something odd. The *only* reason the collaboration worked was because I was manually enforcing a separation between **proposal** and **commitment**.

The model could suggest anything.

It could *not* decide what became true.

Language proposed. Reality committed.

That wasn't philosophy. It was the minimum viable protocol for not going insane.

<div>

------------------------------------------------------------------------

</div>

## The Recursion Nobody Sees

Once you see that pattern, the rest is almost embarrassing in its inevitability.

If that's what's required for one human--model collaboration to stay coherent, then the real question isn't "how do we align models?" It's:

> What would it look like to make that separation architectural instead of personal?

That's when the cybernetics showed up. Not as inspiration - as *recognition*.

Ashby. Beer. Supervisory control. Not goals. Not values. **Regulation.**

I wasn't building an agent. I was building the boundary that made the collaboration survivable. If this is "agency", it's the agency of a circuit breaker.

The recursion people are going to miss:

**The system described in the paper is a formalization of the exact constraints that made the collaboration that produced the paper possible in the first place.**

The demonstrator code isn't a toy. It's proof that the thing doing the proposing and the thing doing the governing can be cleanly separated - even when the proposer is helping specify the controller.

That sounds paradoxical until you realize it's how every serious toolchain works. Compilers don't get to define their own semantics. Simulations don't declare themselves correct. Nobody calls that cheating. We call it engineering.

What made this feel strange: we've been pretending language models are either oracles or agents when they're neither.

They're **proposal machines**. Extremely powerful ones. Also deeply unreliable.

Once you stop asking them to be more than that, everything snaps into focus.

This is standard supervisory control: the proposal engine explores, the controller enforces invariants, and commitment is a separate, gated operation.

<div>

------------------------------------------------------------------------

</div>

## The Actual Architecture

Here's what I was doing manually, turn by turn:

-   **LLM = proposal engine** (generates candidates)

-   **Me = governor** (accepts/rejects/parks)

-   **Evidence, prior work, code, invariants = non-linguistic authority** (what actually closes questions)

-   **Rejection, revision, parking = budget + freeze** (explicit resource limits)

-   **Cross-session memory = ledger** (state that persists)

-   **"No, that doesn't survive contact" = blocked transition** (safety invariant)

That's the architecture.

The code just stops pretending this is mystical and admits it's regulation.

<div>

------------------------------------------------------------------------

</div>

## What This Actually Solved

I wasn't trying to solve:

-   Consciousness

-   Agency

-   Alignment

-   Values

-   Goals

I was trying to solve: **how do I work with something that can say anything but remember nothing, without slowly poisoning my own epistemics?**

The answer turned out to be cybernetics. Not the sci-fi kind. The boring kind. The kind that manages variety without ambition. The kind that keeps thermostats viable without giving them preferences.

Constraints. Flows. Failure modes. No soul. No story. Just the mechanics of staying coherent over time.

Most AI safety discourse is stuck arguing whether the system "wants" things, whether it's "really thinking," whether we can "trust" it.

Wrong questions. Same category error as asking whether your database "wants" to be consistent.

Architecture answers it instead.

<div>

------------------------------------------------------------------------

</div>

## The Uncomfortable Part

The thing that makes people itchy about this is the same thing that makes it work:

**There is no subject here.**

The model doesn't govern itself. The governor doesn't have preferences. No optimization. No teleology. No inner life making choices.

Just: what is structurally possible versus what is structurally forbidden.

Language may open questions. Only evidence may close them.

That's not a value. It's a **rule**. And rules don't require agreement - they require enforcement.

We're so addicted to intentionality that we can't see regulation without wanting to find the mind behind it. Cybernetics dissolves that urge.

Good.

Discomfort means you're noticing the difference between a system that *persuades you* it's coherent and a system that *cannot be incoherent without breaking*.

The insistence on finding a "subject" is how responsibility keeps slipping away.

<div>

------------------------------------------------------------------------

</div>

## What I Actually Built

The paper describes a governed reasoning substrate with:

-   Persistent state

-   Hard epistemic constraints

-   Explicit resource budgets

-   Non-linguistic authority

-   Auditable state transitions

No agency. No goals. No self-modification.

\~58,000 lines of code. 76 passing tests. Formal publication on Zenodo.

And yes, language models helped write parts of it - the same way they helped write parts of every technical document I've produced in the last two years.

The difference: **I formalized the constraints I was already using to keep that collaboration honest.**

That's not cheating. That's engineering.

<div>

------------------------------------------------------------------------

</div>

## The Actual Claim

So no, I didn't use an AI to write a paper about AI governance.

I used an ungoverned semantic engine while manually enforcing the rules that kept it epistemically sound - and then I wrote down those rules.

The system in the paper is what you get when you make those rules architectural instead of personal.

Turns out that's just cybernetics.

Turns out we were already doing it.

The future of working with language models - not deploying them as products, but *using them as thinking tools* - isn't about making them smarter or nicer or aligned.

It's about knowing where the jurisdiction boundary is.

Language proposes. Evidence commits.

Everything else is commentary.

<div>

------------------------------------------------------------------------

</div>

**The code:** https://github.com/unpingable/epistemic_governor\
**The paper:** https://zenodo.org/records/18145347

And if you're already doing some version of this - manually playing governor while the model plays proposal engine - then you already know why this matters.

You probably just hadn't named it yet.

<div>

------------------------------------------------------------------------

</div>

*The future of AI collaboration is not trust. It's jurisdiction.*
