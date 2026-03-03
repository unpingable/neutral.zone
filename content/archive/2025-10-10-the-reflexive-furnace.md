---
title: "The Reflexive Furnace"
date: 2025-10-10
---

*Or: Measuring the feedback loop where elite disagreement and institutional defection amplify each other until the system snaps*

<div>

------------------------------------------------------------------------

</div>

When politics "flips," it's not random chaos. It's the political equivalent of an engine overheating until the cooling system fails. What looks sudden from the outside follows predictable patterns---if you know which gauges to watch.

This piece maps the feedback loop where **elite disagreement licenses institutional defection, which forces elites to disagree more publicly, which licenses more defection**---until the damping fails and the system snaps to a new regime. It's happening slowly enough that it feels normal, but fast enough that the warning signs are spiking.

Here's what's actually happening when the system approaches its breaking point.

<div>

------------------------------------------------------------------------

</div>

## TL;DR

-   **Two dials explain most "uh-oh" moments**: EVP (elite variance---how publicly split leaders are) and I₁ (institutional noncompliance---how often orders don't get executed). Each amplifies the other.

-   **That loop behaves like an overheating engine**: push past a tipping point and the system snaps into a new regime.

-   **Early-warning wins**: track variance, autocorrelation, latency collapse, and narrative divergence. They spike before the break.

-   **Don't predict doom; specify falsifiable triggers** and watch them. Publish both a calm baseline (2015--19) and a hot baseline (2022--25).

-   **Your stability score changes your stability**. That's the reflexivity problem. The map pushes on the territory.

<div>

------------------------------------------------------------------------

</div>

## One Concrete Loop (Real Example)

**2025 Immigration Enforcement Crisis**: When the administration began federalizing National Guard units for interior immigration enforcement, multiple governors objected publicly. The federal government overrode state objections and deployed anyway. Those governors had to choose: comply quietly or resist publicly.

Most chose public resistance. That forced *other* governors---who might have stayed neutral---to pick sides. Their public statements became more polarized (EVP climbs). Federal orders to those states then faced more noncompliance: court challenges, "technical difficulties," slow-walking requests (I₁ climbs).

The next deployment order faced even more resistance. Each cycle tightened the loop.

**That's the pattern**: Elite disagreement → institutional defection → more elite disagreement → more defection. Rinse, repeat. You've built a positive feedback between elite split and execution failure.

**If you only remember one thing, remember that loop.**

<div>

------------------------------------------------------------------------

</div>

## What This Feels Like in Real Life

When a system enters "supercritical" territory, here's what you actually see:

-   **Mayors giving press conferences** saying they won't enforce federal laws

-   **Cabinet members publicly contradicting each other** on basic policy within 48 hours

-   **The same court battle playing out in 12 different states simultaneously**

-   **"Technical difficulties" becoming a standard excuse** for not executing orders

-   **Agency heads using air quotes** when discussing official policy

It's not chaos---it's coordinated defection that looks like chaos because no one's coordinating.

That's the pattern this model tracks. Now here's how it works.

<div>

------------------------------------------------------------------------

</div>

## The Engine: A Two-Variable Feedback Loop

I've been working on "political supercriticality"---the idea that a system can lose its damping and flip regimes. The long version had six indicators with historical baselines and thresholds.

Fun, but overbuilt. The behavior that matters collapses to two quantities:

### **EVP --- Elite Variance Proxy**

Dispersion in public positions among elites (cabinet, governors, leadership) on a small set of hot issues. ∈\[0,1\]

Track statements on \~8--10 contested issues: immigration enforcement, election administration, federal authority, Guard federalization, etc. Score each from -1 (oppose) to +1 (support). Calculate within-party dispersion per issue, average across issues, smooth with 14-day moving average.

**Simpler version**: How often do elites within the same party publicly disagree on core issues?

### **I₁ --- Institutional Noncompliance**

Observed rate that orders/policies aren't executed as designed: refusals, injunction-driven pauses, "not our jurisdiction" stall-outs. ∈\[0,1\]

Count three types of events:

-   **Judicial**: Court orders/injunctions/contempt related to policy execution

-   **Administrative**: Refusals to execute federal requests (detainers, data transfers)

-   **Procedural**: Missed statutory timelines, "not our jurisdiction" responses

**Critical distinction**: Not all institutional noncompliance signals breakdown. Courts blocking federal overreach = democracy working. But when compliance becomes geographically clustered (some states always resist, others always comply) and enforcement becomes asymmetric, that's when friction becomes defection. We're measuring **systemic patterns**, not just "federal government faces pushback."

Weight events by legal status:

-   VERIFIED (executed/complied) = 1.0

-   CONTESTED (under appeal/stayed) = 0.5

-   ANNOUNCED (declared but not adjudicated) = 0.25

-   District-only, on appeal = ×0.5 additional reduction

Divide weighted events by total executable federal actions that week to get noncompliance rate.

### **The Reflexive Kernel: EVP ↔ I₁**

Think of this as **political thermodynamics**---specifically, an overheating engine:

-   **EVP is the temperature gauge** --- how hot the messaging is running, how much elites disagree publicly

-   **I₁ is the pressure gauge** --- how much the system is straining, how often parts refuse to execute

-   **The feedback loop is the broken cooling system** --- what should dampen these tensions instead amplifies them

**How the loop works:**

-   **EVP → I₁**: When elites send contradictory signals, local actors don't know what's "really" required → they defect

-   **I₁ → EVP**: When defection becomes visible and successful, elites can't stay neutral → they must publicly pick sides

-   Small damping term prevents everything from instantly exploding (institutions have inertia)

**Why this produces dangerous behaviors:**

The furnace/engine analogy explains three specific dynamics we're seeing:

1.  **Hysteresis** --- once the system overheats, cooling down doesn't instantly restore function (like how a warped engine block stays warped)

2.  **Critical slowing down** --- the system gets "sticky" near the breaking point; responses are delayed and inconsistent

3.  **Sudden flipping** --- small shocks can trigger large transitions when the system is hot enough

Think of governors and agency heads as tiny compass needles. When the system is cool, they mostly point the same direction. But as heat (EVP) increases, eventually the whole array suddenly flips. Small nudges can trigger massive realignments.

*(This maps mathematically to an Ising model at critical temperature---the simplest physics that naturally produces these three behaviors---but you don't need the statistical mechanics to use the framework. In fact, let's not study statistical mechanics.)*

### **Phase Classification**

**Composite = 0.6·I₁ + 0.4·EVP**

-   **SUBCRITICAL**: \< 0.50

-   **CRITICAL APPROACH**: \> 0.50

-   **SUPERCRITICAL**: \> 0.70 with EVP \> 0.40 and I₁ \> 0.30 (sustained)

Near the critical point, you get **critical slowing down**: responses get twitchy and delayed; variance and autocorrelation climb even if means don't move much.

That's your early warning.

<div>

------------------------------------------------------------------------

</div>

## Baselines Are a Choice (Own It)

Run everything against **two baselines** and show both:

-   **Calm (2015--2019)**: pre-Trump/COVID "peacetime"

-   **Hot (2022--2025)**: elevated "new normal"

Against 2015--2019, the U.S. looks near-crisis. Against 2022--2025, it looks elevated-but-managing.

**The model can't tell you which baseline is "correct."** That's a normative choice disguised as a technical one. I publish both; you decide what "normal" means.

The lesson: **always show both**. If your conclusions depend on the baseline, say so---out loud.

<div>

------------------------------------------------------------------------

</div>

## Early-Warning Observables (Portable and Cheap)

You don't have to buy my weights to see the storm coming:

1.  **Latency collapse**: time from scandal/action → formal response shrinks while the variance of response times widens (some responses instant, others never come)

2.  **Autocorrelation climbing**: week-to-week changes stick around longer because the system isn't bouncing back anymore (slow mean reversion)

3.  **Cross-correlation dropping**: official briefings and mainstream outlets stop agreeing on basic facts of the same event (they're describing different realities)

4.  **Binary pockets forming**: more jurisdictions at \~0% or \~100% compliance, fewer in the middle (the "just following orders with reservations" crowd disappears)

5.  **Elite variance spiking**: within-party spread in language and positions rises across multiple issues (leadership can't maintain message discipline)

These are all measurable without a surveillance state or a grant. They're cheap to compute and politically agnostic.

<div>

------------------------------------------------------------------------

</div>

## How to Use This Without Becoming Part of the Problem

### **What This Gets Right**

-   **Structure over noise**: The EVP↔I₁ loop is the engine; the rest are exhaust fumes

-   **Leading signal exists**: EVP tends to move first; noncompliance follows

-   **Reflexivity matters**: Publishing a score can change the score

### **What This Gets Wrong (or at least limited)**

-   **Legitimacy is not observable directly**: We infer it from behavior; that's an epistemic gap (we see the smoke, not the fire)

-   **Stationarity is fragile** (the rules of the game keep changing): Social media, legal innovation, and new tech shift baselines fast

-   **The model can't prove its own consistency**: Just as Gödel showed that any mathematical system contains truths it cannot prove, **any political stability model creates effects it cannot account for**---because publishing the model changes the game. The thermometer heats up the room it's measuring.

The trick isn't to flee formal models; it's to wear their limits on your sleeve.

### **Reflexivity (Observer Effect Hygiene)**

Publishing stability scores **changes elite behavior**. That's not a flaw; it's information.

So I log my own footprint each week:

-   Mentions by media/elites

-   Any suspicious "publish → policy move" chains within 7--14 days

-   If amplification spikes, I switch to ranges, foreground falsification, and avoid single-number headlines

### **Practical Guidance**

-   **Publish ranges, not points**: "0.54--0.79 with low certainty" is honest; false precision is performative

-   **Separate diagnosis from prescription**: This is a weather report, not a call to arms

-   **Log your own observer effects**: If elites start citing your metric, that's part of the data

-   **Keep a standing counter-theory**: What would make today's "elevated risk" look, in hindsight, like a necessary transformation rather than a breakdown?

<div>

------------------------------------------------------------------------

</div>

## Falsification Beats Forecasting

This isn't about predicting the future---it's about recognizing when the safety systems are failing. These are the warning lights that should get everyone's attention.

Instead of a single doom number, here's a **prediction-shaped hole**:

**I'm not telling you when the system will flip.**\
**I'm saying if these measurements do X for Y weeks, then damping has failed.**

### **Supercritical if (any two sustained ≥ 4--8 weeks):**

-   EVP ≥ 0.65 (elite split entrenched across ≥2 core issues)

-   I₁ ≥ 0.07 (effective noncompliance rate)

-   Status-weighted litigation ≥ 25 concurrent cases (with appellate/SCOTUS load)

-   Non-disaster deployments ≥ 200k troop-days/quarter (title-weighted)

-   Latency collapse + variance spike across several institutions at once

If two or more of these persist together, you're in critical approach territory. If they roll off, your damping is still working.

### **Model is wrong if (any two hold):**

-   FY appropriations resolve on time; blocked transfers clear; CRs end

-   Executive complies promptly with injunctions; contempt stays near zero; appellate reversals drop weighted litigation below watch

-   Cross-state federalized deployments end; no new cities in 60--90 days

-   EVP mean-reverts \< 0.50; media--briefing cross-correlation rises ≥ 0.10

### **"What Would Change My Mind?"**

-   Appeal courts reversing key injunctions and rapid executive compliance

-   EVP dropping below 0.50 across two cornerstone issues for a month

-   Fiscal process normalizing without emergency workarounds

-   Troop-day ledger reverting to peacetime levels (non-disaster)

Give me those, and I'll write "the furnace cooled."

<div>

------------------------------------------------------------------------

</div>

## Deployment Ledger (De-Noising Details)

Count **non-disaster** troop-days only when deployments substitute for defecting civil enforcement (Title 10/32; cross-state federalized missions).

**Exclude**: FEMA disasters, wildfire/hurricane response, purely local guard activations without federal orders.

Track within-party dispersion on \~8--10 issues (immigration, election administration, federal authority, etc.). Spikes in EVP often precede measurable noncompliance by weeks.

**Quarterly threshold**: 200k troop-days (title-weighted) sustained for 2+ quarters → critical approach flag.

<div>

------------------------------------------------------------------------

</div>

## Closing: Not Hari Seldon, But...

I'm not building Psychohistory. I'm mapping where damping fails first and what it looks like on the way there. If this post has a vibe, it's **"Wile E. Coyote finally learns physics"**---falling is inevitable sometimes, but you can at least measure when the ground stopped being under you.

This isn't a crystal ball. It's a **thermometer and a pressure gauge**. If the temperature (EVP) and phase fraction (I₁) climb together and stay there, the furnace is past damping. What happens next is politics, not physics.

If you're a physicist or methodologist: the kernel is the thing to argue with. If you think EVP isn't truly leading---or that I₁ is mostly lawful friction rather than defection---say where the measurement should move. That's how we keep this honest.

And if you're just here for the theater: yes, it's a little absurd. But it's the productive kind---the kind that leaves you with tests you can run next week.

<div>

------------------------------------------------------------------------

</div>

### **Limitations**

This is structure-first modeling. Legitimacy is inferred not observed. Baselines are normative choices. EVP calibration is young. I₁ depends on defensible but contestable status weights. The falsification triggers exist so you can see exactly where disagreement should move the numbers.

*Full technical details on measurement protocols, the two-variable kernel code, and CSV schemas available on request. No, seriously.*
