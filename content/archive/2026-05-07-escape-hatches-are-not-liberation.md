---
title: "Escape Hatches Are Not Liberation"
date: 2026-05-07
---

I built a check-engine light for my Linux desktop.

Not as a hobby project. Not as a cute customization. Not because I wanted to live even deeper inside `/proc`, though apparently this is where I live now. I built it because Firefox and Chromium could put enough memory pressure on the system that Wayland would start to lose structural integrity, and the desktop gave me no humane operator surface between "everything seems fine" and "the session has decided to experience mortality."

Linux already knows when this is happening. The kernel exposes pressure stall information. Cgroups know where the offending processes live. `systemd-oomd` exists. Browsers are process forests with enough internal telemetry to qualify as minor governments. The compositor knows when it is suffering. The signals are there.

What was missing was the surface. Or at least one that worked for my needs.

So I made one: a small top-bar indicator that watches memory availability, swap and PSI. When the machine starts crossing into the danger zone, it lights up. If things get worse, it yells. Then I can quit and restart Firefox before the entire desktop eats shit.

This is useful. It's already saved my session more than once.

It's also an indictment.

What I built is not liberation. It is an escape hatch.

Liberation would be a desktop with a coherent resource model. A desktop that protects the compositor and session from runaway applications. A desktop that attributes blame cleanly, exposes meaningful pressure signals and gives the user a recovery path before collapse. A desktop that treats browser memory explosions as bounded failures rather than ambient weather.

Instead, the system gives me observability primitives and lets me assemble a cockpit alarm.

Modern software calls it empowerment when the user is allowed to build their own escape hatch from failures the platform already knows how to detect.

That is the pattern. Once you see it, it is everywhere.

## The workstation used to be a place

There was a time when "workstation" meant something more than a SKU that says "no gamer lighting."

It did not just mean expensive. It did not just mean fast. It meant the machine had a theory of work.

A Sun workstation was not merely a computer with a SPARC CPU. It was networked institutional Unix made material: NFS, X11, serious keyboards, serial consoles, PROM monitors, strange mice, root access in every sense. It assumed the network mattered. It assumed the user might know what they were doing. It assumed the machine was part of an environment.

An SGI was not a PC with a better graphics card. It was a graphics ontology with a case around it. IRIX, MIPS, OpenGL, media pipelines, expensive peripherals and industrial visualization all belonged to the same answer: this is what computing is for.

A NeXT machine had a different answer. A DEC Alpha running VMS had a different answer. A classic Mac desktop publishing setup with a full-page grayscale display had a different answer. Even the hardware ergonomics carried assumptions: what kind of work would happen here, what kind of person would do it, how much of the machine they were allowed to understand.

The old workstation was a bounded instrument for a coherent practice.

Not always a pleasant instrument. Many of these machines were loud, expensive, fragile, idiosyncratic and hostile in very specific ways. Nostalgia edits out the misery: weird SCSI chains, proprietary video, driver archaeology, firmware rituals, manuals that smelled like dust and institutional authority. But the misery was part of the point. The machine had material consequences. Its constraints taught posture.

You did not merely use it. You stood inside its thesis.

That is the part the modern "workstation" mostly lost. The category survived as a purchasing label. The worldview did not.

A Dell Precision or HP Z-series can be a perfectly capable machine. It may have ECC memory, a professional GPU and ISV-certified drivers. It may cost enough to make procurement feel alive. But most of the time, the difference between "workstation" and "desktop" is an accounting boundary: a pro GPU tax, a warranty tier, a driver sign-off and a chassis that does not look like it was designed by a vape shop.

The machine no longer answers the question: what is this for?

It answers: who can expense it?

I didn't really live through the workstation era at its height. I caught its afterimage: enough to understand that these machines had once meant something, not enough to inherit the world that made them necessary.

## Apple preserved the liturgy

There is one partial exception, and it is annoying because it's Apple. Of course.

The Mac Studio has more of the old workstation logic than most machines sold under that name. Not because it is expandable. It is not. Not because it respects the user as a machinist. It very much does not. But because it has a design center.

The silicon, thermal model, enclosure, media engines, unified memory and OS assumptions all point in the same direction. The machine has a thesis. It is a dense, quiet compute brick built around absurd memory bandwidth and specialized acceleration, designed for a particular class of creative and technical workloads.

That matters.

But Apple's version of coherence is sealed. You get the instrument, but you do not get the shop floor. You may bring your work to the altar. You may not rewire the sanctuary.

Apple preserved the workstation as liturgy. The old workstation was a shop floor.

That distinction is the wound.

The old Sun, SGI, DEC and NeXT worlds were not open in some simplistic modern sense. They were proprietary, expensive and often institutionally locked down. But they expected a different relationship between user and machine. The serious user was allowed, even required, to understand the system's internals. Root was not a decorative status. The machine's coherence did not depend on forbidding the operator from touching the sacred parts.

Apple preserved the form of coherence while narrowing the user's standing inside it.

That is still better than the alternative in some ways. A sealed instrument is still an instrument. But it is not a workshop.

The über-nerd counter would be something like:

> "Actually, there are alternatives. Framework lets you swap ports and mainboards. System76 ships Linux laptops. RISC-V exists. You can run NixOS. Skill issue."

All partly true. Also mostly missing the point with a confidence that could power a small ham radio.

The distinction is:

> **Repairability is not instrumentality. Modularity is not posture. Openness is not coherence.**

Framework is a better commodity laptop, sure. That is not an insult! It is a useful and politically preferable commodity laptop. But a better commodity laptop is still not a Sun workstation, an SGI, a NeXT box, or even a Mac Studio in terms of design-center coherence.

It has shop-floor ethics without a machine thesis.

## The machine dissolved into a topology

The workstation did not disappear because work stopped needing situated tools.

It disappeared because situated computing dissolved from a single instrument into a topology.

The modern workbench is not one box. It is a laptop, a phone, a NAS, a terminal, a dotfiles repo, rented compute, cloud storage, local scripts, remote APIs, password managers, sync daemons, browser profiles, note systems, Git repositories, calendars, chat histories, backups, search indexes and whatever personal infrastructure the user has built to keep the whole thing from becoming an archaeological site.

That topology is real. It's where work happens.

But it is rarely coherent.

The old workstation had spatial coherence. The hardware, OS, peripherals and software stack existed together as a bounded object. You could photograph it. You could sit down at it. Its floor plan was visible.

The modern workbench has temporal coherence, if it has coherence at all. It is maintained over time. It accretes. It decays. It survives migrations, account changes, vendor failures, API deprecations, hardware replacements, billing surprises and the quiet dread of discovering that some essential bit of personal infrastructure depends on a container image last updated by a stranger in 2019.

The object that needs a thesis is no longer the box.

It is the continuity layer.

Who owns the identity? Where does the state live? What changed? Why did it change? What depends on it? What can be recovered? What is local? What is rented? What is authoritative? What is merely cached? What can be exported? What disappears when the subscription ends?

These are now workstation questions.

They are just no longer asked at the workstation layer.

## Capital captured the topology

This is where the story stops being nostalgia and becomes enclosure.

The connective tissue of the modern workbench --- identity, storage, sync, search, collaboration, backup, telemetry, versioning, compute --- did not mature into a locally sovereign instrument. It became a set of subscription surfaces.

Capital captured the topology before users could name it.

By the time anyone could say "wait, this should be my coherent operational surface," the surface had already been divided among landlords. One service owns the files. Another owns the identity. Another owns search. Another owns communication. Another owns deployment. Another owns observability. Another owns the AI layer now being poured over everything like insulation foam.

The user is left as unpaid integration staff.

This is why "as a service" feels so different from merely renting tools. The issue is not that remote services exist. Remote compute is useful. Sync is useful. Collaboration is useful. The issue is that the connective tissue itself has been externalized and monetized.

The local machine becomes an access terminal to someone else's operating model.

That is the inversion. The old workstation gathered a practice into an instrument. The modern platform distributes the practice across administrative domains and sells partial continuity back to the user.

The result is not a workbench. It is a tenancy map.

## Custody is not posture

Self-hosting is the obvious counter-move. Own the metal. Run the services. Take back the stack.

I respect the instinct. I have lived the instinct. There is real value in refusing enclosure at the substrate layer.

But owning the substrate is not the same as shaping a practice.

A homelab can easily become a private cloud tribute band: private Dropbox, private Google Photos, private GitHub, private CI, private monitoring, private password vault, private media streaming, private everything. Better in some ways. More sovereign in some ways. Also often just a miniature reproduction of the cloud's ontology, maintained at personal cost.

That is custody. Custody matters.

But custody is not instrumentality.

The deeper question is not "can I self-host this service?" It is: what should a locally sovereign practice environment make easy, visible and durable?

A real successor to the workstation would not simply move SaaS under the stairs. It would give the topology a thesis.

It would treat files as primary artifacts, not app exhaust. Search would be local civic infrastructure, not a favor performed by a remote landlord. Sync would be transport, not ontology. State would be inspectable by default. Identity would be local-first, federated second. Receipts and history would be first-class, not scattered across logs, dashboards and vague recollection. Remote compute would be an attached tool, not the spiritual center of personhood. Recovery and portability would be part of the interface.

The machine is no longer the instrument; the topology is.

A topology becomes an instrument only when its continuity layer shapes a practice.

## Observability without governance

This is where my memory-pressure widget returns from the wings, wearing a small tragic hat.

The desktop had the signals. It lacked governance.

It could expose pressure. It could identify cgroups. It could kill processes. It could in principle protect the session and constrain runaway applications. But the default surface did not turn those facts into a humane policy. So the user got to assemble their own warning system from kernel telemetry.

That is observability without governance.

SRE culture has a related disease. It became very good at producing system visibility: dashboards, traces, spans, logs, RED metrics, USE metrics, SLO burn rates, error budgets, alerts, incident timelines, postmortems. All valuable. None sufficient.

Observability answers: what is happening, where, how much, how fast?

Governance answers: who has standing to act, under what authority, with what consequence, what gets stopped, what gets remembered, what changes afterward?

A dashboard does not decide who eats the consequence.

The same pattern shows up in social platforms. Bluesky is interesting because it moves one step beyond pure opacity. Feeds, labelers and ATProto give users and third parties real surfaces to act on. That is genuinely better than opaque platform feudalism.

But it also reveals the next problem: governance becomes another thing the user has to assemble. Protection arrives as optional infrastructure, often built by volunteers, operators or small services around the protocol. A labeler can warn. A custom feed can route attention. An observatory can detect drift. None of that automatically becomes default protection, legitimate authority, contestable process or durable repair.

The signals exist. The platform does not necessarily synthesize them into governance. So users build instruments around the platform's exposed nerves.

Look, you have APIs.

Look, you have `/proc`.

Look, you can inspect the failure.

This is called empowerment.

Sometimes it is. Often it's just abdication with better telemetry.

## The missing workbench

The missing thing is not a better nostalgia object.

It is not a new SGI. It is not a boutique beige box. It is not a translucent plastic revival device with USB-C and a markup for visible gears, though I regret to inform you I understand the appeal.

This is not a rejection of Unix so much as a return to the problem Unix once solved under different conditions. Unix gave users a culture of small tools, composable interfaces and local authority. But the modern topology has externalized too much of the authority Unix could assume: identity, sync, storage, search, collaboration, compute and policy now often live outside the machine. The missing workbench is not "Unix, but again." It is Unix's compositional instinct rebuilt for a world where the continuity layer itself has been captured.

A sibling argument lives elsewhere: [Plan 9 tried to extend the machine's coherent namespace across the network; the Web turned the local machine into a rendering surface for remote authority](https://neutralzone.substack.com/p/plan-9-for-them-browser-for-you). But this essay is about the consequence after that fork: the workstation dissolved into topology, and the topology was captured before users could make it their own.

The missing thing is a locally sovereign workbench for the topology age.

Not one app to rule them all. That path ends in a worse Notion. Not a new desktop environment that pretends the problem is window management. Not a distro whose main contribution is a wallpaper and a moral posture. Not a homelab stack that recreates cloud services indoors.

Something thinner, duller and more important:

A protocol ensemble. A reference daemon. A set of boring conventions for files, search, sync, identity, receipts, authority, portability and recovery. A local authority plane for one person's work.

It would not need to own every application. It would need to know where durable artifacts live, which tools are allowed to mutate them, what changed, what depended on the change and how to recover the prior state. It would index the local world before asking a remote service. It would treat sync as a copy operation with provenance, not as proof that the cloud is the real place. It would make "show me the state of my workbench" a normal question, not a weekend project.

Tools could come and go, but the continuity layer would remain legible. Remote services could attach, but not become the root of personhood. State would have a home. History would have shape. The user would have standing.

Naturally, this is commercially perverse.

A product that makes the user less captive reduces cloud dependency, telemetry capture, account lock-in and vendor-mediated continuity. It shrinks the surface available for recurring revenue. It makes the customer harder to own.

Worse, if it succeeds, it destroys its own expansion path. There is no natural upsell from "your work is portable, inspectable and locally authoritative" to "please pay us forever to mediate your continuity." The better the workbench becomes, the less the vendor can insinuate itself into the user's future. That is why the market prefers dashboards, sync layers and premium collaboration surfaces. They preserve dependency while looking like assistance.

So it probably will not arrive first as a product.

It will arrive, if it arrives at all, as craft.

Small groups. Personal substrates. Local daemons. Conventions. Weird scripts that become tools. Tools that become shared assumptions. Shared assumptions that become infrastructure. Less "platform" than plumbing. Less "ecosystem" than workshop practice.

The old workstation was a coherent machine for a coherent practice.

The modern equivalent would be a coherent local topology for a coherent practice.

That is what we are missing.

Not speed. Not nostalgia. Not the comforting weight of obsolete hardware, though some of us will remain weak before a full-page grayscale monitor or a weird three-button mouse that requires its consecrated metal grid.

What we lost was a relationship to computing in which the machine had a thesis, the user had standing inside it and the workbench was not primarily a rental surface.

Now the topology exists, but it belongs to everyone and no one. It crosses clouds, accounts, devices and policies. It is visible in fragments. It is governed elsewhere. When it fails, we get dashboards, APIs and logs. We get enough evidence to build escape hatches.

But escape hatches are not liberation.
