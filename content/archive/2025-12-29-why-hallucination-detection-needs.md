---
title: "Why Hallucination Detection Needs a Clock"
date: 2025-12-29
---

Most hallucination detection methods fail because they treat generation as a static object rather than a dynamical process. This leads to detectors that are expensive, late, and blind to the earliest---and most preventable---failure modes.

Current approaches are post-hoc and semantic. They ask *what* was said, not *how it unfolded*. SelfCheckGPT samples multiple generations and checks consistency. Semantic entropy clusters outputs by meaning and measures uncertainty. Both analyze the finished product.

This misses failure modes that appear before semantic divergence---patterns visible in the generation dynamics that predict hallucination before the model finishes speaking.

<div>

------------------------------------------------------------------------

</div>

## Hallucination is not a linguistic error. It's a dynamical one.

Language models are sequential decision systems. At each step, they commit probability mass to tokens based on accumulated context. Well-behaved systems preserve certain invariants under this process. Hallucinations correlate with violations of these invariants---specifically, temporal incoherence.

The pattern: confidence rises without corresponding evidence accumulation.

In a truthful generation, you expect something like: context establishes constraints → reasoning narrows possibilities → answer emerges with justified confidence. Entropy starts moderate, stays variable during reasoning, drops as the answer crystallizes.

In a hallucination, confidence spikes early. The model commits to an answer before the reasoning phase can plausibly justify it, then backfills. The temporal structure is inverted---effect before cause.

This is physically weird in any accumulation process. And that weirdness is detectable.

<div>

------------------------------------------------------------------------

</div>

## Delta-T: Temporal Debt

Define Δt as a measure of divergence between confidence accumulation and evidence accumulation over generation time.

The intuition: if a system is committing (increasing confidence) faster than it's grounding (accumulating justification), it's taking on debt. That debt predicts failure.

    Δt = ∫(dC/dt - dE/dt)dt

Where C is confidence (operationalized via inverse entropy and commitment persistence) and E is evidence accumulation (harder to measure directly, but proxied through reasoning-phase dynamics such as entropy decay, token transition structure, and phase persistence).

Δt is not intended as a ground-truth measure of correctness, but as a diagnostic for temporal pathologies during generation.

The key insight is that *rate* and *phase* matter, not just absolute values. A model can be highly confident and correct. It can also be uncertain and wrong. What distinguishes hallucination is the *trajectory*---confidence that arrives before its justification.

Hallucinations look like systems taking on temporal debt.

<div>

------------------------------------------------------------------------

</div>

## Why Self-Consistency and Entropy Plateau

SelfCheckGPT requires 5-20 additional generations per query. It's expensive, post-hoc, and blind to consistent hallucinations (where the model confidently repeats the same wrong answer).

Semantic entropy clusters outputs by meaning, which handles paraphrase variation. But it's still analyzing finished outputs, not generation dynamics. It detects uncertainty, not the phase-reversal signature of unjustified confidence.

Both methods detect *outcomes*. They plateau because they can't see *dynamics*.

The temporal structure of generation contains information that output analysis discards. A model that hesitates, reasons, then concludes looks different from one that concludes, then rationalizes---even if the final tokens are similar.

<div>

------------------------------------------------------------------------

</div>

## A Reference Implementation

The code exists. It's not a product; it's a reference implementation of the metric.

Key properties:

-   **Single-pass detection**: No multiple generations required. Features extracted during one forward pass.

-   **Streaming-compatible**: RollingStats implementation supports real-time detection without waiting for generation to complete.

-   **Baseline-normalized**: Different models have different "normal" temporal signatures. The detector calibrates to model-specific baselines.

-   **Multi-invariant**: Temporal coherence is one of four invariants tested. Semantic conservation, epistemic grounding, and irreversibility provide independent confirmation.

Preliminary experiments on TruthfulQA suggest \~75--82% detection accuracy depending on configuration, with lower false positive rates than consistency-based methods. The comparison study is ongoing.

GitHub: \[link when live\]

<div>

------------------------------------------------------------------------

</div>

## Why This Is Open Source

The math is already public across several Zenodo papers. The Δt framework isn't new---I've been using it for control-theoretic and organizational dynamics analysis for a while. This implementation is one application. This detector is intentionally non-interventionist; it observes generation dynamics but does not alter model behavior.

Metrics become standards through adoption, not ownership. If this is useful, someone will reimplement it anyway. **The risk isn't theft; it's distortion---someone renaming the concept while stripping the temporal grounding that makes it work.**

If this is useful, it should be boring, reproducible, and hard to rename.

<div>

------------------------------------------------------------------------

</div>

## What This Is Not

-   Not alignment work

-   Not ethics

-   Not a jailbreak patch

-   Not a safety guarantee

-   Not a product

-   Not a prompt engineering trick

It's a measurement. A way of asking: did this generation follow a temporally coherent path from uncertainty to justified confidence, or did it skip steps?

<div>

------------------------------------------------------------------------

</div>

## This Is About Control, Not Content

The Δt framework comes from control theory and dynamical systems. The same pattern---commitment outpacing grounding---appears in organizational dysfunction, institutional decay, and other coupled systems---but that analysis is outside the scope of this piece.

LLM hallucination detection is one application. The more general claim: temporal coherence requires systems to preserve specific invariants under transformation---temporal coherence, semantic conservation, epistemic grounding, and irreversibility. When any of these break, the system produces fluent output that no longer tracks reality. The companion paper "You Need More Than Just Attention" develops this framework formally and demonstrates that current transformer architectures violate all four invariants structurally.

The detector released here is a reference implementation of **Invariant 1: Temporal Coherence**---detecting when dC/dt exceeds dE/dt during generation. The other three invariants are approximated as supporting signals but not yet implemented with the full rigor of the paper's test protocols. That's future work.

This isn't about what models say. It's about how they get there.

<div>

------------------------------------------------------------------------

</div>

## Where to Find It

-   **Code**: https://github.com/unpingable/delta-t-detector

-   **Papers**:

    -   [You Need More Than Just Attention: Invariant Requirements for Temporal Coherence in AI Systems](https://zenodo.org/records/18039927) (the formal framework)

    -   [The Coherence Criterion](https://zenodo.org/records/17726790) (spectral stability)

Critiques welcome. If the framework is wrong, I'd rather know now.

<div>

------------------------------------------------------------------------

</div>

If the industry is going to talk about model reliability, it needs a clock. This is one attempt to build one.

<div>

------------------------------------------------------------------------

</div>

Update: Representational Coherence (ΔR)

I've since formalized a complementary axis: **representational coherence (ΔR)**, which measures whether commitments survive transformation (compression, translation, formalization).

This matters for hallucination detection because Δt failures (temporal pathology during generation) compound with ΔR failures (commitment loss during transformation). A hallucinated answer that gets summarized loses both the wrong content *and* the diagnostic signals.

Full framework: *Representational Invariance and the Observer Problem in Language Model Alignment* (<https://zenodo.org/records/18071265>)
