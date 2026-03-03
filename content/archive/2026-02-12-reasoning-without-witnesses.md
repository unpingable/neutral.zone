---
title: "Reasoning Without Witnesses"
date: 2026-02-12
---

Gary Marcus is [right about the failures and wrong about the stakes](https://garymarcus.substack.com/p/breaking-llm-reasoning-continues). A new Caltech/Stanford review catalogs all the ways LLMs still can't do reliable causal inference, logical reasoning, or avoid hallucination under pressure. Marcus points to this as proof that scaling won't work, that we need different architectures, that Silicon Valley is selling snake oil.

He's diagnosing a cognitive deficiency. The actual problem is a legitimacy defect.

Those are orthogonal axes, and only one breaks institutions at scale.

## The Frame Nobody Wants to See

Marcus's critique lives entirely inside the model boundary. Even when he gestures at symbolic systems or hybrid architectures, he's still focused on fixing the reasoning engine itself. Get the cognition right, the outputs become trustworthy.

That assumption is actually the problem.

Here's what humans figured out a long time ago but never had to formalize mechanically: **no agent---human or machine---gets to be the sole authority on irreversible state transitions in shared systems.**

This isn't about whether models can reason. It's about whether reasoning outputs should be self-legitimating.

Two different things. The distinction matters.

## What Self-Authorization Actually Is

I'm not talking about private cognition. Think whatever you want. Reason freely. Generate hypotheses. That's all bounded, reversible, local.

I'm talking about *closure*: the moment a question gets answered, a state gets written, a decision becomes irreversible, a claim enters shared reality as fact.

That distinction already exists everywhere that matters:

Science has peer review because individual reasoning is fallible. You can believe your theory; you can't publish consensus alone. Law has procedure and appeals because even judges make mistakes. Aviation doesn't let pilots investigate their own crashes. Software engineering doesn't let you approve your own PR to production. Finance doesn't let you audit yourself.

Generation and authorization are separate. Reasoning is **individual**; legitimacy is **procedural**.

We've never allowed pure self-authorization at scale in high-stakes domains. We didn\'t forget the principle. We got seduced by the speed. Externalizing legitimacy is slow and expensive. LLMs offered the illusion of a shortcut: a system that is its own judge and jury.

## Why LLMs Made This Urgent

The problem isn't unique to LLMs. They just made the failure mode impossible to ignore.

They produce fluent, confident outputs at scale. Those outputs look like they came from a process that verified itself. The chain-of-thought reasoning feels like legitimacy. And we have no mechanical way to distinguish "this sounds right" from "this is admissible."

Marcus is correct that the reasoning fails. But even with perfect symbolic systems that never make logical errors, we'd still need external legitimacy structures.

The issue isn't "are the conclusions correct?" The issue is "who decides when a question is closed?"

Legitimacy scaffolding already exists in practice. Most serious deployments have human-in-the-loop review, fact-checking pipelines, citation requirements. The norm that "the model said X" isn't admissible on its own is doing real work in professional contexts.

What's missing is systematic, composable, machine-speed enforcement. Current approaches are local patches: case-by-case review, domain-specific guardrails, ad-hoc structures. That worked when deployment was limited and human oversight was cheap.

It breaks when systems operate autonomously at scale.

## Proposals vs. Legitimacy

Here's the reframe: **LLMs aren't reasoning systems. They're proposal engines.**

Proposals are useful. Humans are proposal engines too! We generate ideas, make claims, suggest solutions. Then those proposals get vetted, witnessed, reviewed, or rejected through processes external to whoever generated them.

The mistake was treating generation as authorization. Conflating "the model produced an explanation" with "the conclusion is legitimate."

Separate those and everything changes. Hallucination becomes tolerable---it just fails gates. Reasoning errors become measurable instead of catastrophic. Smarter models become useful but non-sovereign. The question shifts from "is this model good enough?" to "what makes a state transition admissible?"

Marcus isn't asking that question. But it's the one that matters.

## What This Requires

Irreversible state transitions in shared systems require witness attestation.

Not every decision. Not private thoughts. Just the ones that affect others, can't be reversed, claim to close questions authoritatively, or write themselves into history.

The mechanics of this---multi-sig logic, cryptographic attestation, or just a bored human with a checklist---are boring. But they\'re the ***only*** things that turn a prediction into a record. The specifics range from human review to cryptographic attestation. The point is that legitimacy must be externalized.

We already know this. We just haven't formalized it for systems operating at machine speed.

## The Gap Marcus Isn't Seeing

Marcus wants better reasoning. He's probably right that scale alone won't deliver it.

But even if he gets everything he wants---perfect causal models, flawless symbolic reasoning, zero hallucination---the result is more dangerous if it's still self-authorizing.

Perfect reasoning without external legitimacy just produces more sophisticated closure without witnesses. The model that can flawlessly explain why its fabricated citation is correct is harder to catch than one that obviously hallucinates. Competent-sounding wrongness scales worse than obvious wrongness.

The issue isn't that LLMs are bad at reasoning. The issue is letting any system---no matter how good at reasoning---operate as if generation and authorization were the same thing.

That was always going to break. AI just forced us to notice.

## Where This Goes

Reasoning capability and closure authority are separate problems. We've been trying to solve the second by improving the first.

Doesn't work. Never worked for humans either. That's why we built legitimacy structures in the first place.

The correct response isn't "build better oracles." It's "stop treating any agent as an oracle."

Treat outputs as proposals. Make legitimacy procedural. Separate generation from authorization. Build systems where state advances through attestation, not confidence.

This applies to current LLMs. It applies to whatever architecture comes next. It applies to human experts operating at scale. It's not a critique of any particular approach to reasoning---it's a constraint on what reasoning outputs are allowed to do by themselves.

The gap was always there. AI just made it too loud to ignore.
