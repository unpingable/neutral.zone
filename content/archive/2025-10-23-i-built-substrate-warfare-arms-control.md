---
title: "I Built Substrate Warfare Arms Control in an Afternoon"
date: 2025-10-23
---

## How I Ended Up Here

On October 19th, I was scrolling through Twitter when a Reuters article caught my eye: [China had accused the US NSA of spending 27 months inside their National Time Service Center](https://www.reuters.com/world/china/china-accuses-us-cyber-breaches-national-time-centre-2025-10-19)---the facility that tells all of China what time it is.

I do this sometimes. I see a piece of news that hits the intersection of infrastructure, security, and geopolitics, and I think "there's a Substack piece in this." So I opened Claude and started what I thought would be my usual process: analyze the technical details, map out the threat model, write something thoughtful about why this matters.

Except this time, I didn't stop at analysis.

A few hours later, I had a complete, deployable framework for detecting and attributing substrate-level attacks on timing infrastructure. Not a proposal. Not a thought experiment. An actual implementation: cryptographic attestation protocols, operational runbooks, week-by-week deployment timelines, threat models that account for key compromise and pre-positioned access.

I built this using Claude and ChatGPT. I've spent decades in tech infrastructure, but this isn't my domain. I'm not a cryptographer nor a security researcher. And the fact that I could do this, that a single person with AI tools could produce what human technical reviewers have since called a sound starting point, is the part that's keeping me up at night.

Not because the framework exists. Because of what it means that it *could* exist, built this way, this fast.

## What I Was Actually Looking At

Let me back up and explain what substrate warfare actually is, because most people---reasonably---don't think about timing infrastructure at all.

When China accused the NSA of compromising their time service, they weren't talking about hacking a server or stealing some data. They were describing something more fundamental: an attack on the shared reference that allows an entire civilization's technical systems to maintain consensus about reality.

Here's why timing matters: every computer system needs to agree on when events happened. Financial markets need microsecond-accurate timestamps to determine which trade came first. Power grids use synchronized clocks for fault detection---if a relay thinks a fault happened 10 milliseconds earlier than it actually did, the whole coordination system breaks. Telecommunications networks can't route packets properly without precise timing. GPS receivers derive both position *and* time from satellite signals.

Most cybersecurity work focuses on endpoints: servers, credentials, applications, data. These are the paint on the walls. Timing infrastructure is the foundation. And if you compromise the foundation, you don't need to attack individual systems---you attack the shared reference that all of them depend on.

The elegant horror of substrate attacks is that they're subtle and they scale. You don't shift time by seconds. Microseconds or milliseconds are enough. A tiny sustained frequency adjustment---measured in parts per million---accumulates over hours into meaningful offsets. That's enough to reorder financial transactions. Enough to corrupt forensic timelines so that incident reconstruction becomes impossible. Enough to desynchronize distributed systems that depend on consensus protocols.

And because you compromised the *upstream source*, every system downstream inherits the manipulation automatically. No need to breach individual endpoints. You poisoned the well.

## The Gap That Shouldn't Exist

As I started mapping out the threat model, I kept running into the same problem: *there's no good answer to this.*

Detection is hard because small timing drifts look like normal behavior---oscillator aging, atmospheric interference with GPS, network jitter. Attribution is nearly impossible because even if you notice something's off, proving it was intentional and not just hardware failure requires evidence that can survive scrutiny. And even if you somehow manage both detection and attribution, response is entirely political. There are no agreed-upon frameworks for consequences. International cyber norms are vague. Enforcement is selective. Attribution claims rely on classified intelligence that can't be shared publicly.

The result is a domain where sophisticated actors can pre-position access with minimal risk, maintain it indefinitely, and activate manipulation only when tactically useful---with plausible deniability throughout.

I thought I was writing an essay about *why this gap exists*. But somewhere around hour two of the conversation, we stopped analyzing the problem and started solving it.

## What We Built

The system addresses all three failure modes---detection, attribution, response---through a combination of cryptographic attestation, cross-validation against independent sources, and a framework for converting technical proof into political consequence.

**The core idea:** if you force an attacker to maintain coherence across multiple independent systems simultaneously, manipulation stops being invisible. It becomes provably contradictory.

**The approach:**

The system forces attackers to maintain consistency across multiple independent sources simultaneously. Devices generate cryptographically signed telemetry using both long-term hardware keys and short-lived ephemeral keys that get pre-published and discarded. Steal the long-term key? You still can't forge historical records---you'd need ephemeral keys that no longer exist.

The system cross-validates against independent sources: different GPS constellations, authenticated network time, off-network witnesses. When sources disagree in specific patterns---two grandmasters drift together but diverge from independent witnesses---that's selective manipulation, not hardware failure.

Anomalies trigger forensic bundles: signed telemetry, network captures, timing traces. These go to rotating labs across multiple nations. Labs apply published methods, produce verdicts, and when enough agree, pre-defined consequences trigger automatically.

Make it expensive for attackers to maintain "clean" manipulation by forcing them to compromise multiple independent systems across different trust domains.

## Why This Actually Works (Even When Everything Goes Wrong)

If this sounds complicated, that's because substrate defense *has* to be. The threat model assumes the worst: attacker present at Day Zero, stolen keys, persistent access.

Traditional security fails here. This doesn't, because it forces real-time consistency across:

-   Multiple independent witnesses from different vendors

-   Freshness proofs tied to live hardware (real-time access required, not just stolen keys)

-   Cross-device correlation (drift matrices catch selective manipulation)

-   Tamper-evident history (edit one record, break the entire public chain)

The attacker needs to control *every* validation path simultaneously, in real-time. That's expensive and creates detection opportunities.

And critically: multilateral lab verification converts technical detection into political consequence. Pre-agreed automatic responses sidestep the "attribution debate" that currently protects sophisticated actors.

## The Part That Should Scare You

Here's what I keep coming back to.

I built this in an afternoon. I'm not a cryptographer. I have no specialized training in timing infrastructure, attestation protocols, or arms control policy. I'm someone who's worked in tech infrastructure, got curious about a news story, and started a conversation with two AI systems.

Within a few hours I had:

-   Threat models accounting for internal attacks and key compromise

-   Cryptographic protocols with dual-key signing and freshness proofs

-   Multi-source witness correlation with drift analysis

-   Forensic specifications and deployment runbooks

-   Working code (Python, systemd, TPM integration)

-   Policy framework bridging detection to accountability

The AI systems handled synthesis and rapid iteration across domains. Human technical reviewers I've consulted haven't found fatal flaws in the core architecture. I'm sure deployment would surface issues---this isn't battle-tested. (We haven't added things like input validation, either. This is pure proof of concept.) But the foundation appears to be sound.

**This should not have been possible.**

What used to require weeks of work by specialized teams can now be done by one motivated person in a few hours. There's still likely weeks or months of follow-on validation and policy meetings involved in sanctifying the work, don't get me wrong. But the barrier to entry for state-scale technical-policy work has collapsed.

And I'm not special. I'm just someone who knows how to have a productive conversation with an LLM and iterate rapidly on complex problems. Which means anyone with similar skills can do this now.

The implications are unavoidably dual-use:

-   **Defensive:** Individuals or small teams can build sophisticated security frameworks that previously required institutional resources

-   **Offensive:** The same capability compression applies to threat actors designing novel attack vectors

This isn't about whether AI systems are "intelligent" or "creative." This is about *capability compression*. The knowledge required to build something like this exists, distributed across research papers, RFCs, security conference talks, and open-source projects. LLMs have ingested that knowledge base. What they provide is rapid synthesis and iteration across domains that would normally require assembling a cross-functional team.

We're entering a regime where the bottleneck isn't "do we have the expertise?" but "do we have the judgment?"

## What This Generalizes To

Here's where it gets worse.

I didn't set out to build a "timing infrastructure security framework." That just happened to be the domain where I started. But as the system took shape, I realized the architectural pattern---multi-source witness correlation, attestation resilient to key compromise, reproducible forensics converting technical proof to political consequence---isn't specific to timing.

It's a template for substrate defense that applies to *any* foundational layer with these characteristics:

-   Centralized authoritative sources (small number of trust anchors)

-   Downstream dependencies (compromise cascades to everything)

-   Subtle manipulation (hard to distinguish from normal behavior)

-   Catastrophic impact (civilization-scale effects)

Other substrates that fit this pattern:

-   **DNS root authorities** (redirect traffic globally)

-   **PKI certificate authorities** (enable widespread man-in-the-middle)

-   **Software package registries** (poison npm, PyPI supply chains)

-   **GPS augmentation systems** (spoof navigation)

-   **Financial settlement networks** (manipulate SWIFT, ACH transaction ordering)

-   **AI model registries** (backdoor widely-deployed models)

I'm not claiming I've solved all these domains. I'm observing that the solution architecture I stumbled into for timing infrastructure reveals a *template*. Whether adapting it to other substrates is straightforward or requires significant rework is an open question.

But the template exists now. Someone built it in an afternoon using publicly available AI tools.

If I could do this, so can anyone else. Including actors with worse intentions.

## What I'm Looking For

I built it on my own time, my own hardware, using public AI systems. I've been working in tech infrastructure for decades, but I'm not a researcher. I don't have institutional backing or connections to national labs.

I know I can't just sit on this. The gap is real. The China/NSA timing story---whether those specific allegations are accurate or not---demonstrates that sophisticated actors are already thinking about these attack surfaces. Defensive frameworks should be public before offensive playbooks become widespread.

If this problem space is part of your work, I'm looking for specific forms of collaboration:

1.  **Peer Review:** Security researchers and protocol experts to critique the technical design and review the implementation.

2.  **Pilot Partners:** Infrastructure operators (time authorities, exchanges, telecom backbones) willing to discuss a controlled, confidential pilot deployment.

3.  **Policy Guidance:** People with experience in standards bodies or national cybersecurity policy who can advise on paths to formalization.

I don't know if this specific implementation is the right answer. Maybe it needs significant refinement. Maybe someone with more resources and legitimacy should take it and improve it. Maybe there's a fatal flaw that only surfaces under real conditions.

But the conversation has to start somewhere.

Part of this is documentation. The experience itself matters. The fact that this kind of work can now be done by individuals using AI tools represents a shift in how technical-policy problems can be addressed. Whether that's net-positive or net-negative probably depends on who moves first.

And part of this is me thinking out loud, trying to figure out what "responsible" looks like here. If substrate-level attacks are becoming the next frontier---and the evidence suggests they are---then we need defensive frameworks. But the path from "I built something in my living room" to "this protects critical infrastructure" isn't obvious.

I don't have clean answers yet. But I do know why I'm writing this now, publicly, before I've figured out the "right" path.

Because silence is a choice. And right now, silence means:

-   Defensive frameworks stay bottled up while offensive capabilities proliferate

-   Institutions that could deploy this don't know it exists

-   The gap remains, and sophisticated actors keep exploiting it

I'm publishing this because the capability to build something like this---quickly, individually, using accessible tools---is not going away. Someone demonstrated it exists. Others will follow. The question is whether defensive frameworks get built and deployed before offensive playbooks become widespread.

I don't know if this specific implementation is the right answer. Maybe it needs significant refinement. Maybe someone with more resources and legitimacy should take it and do it better. Maybe there's a fatal flaw that only surfaces under real-world conditions.

But the conversation has to start somewhere. And it seems like that somewhere is here, now, with someone who accidentally built something that shouldn't have been possible.

The window for getting ahead of this might be shorter than any of us would like.

<div>

------------------------------------------------------------------------

</div>

*If you can help with any of the above, reach me at: substrate.pilot@protonmail.com*
