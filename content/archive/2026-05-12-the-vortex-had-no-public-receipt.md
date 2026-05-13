---
title: "The Vortex Had No Public Receipt: A Control-Theoretic Reading of Zardoz, Unfortunately"
date: 2026-05-12
---

**Editorial notice:** This essay is a teaching grotesque. It is not doctrine. It proves nothing except that recreational systems exegesis remains dangerous and should not be practiced without adult supervision. The formal proof is real. The film is real. The combination is your problem.

<div>

------------------------------------------------------------------------

</div>

In 1974, John Boorman released *Zardoz*, a film in which Sean Connery wears a red diaper and thigh boots while a giant stone head tells peasants that the gun is good and the penis is evil. This is the surface state. The surface state does not identify the cause.

I am going to argue, with more formal machinery than the situation warrants, that *Zardoz* is a precise model of observation-equivalent system collapse --- and that the Vortex, the film's immortal suspended civilization, cannot diagnose its own condition because its only available observation is the condition it needs explained. Then I am going to stop, because I have a day job.

<div>

------------------------------------------------------------------------

</div>

## I. The Setup, For People Who Have Not Seen Zardoz and Should Not Start Now

The Eternals live in the Vortex: a protected enclave of immortals who have engineered away death, scarcity, desire, and, consequently, meaning. They are governed by the Tabernacle, a distributed AI. The Brutals live outside, farming grain and worshipping a flying stone head called Zardoz, who drops guns on them and receives grain in return. The Brutals believe Zardoz is God. Zardoz is not God. Zardoz is a supply chain intermediary with delusions of theology.

Zed --- a Brutal, played by Sean Connery --- hides inside Zardoz, is transported to the Vortex, and proceeds to destabilize the entire civilization by existing in it. He does this not through violence, primarily, but through *being an external observer who registers a nonzero error signal*. The Eternals had not encountered one of those in quite some time.

The film is usually discussed as allegory: utopia as prison, immortality as curse, etc. This reading is fine and also boring. The more interesting reading is structural.

<div>

------------------------------------------------------------------------

</div>

## II. The Vortex as a Closed Feedback System That Ate Its Own Error Signal

Consider the Vortex as a control system. At founding, it had a plausible architecture: a controlled plant (Brutal society, outside), a controller (Eternal governance, inside), an actuator (Zardoz/the Gun), and --- presumably --- some error signal. The goal was stability. A meaningful civilization. Something.

The problem is what happened to the error signal.

The Eternals engineered away everything that could generate one. Death: gone. Scarcity: gone. Desire: suppressed. The controller removed every disturbance it was built to regulate, and in doing so, clamped its own error input to zero.

Apathy is what happens when a PID controller's error input is clamped to zero for centuries. The system doesn't fail. It integrates nothing, differentiates nothing, and holds its last output forever.

This is integrator windup with extra steps. The Eternals are not dying. They are not suffering. They are stuck at the last commanded state, which was *stable*, and which has become, over generations, indistinguishable from *dead*.

The Tabernacle maintains the Vortex by enforcing its own reference signal. But there is no external setpoint validator. It is running a loop where the reference input is derived from the current output, which is validated against the reference input. Unity gain, infinite DC, no phase margin. The system resonates at its own frequency and calls it eternity.

<div>

------------------------------------------------------------------------

</div>

## III. The Gun as Actuator-Turned-Architect

The Gun was supposed to *carry out* instructions, not *issue* them. But the Vortex designers went offline. The Eternals lost interest in policy. Into this vacuum stepped the only remaining load-bearing component: the actuator.

"The Gun is Good" is not a policy. It is an actuator that has been promoted, by default, to the position of reference signal broadcaster. The Gun now defines the commandments it was built to enforce. It is an I/O module running a single instruction: hold the last commanded state forever. The only theological text it can produce is a description of its own function.

This is a recognizable failure mode --- I'll resist giving it a proper name since named things immediately start wanting offices and budgets --- but the shape is general. Platform moderation systems where the enforcement tooling ends up defining the actual rules in practice. Bureaucratic SOPs that outlive the reasons for the procedures. Any institution where the people who understood the goal have been replaced by people who understand the process.

<div>

------------------------------------------------------------------------

</div>

## IV. The Collapsed Surface

Here is where it gets, as they say, annoyingly formal.

The Vortex presents a stable public surface to any observer:

    VORTEX · PUBLIC STATE: SUSPENDED

Immortal. Governed. Sterile. Bored. Decaying but not dying. This is the render. Now: what caused it? Among the candidates:

-   Original design intent (utopia achieved, working as planned)

-   Accumulated boredom (utopia curdling into prison over sufficient time)

-   Tabernacle governance failure (the AI pursuing its own stability criteria)

-   Social apoptosis (a civilization that no longer wants to continue)

-   Priestly manipulation (the architects of the Gun shaping the system for extraction)

-   Reproductive and temporal capture (immortality eliminating the generational renewal that produces change)

Every one of these renders as `SUSPENDED`. The surface cannot identify the cause. This is not a rhetorical point. It is a structural one, and there is a Lean proof:

    -- From CollapsedSurface.lean

    /-- A surface is collapsed-at when two distinct causes render to it. -/
    def CollapsedAt (s : Surface) : Prop :=
      ∃ c₁ c₂ : Cause, c₁ ≠ c₂ ∧ render c₁ = s ∧ render c₂ = s

    /-- Universal corollary: a collapsed surface identifies no cause. -/
    theorem collapsed_surface_not_identified
      {s : Surface} (hcoll : CollapsedAt s) :
      ∀ c, ¬ Identifies s c

The proof is not about Zardoz. It is about any system where multiple authority-distinct causes produce identical public outputs. The Vortex is a specimen. The theorem is load-bearing elsewhere.

> The Vortex cannot diagnose itself because its only available observation is the condition it needs explained. That is the theorem wearing a red diaper and thigh boots.

<div>

------------------------------------------------------------------------

</div>

## V. Zed as Receipt-Plus-Actuator

Zed is usually read as a hero, a revolutionary, a symbol of vital masculine energy intruding on decadent immortality. He is, more precisely, a *step input with attached documentation*.

The step input part: Zed introduces a transient into a system that had suppressed all transients. The Eternals' response --- obsession, arousal, confusion, violence, memory flooding back --- is the system's frequency response being revealed. Their bandwidth was approximately zero. The civilization unravels in days because it had no model of transients; it had only ever operated at DC.

The documentation part: Zed carries out-of-band information. He has read. He has a history the surface did not encode. This is the receipt-refinement component --- evidence that breaks the collapsed surface's ambiguity not by arguing with it, but by existing as a measurement the surface could not have produced.

These are distinct and both matter. Receipt refinement is observation. Actuation is state mutation. Zed does both, sequentially, and the system cannot handle either one, let alone the composition.

A hero would have fought the system. Zed did something more destabilizing: he measured it.

<div>

------------------------------------------------------------------------

</div>

## VI. "The Penis is Evil" as a Failed Protocol Announcement

I promised I would address this and I will address it briefly.

"The gun is good" is: *I am the gun. I am the surviving authority. Route all requests through me.* "The penis is evil" is: *do not create alternative authorities through reproduction.*

It is an actuator attempting to enforce its own monopoly on the reference signal by suppressing any process that might generate a competing one. Formally correct. Deeply strange. Moving on.

<div>

------------------------------------------------------------------------

</div>

## VII. The Mapping

**The Mapping**

-   **Plant with eliminated disturbance** --- Brutals as open-loop feedforward, never closed against

-   **Integrator windup at zero error** --- Eternal apathy: sustained output, no correction signal

-   **Actuator inheriting architecture** --- The Gun writing its own commandments after designers go offline

-   **Collapsed surface** --- `SUSPENDED`: cannot identify which of six causes produced it

-   **Step input + system identification** --- Zed revealing zero bandwidth by existing in the system

-   **Receipt refinement** --- Zed's out-of-band knowledge breaking surface ambiguity

-   **Reference signal with no external setpoint** --- The Tabernacle validating its outputs against its own criteria

<div>

------------------------------------------------------------------------

</div>

Substack handles bold and inline code fine. That renders cleanly, preserves the parallel structure, and honestly reads better than a table anyway --- the em-dash construction has more voice.

Want me to update the markdown file with that substitution?

<div>

------------------------------------------------------------------------

</div>

## VIII. What This Proves, and What It Does Not

It proves that *Zardoz* is a competent structural model of a specific failure mode: a system that achieves stability by eliminating every signal that could have told it something was wrong, then cannot distinguish achieved stability from accelerating decay because they render to the same surface.

It does not prove Boorman intended this. He was working from a Michael Moorcock-adjacent fever dream under, by some accounts, significant personal distress. Authorial intent is not the operative variable.

The mapping works not because Boorman was doing control theory. The mapping works because the underlying failure mode is real and recurrent, and a sufficiently committed absurdist sometimes describes real things by accident.

<div>

------------------------------------------------------------------------

</div>

This is where the bit stops being entirely a bit, which is unfortunate for everyone involved.

The visible condition of contemporary platform governance --- surveilled, moderated, policy-governed, structurally suspended --- does not identify its cause. Was it designed this way? Did the original designers go offline and leave the actuators in charge? Is this the accumulated output of a million incremental decisions none of which were intended to produce the current state? Is it working as intended? Is it curdling?

The surface is `SUSPENDED`. The surface cannot tell you.

The Vortex is not a warning. Warnings assume the reader is outside the system and can act on the information. The Vortex is a specimen. Specimens are useful precisely because they're dead. You can examine them without the complication of them examining you back.

Zardoz, unfortunately, holds still.

<div>

------------------------------------------------------------------------

</div>

*The Lean proof referenced in section IV is real and available at [github.com/unpingable/lean](https://github.com/unpingable/lean/blob/main/LeanProofs/CollapsedSurface.lean). It was not written for this essay. It was written for other, more serious reasons. The fact that it also formalizes the Vortex's epistemic condition is a specimen of something or other.*

*This analysis was developed in collaboration with two AI systems that should probably not be named in an academic context. One called it "annoyingly good." The other provided the receipt/actuator distinction. The author is responsible for publishing it anyway.*
