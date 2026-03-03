---
title: "The Trap Is Sprung"
date: 2026-03-03
---

When I mention [AB 1043](https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=202520260AB1043)---California's new law requiring operating systems to provide age bracket signals to apps---the most common response I get is some version of: "My understanding is the law just says you enter your birthday and other software has to respect that setting. There's no mechanism of enforcing the age verification at any level."

That response is correct about the surface. It's dangerously wrong about what's underneath.

A year ago, I wrote that [the dream of sovereign compute was dying](https://neutralzone.substack.com/p/the-dream-of-sovereign-compute-is)---and that AI was killing it. The argument was simple: AI was being used as a wedge to break the sovereignty of personal computing, not through some dramatic confrontation but through the quiet mechanics of lock-in. NPUs as platform control. Cloud AI as the dependency layer. The OS as the choke point.

I expected pushback. What I got instead was silence, a few nods, and the grinding sound of everything I described accelerating on schedule.

This is the update. Not "I told you so"---although I did---but a status report on where the trap is now, what mechanisms are driving it, and why the escape routes I mentioned a year ago are closing faster than most people realize.

<div>

------------------------------------------------------------------------

</div>

## The OS Became a Compliance Substrate

Last year I wrote: "The OS layer will be the choke point." That was directional. Now it has a statute number.

AB 1043, the "Digital Age Assurance Act," was signed by Governor Newsom in October 2025 and takes effect January 1, 2027. The law requires operating system providers to prompt users for age information during device or account setup, and then provide apps with an "age bracket signal" via a real-time secure API. The stated goal is to shift age-gating responsibility down the stack---away from individual websites and into the operating system itself. California [joins Louisiana, Texas, and Utah](https://www.troutmanprivacy.com/2025/10/analyzing-californias-digital-age-assurance-act/) in passing laws requiring app developers to receive age bracket signals, but AB 1043 goes further: it creates a device-level framework that applies to *all* applications, not just specific content categories.

Yes, on the surface, the user just enters a birthday. No photo ID. No facial recognition. Just self-reporting. And the most common reaction---"so what?"---is exactly the reaction the law's structure depends on.

The bracket design is structurally clever in ways that aren't obvious. By transmitting a coarse age range rather than a specific birthdate, AB 1043 sidesteps the privacy objections that killed earlier age verification proposals. But brackets are more valuable for the compliance infrastructure than exact dates would be. Your birthday is a single data point you enter once. Age brackets create a *continuous* compliance obligation---as a user crosses from 12 to 13, or 17 to 18, the signal changes, and every app that received it must respond accordingly. That means continuous attestation, not a one-time check. The infrastructure never goes dormant.

The law assumes an entity called an ["operating system provider"](https://www.tomshardware.com/software/operating-systems/california-introduces-age-verification-law) with a coherent setup funnel and an app ecosystem to serve signals to. That maps cleanly to Apple, Google, and Microsoft. It maps incoherently to Linux, because "Linux" isn't a company. But incoherence doesn't mean exemption---it means enforcement falls on commercial distributors, OEMs, app stores, and anyone shipping devices into California.

Here's where it gets structural. The law says ["secure API."](https://www.troutmanprivacy.com/2025/10/analyzing-californias-digital-age-assurance-act/) In the eyes of a platform lawyer, "secure" doesn't just mean encrypted. It means resistant to user tampering. If a user can change a config file to misrepresent their age, the platform provider is potentially liable for up to [\$7,500 per affected child](https://legiscan.com/CA/text/AB1043/id/3269704) for each intentional violation. The crucial move is that "secure" gets operationalized as "tamper-resistant," and the easiest tamper-resistance story is attestation. Once you define tampering as the user exercising ownership, the rest is just engineering.

Google is already documenting this exact coupling. Their [Play Age Signals API](https://developer.android.com/google/play/age-signals/use-age-signals-api), rolled out to satisfy state-level age assurance laws, comes with an explicit recommendation: pair it with the [Play Integrity API](https://developer.android.com/google/play/integrity/overview) to verify the signal comes from an untampered app on a certified device. The Integrity API returns tiered verdicts---MEETS_BASIC_INTEGRITY, MEETS_DEVICE_INTEGRITY, MEETS_STRONG_INTEGRITY---each requiring progressively more hardware-rooted trust. Apps will condition on these verdict tiers, and the minimum will ratchet upward. That's how these things always go: the floor becomes the ceiling becomes the requirement.

This is not a slippery slope argument. This is the [recommended integration pattern](https://developer.android.com/google/play/age-signals/use-age-signals-api), in the official developer documentation, right now.

And the beauty of it---from the perspective of anyone who wants to turn a general-purpose computer into an appliance---is that nobody had to say "lock down the hardware." The law said "secure signal." The platform said "we recommend integrity checks." The apps said "we'll require passing integrity to avoid liability." Each step is locally reasonable. The result is a compliance substrate: the operating system as policy oracle, answering questions about the user on behalf of entities the user never agreed to trust.

Age bracket today. "Verified adult" for payments and streaming tomorrow---same pipe, richer token. Whatever the next moral panic demands, the day after that. The argument doesn't require prophecy. It just requires you to notice the slot where the next plug fits.

<div>

------------------------------------------------------------------------

</div>

## The Attestation Pipeline Is Already Built

When I wrote the original piece, the "lock-in through hardware" story was about NPUs and cloud dependency. That's still true, but a more immediate mechanism has matured: hardware-rooted attestation as a prerequisite for participating in the modern software ecosystem.

Microsoft Pluton is now shipping on-die in Intel Core Ultra 200V and AMD Ryzen AI 400 series processors. It's not a discrete TPM you could theoretically sniff or emulate. It's integrated into the SoC. The communication between CPU and security processor isn't exposed on a bus. There's no wire to clip. When an app asks for an attestation signal, it comes from a hardware enclave that even a user with root access cannot override without blowing the integrity fuse.

On the Linux side, the accommodation is already underway---and this is the part most people miss. Linux already lives downstream of signature custody. Microsoft's original 2011 Secure Boot CA certificates [expire in June 2026](https://techcommunity.microsoft.com/blog/windows-itpro-blog/act-now-secure-boot-certificates-expire-in-june-2026/4426856). Most mainstream Linux distributions boot on consumer hardware via a "shim" bootloader signed by Microsoft's UEFI CA. When those certificates roll over to the 2023-era replacements, any distribution that hasn't updated its shim faces a [compatibility problem under Secure Boot](https://techcommunity.microsoft.com/blog/windows-itpro-blog/secure-boot-playbook-for-certificates-expiring-in-2026/4469235)---and most OEMs discourage or hide the option to disable it. AB 1043 isn't a new kind of leverage over Linux. It's the next payload riding a bus that was already built.

If you want to see what this looks like in practice, read [this thread on the debian-devel mailing list](http://www.mail-archive.com/debian-devel@lists.debian.org/msg390183.html) from March 1, 2026. A developer from the Kicksecure and Whonix projects---privacy-focused distributions---is proposing a new D-Bus interface, `org.freedesktop.AgeVerification1`, so that Linux distributions can comply with AB 1043 before the January 2027 deadline. The tone is resigned: "we aren't particularly interested in blocking everyone in California and Colorado from using our OSes, so we're currently looking into how to implement an API that will comply with the laws while also not being a privacy disaster." A respondent from elementary OS suggests renaming it from "verification" to "declaration," since the information is self-reported. Another notes that Apple is already planning additional age brackets. The bus is being built in the open, by people who know exactly what it is, because the alternative is being locked out of the market.

Fedora is pushing Unified Kernel Images---combining the kernel, initrd, and command line into a single signed EFI binary that a TPM can attest to. Canonical's broader direction with Ubuntu Core and OEM images points toward signed, read-only base systems with hardware-backed full disk encryption as the default. These aren't paranoid predictions. They're the logical consequence of an ecosystem where "trusted" means "legible to the platform's integrity checks."

The implicit deal is: you can participate in the modern computing ecosystem, but only if your boot chain is legible. The "open" path still exists. It just produces a device that fails the trust handshake for an increasing number of services that matter.

<div>

------------------------------------------------------------------------

</div>

## The Economics Got Worse

Last year I wrote: "Sovereign compute is at odds with affordable compute." The gap has widened.

As of Q1 2026, conventional DRAM contract prices are [up roughly 90-95% quarter-over-quarter](https://www.trendforce.com/presscenter/news/20260202-12911.html). AI hyperscalers are hoarding HBM and advanced packaging capacity. HP's CFO has said publicly that [memory costs doubled in a single quarter and now account for roughly 35% of PC bill-of-materials costs](https://www.tomshardware.com/tech-industry/hp-says-memory-costs-doubled-to-35-percent-of-pc-build-materials-in-one-quarter). The DIY path---build your own box, run your own stack---is getting priced into hobby territory.

This isn't a temporary blip. The structural cause is that AI infrastructure buildout is diverting silicon capacity, packaging capacity, and power infrastructure away from consumer and enterprise computing. When the world is on allocation and the hyperscalers are bidding first, "just build your own" stops being a cost-effective alternative and starts being a lifestyle commitment.

Server-grade hardware at home is already harder to source and more expensive to populate. And the OEMs, responding rationally to these constraints, are prioritizing "AI PCs" with locked-down, attested hardware paths---because that's where the margins are and that's what the compliance framework rewards.

The result: open hardware becomes a scavenging operation. Used enterprise gear, mini-PCs, last-generation components, creative workarounds. It's not dead. It's just transitioning from "viable mainstream alternative" to "enthusiast hobby," the same way working on your own car went from normal competence to boutique subculture once vehicles got sealed ECUs and serialized components.

<div>

------------------------------------------------------------------------

</div>

## The Escape Routes Are Closing

A year ago, I listed three things that could still be done: push for real local AI options, resist cloud dependence, and call out the shift before it's too late.

Local AI has gotten somewhat better---open-weight models have improved, and you can run meaningful inference on consumer hardware now. That's real progress. But it exists inside a narrowing window. The hardware it runs on is getting more expensive. The attestation framework doesn't care whether you're running Llama or ChatGPT---it cares whether your boot chain is signed. And the compliance substrate being built around age verification and integrity checking doesn't distinguish between "AI workload" and "everything else." It applies to the OS itself.

Cloud dependence has deepened, not lessened. The "AI PC" pitch---local NPU for light tasks, cloud for everything serious---is exactly the hybrid dependency model I described. It creates a floor of local capability that feels like sovereignty while routing the ceiling through someone else's infrastructure.

And calling out the shift? That's what this piece is. But I'll be honest about the reception: a year ago, this argument got three likes and no comments. The discourse is still stuck on AGI timelines and whether AI art is theft. Meanwhile, the actual material infrastructure of personal computing is being restructured underneath everyone's feet.

<div>

------------------------------------------------------------------------

</div>

## The Pattern

Here's what I need you to see, because this is the part that history makes clear even if the present obscures it.

This has happened before. Microsoft tried "Trusted Computing" with Palladium in the early 2000s. Intel pushed LaGrande. The backlash was immediate and effective---people recognized it as DRM and lock-in, and the projects died or retreated.

But they didn't really die. They retreated into primitives. TPM became standard. UEFI Secure Boot became a logo requirement. Measured boot became a default. Each piece was individually defensible. Each piece was a prerequisite for the next one. And now, twenty years later, the full stack is in place---not because anyone won the argument, but because the argument got decomposed into components small enough that no single one triggered the backlash threshold.

The only thing that was missing was a justification compelling enough to turn those primitives from passive infrastructure into active enforcement. "DRM" wasn't compelling enough. "Enterprise security" wasn't broad enough. "Piracy prevention" made you look like a music industry shill.

And there's a reason this justification meets so little resistance: most people already accepted the attested computing model years ago on their phones. Apple has been running locked-down, hardware-attested computing since the iPhone launched. iOS has never allowed unsigned code without jailbreaking. The App Store is exactly the "compatibility as control" mechanism at work. The shift isn't that attestation is new---it's that Android and Windows are converging toward the iOS model, and because most users already experience that model as "just how phones work," extending it to desktop computers barely registers as a change.

"Protect the children" is compelling enough.

That's what AB 1043 provides. Not the technology---the technology was already there. The *pretext*. The moral justification that makes it politically impossible to object without being framed as pro-harm. And once the OS is a compliance oracle for age, expanding it to identity, content classification, or anything else is just an API extension. The hard part was building the bus. The bus is built.

<div>

------------------------------------------------------------------------

</div>

## What Happens Next

I'm not going to pretend there's a clean action plan. The forces driving this---liability optimization, regulatory convenience, platform economics, supply chain concentration---are aligned in a way that makes resistance expensive and compliance effortless.

But I'll say what I said last year, updated for what we now know:

**The killshot is not prohibition. It's compatibility.** You will always be able to install whatever you want on whatever hardware you can get your hands on. You will increasingly be unable to *use* it for anything that connects to the services, institutions, and infrastructure that make a computer useful. Banking. Streaming. Education. Government portals. Games. Payments. Each one can quietly require attestation as a condition of access, and each one will have a locally reasonable justification for doing so.

Open computing doesn't die by ban. It dies by irrelevance. It becomes ham radio: legal, real, technically impressive, and completely outside the mainstream of how people actually live.

If you think that can't happen because it hasn't happened yet, I'd invite you to look at the last twenty years of this industry and ask yourself how many times "it can't happen" was followed by "it's now the default."

The window isn't closed. But it's no longer open in the way most people assume. The trap isn't being set anymore.

It's sprung.
