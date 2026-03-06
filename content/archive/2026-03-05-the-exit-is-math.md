---
title: "The Exit Is Math"
date: 2026-03-05
---

*The first piece, "[The Trap Is Sprung](https://neutralzone.substack.com/p/the-trap-is-sprung)," described the mechanism: how AB 1043's "secure signal" language creates a liability gradient that pushes platforms toward hardware attestation as the default compliance posture, turning operating systems into compliance substrates and open computing into an economic afterthought.*

*This piece is the one I don't usually write. I don't do prescriptions. But I've spent twenty years building infrastructure, and the alternative architecture here isn't speculative. It's standardized. It's implementable. And it\'s being sat on by the same companies that need you locked into their boot chain to keep the billing model alive. So: here it is.*

<div>

------------------------------------------------------------------------

</div>

## The Problem Restated

AB 1043 makes the OS an age-signal source-of-truth on demand---across app categories---whenever a developer requests it via a "secure API." The law doesn't define "secure." That ambiguity is the entire game.

In practice, "secure" won't mean encrypted. It will mean **the user can't lie.**

And the easiest way to guarantee the user can't lie is hardware attestation---the device proves, via TPM or Pluton, that the OS hasn't been tampered with, and therefore the signal it transmits can be trusted. Once you accept that framing, **open computing is structurally incompatible with compliance**.

The question is whether "secure" has to mean "attested by silicon," or whether it can mean "verified by math."

It can.

<div>

------------------------------------------------------------------------

</div>

## The Alternative: Signed Credentials, Not OS Truth

The fix is almost insultingly obvious, which is how you know it\'ll be fought: stop treating age as a property of the device and start treating it as a user-held credential that apps can verify cryptographically.

Right now, the platforms are pushing a model where the operating system *asserts* "this user is 18+," and the app trusts the assertion because the device's hardware attests that the OS is unmodified. The OS becomes the oracle. The hardware becomes the oath.

The alternative: the OS doesn't assert anything. It *brokers* a proof that's signed by an issuer the app already trusts. The proof is verifiable regardless of what OS you're running, because the security comes from the signature, not the boot chain.

This isn't hypothetical. The building blocks are already standardized:

**W3C Verifiable Credentials Data Model v2.0** ([spec](https://www.w3.org/TR/vc-data-model-2.0/)): an issuer/holder/verifier model designed for exactly this kind of selective disclosure. The issuer (a DMV, a bank, a KYC provider) signs a credential. The holder (you) stores it. The verifier (the app) checks the signature. Nobody needs to trust your bootloader.

**Privacy Pass** ([RFC 9576](https://www.rfc-editor.org/rfc/rfc9576)): blind-signed tokens that prove a property ("this person is 18+") without identifying the holder. Unlinkable across presentations. Already deployed in production systems.

### How It Works

**Issuance.** You prove your age once to a trusted issuer---a state ID provider, a bank, a telecom doing KYC, a university for minors. The issuer returns a credential encoding only the age bracket AB 1043 requires: under 13, 13--15, 16--17, 18+. Nothing else. The law's own "minimum information necessary" language is satisfied by design, not by policy.

**Storage.** The credential lives in a wallet you control. Browser wallet, desktop wallet, phone wallet, hardware key---your choice. No mandatory vendor account. No OEM blessing required.

**Presentation.** An app asks: "prove 18+." Your wallet returns either a selective-disclosure credential presentation (reveals only the bracket) or a Privacy Pass token (proves "adult" without identifying you at all). The app checks the issuer's signature. Done. Nothing about your kernel, your bootloader, or your firmware enters the conversation.

**Expiry.** Short-lived credentials---30 to 90 days---with a refresh cycle. Boring, simple, and it means the system stays current without requiring permanent identity infrastructure. (A note on revocation: short-lived credentials handle most cases, but issuer dependency is a concentration risk. Distributed revocation registries with zero-knowledge proofs of non-revocation exist as cryptographic primitives and can be layered in without changing the core architecture. This is a solvable problem, not an open one.)

<div>

------------------------------------------------------------------------

</div>

## The Objection They'll Use to Kill It

This is where the platform lawyers earn their retainers. The counterargument is predictable, and it's not stupid:

*"A cryptographic token proves that an authority verified an adult. It does not prove that the person currently at the keyboard is that adult. What stops an 18-year-old from exporting a valid token and sending it to a 13-year-old on Discord?"*

The token-sharing objection is how they smuggle **identity continuity** into an **age-bracket** law. It's the exact knife Google, Apple, and Microsoft will use in every committee hearing, every regulatory comment period, every standards body meeting. Their proposed solution: cryptographically bind the token to the device hardware via TPM or Secure Enclave, gated behind a biometric check managed by a trusted OS.

And the moment the regulator accepts that framing, the clean credential model collapses back into the attestation loop. The token is trapped inside the Pluton chip. You need a locked bootloader to access it. The exit closes.

But the objection only works if you accept its premise. And the premise is wrong.

### The Premise Is Wrong

AB 1043 is an age *bracket signal* law, not an identity *binding* law. The stated requirement is that the OS transmit an age range. Not that the OS verify the human at the keyboard is the same human who was verified last Tuesday. Not that the device maintain continuous biometric confirmation. A bracket signal. That's why self-reporting is allowed at all---the law's own enforcement mechanism assumes imperfect assurance. And it says so explicitly: AB 1043 **disclaims liability** arising from a device being used by someone who isn't the user to whom the signal pertains.

So when the platforms argue "tokens must be hardware-bound to prevent sharing," they're solving a problem the law doesn't require them to solve. Worse: the problem they're citing---teens sharing credentials---is exactly what happens *today*, constantly, with no technology required. A 13-year-old asks an 18-year-old to log in for them, uses a borrowed credit card, or just lies on a signup form. The current internet runs on this. The platforms are arguing that the solution to a problem with no existing technical solution must be a *specific* technical solution that happens to lock down the device. The proper regulatory response is simple: show us the evidence that credential sharing is a larger problem than the status quo, and show us why hardware attestation specifically solves it rather than just shifting the workaround to a different layer.

They can't. Because the solution they're proposing---device attestation---doesn't actually solve the token-sharing problem. It solves their *actual* problem, which is ensuring that every computing device on earth runs vendor-approved software.

That's not child safety. That's platform capture. **Make them own the choice**.

### Soft Binding Without Silicon Priesthood

You don't need hardware attestation to make token sharing impractical enough. You need math plus inconvenience:

**Short-lived tokens.** Credentials that expire in hours or days, requiring re-issuance with real friction. Sharing a credential that expires tomorrow is less useful than sharing one that lasts a year.

**Proof-of-possession keys.** The credential is bound to a cryptographic key stored in the wallet. Sharing the credential now means exporting both the token and the key---a higher bar that leaves forensic traces. Not unshareable, but it kills "paste this string from Discord."

**Context-bound presentations.** The token is presented to a specific relying party and can't be replayed elsewhere. No universal "age pass" that works everywhere once shared.

**Rate limits per issuer.** One credential per wallet per issuance period. The casual sharing economy collapses when the supply is constrained.

Yes, determined teens will route around constraints. They always do. The point is to avoid building an attestation caste system as collateral damage.

None of this requires OS attestation. None of it requires a locked bootloader. None of it requires your computer to be a tenant in someone else's building. It's cryptographic friction, not architectural control.

<div>

------------------------------------------------------------------------

</div>

## The Policy Move That Makes This Real

None of the above matters if the law doesn't protect it. And right now, it doesn't.

AB 1043's "secure API" language creates a liability gradient: platforms that implement hardware attestation can argue they took the most secure approach available, and platforms that don't can be sued for not doing enough. Without explicit statutory language protecting software-only credential verification as a compliant implementation, the ratchet only turns one direction.

The fix is a tiered compliance ladder, written into law---not left to vendor "recommendation":

**Tier A (default, required).** Privacy-preserving bracket proof via user-held credentials. No device attestation permitted or required for basic compliance. This is the floor. Any OS, any device, any wallet that can verify a signature meets the standard.

**Tier B (optional, for high-risk applications).** Proof-of-possession plus credential refresh, with optional local biometric if the user chooses. Not required, not platform-owned. Available for apps that want higher assurance without mandating hardware lock-in.

**Tier C (exception, narrowly scoped).** Hardware attestation allowed only for specifically enumerated high-risk contexts---regulated financial transactions, for instance---with an explicit anti-discrimination clause preventing its use as a gating requirement for general computing, communication, or content access.

This isn\'t complicated. It\'s just not *profitable* for the people currently writing the defaults. If the ladder isn't written into law, platforms will ship one anyway. Their ladder has one rung: **theirs.**

<div>

------------------------------------------------------------------------

</div>

## The Debian Thread

On March 1, 2026, a Kicksecure/Whonix developer posted to [debian-devel](http://www.mail-archive.com/debian-devel@lists.debian.org/msg390183.html) proposing `org.freedesktop.AgeVerification1`---explicitly because they "aren't particularly interested in blocking everyone in California and Colorado." That's the FOSS posture under liability: build the bus so you don't have to geofence users. Then [Danielle Foré replies](http://www.mail-archive.com/debian-devel@lists.debian.org/msg390186.html) with the tell: don't call it "verification," call it "declaration," because the user is just stating an age.

That naming fight is the whole war. The Freedesktop developers instinctively understand that what they're building is a *declaration* system. The platforms need it to become a *verification* system, and "secure" is the lever they'll use to force the upgrade.

The developers building the bus know exactly what it is. The question is whether the law will let them build the version that preserves the thing they're trying to protect---or whether "secure" will be defined, by default, as "controlled."

<div>

------------------------------------------------------------------------

</div>

## The Window

This isn't a permanent condition. AB 1043 takes effect January 1, 2027. Regulatory comment periods typically close six to twelve months before implementation. That means the compliance paths are being locked in *this year.* The Freedesktop developers are building now. The W3C credential spec exists now. The Privacy Pass RFC is published now. The tiered ladder can be proposed in regulatory comment periods now.

But the window has a shape, and the shape is closing. Every month that passes without explicit statutory protection for credential-based compliance is a month where platform "recommendations" harden into de facto requirements. Every app that ships with Play Integrity as its age-signal backend is another node in a network that becomes harder to unwire.

The window isn't just temporal---it's attentional. Right now, AB 1043 is new, the technical community is paying attention, and the implementation details are still being negotiated. In six months, the attention shifts, and the defaults harden into practice.

So here's what "now" looks like concretely: someone needs to write the model regulatory comment that defines "secure signal" to include user-held cryptographic proofs without mandatory device attestation. Someone needs to build a reference implementation against the Freedesktop `AgeVerification1` interface that demonstrates credential-based compliance works. The W3C VC community and the FOSS developers already building the bus need to be in the same room---or at least the same mailing list---before the platforms define the standard by shipping their version first. The technical work is happening. The standards exist. The legal hook is there. What's missing is coordination.

The exit is math. The lock is law. The question is which one gets there first.
