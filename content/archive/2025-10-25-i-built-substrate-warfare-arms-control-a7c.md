---
title: "I Built Substrate Warfare Arms Control in an Afternoon"
date: 2025-10-25
---

*Preface: somehow we built a technical solution to a geopolitical problem and I was like "huh, I wonder why no one's done this" instead of immediately going "oh, because it's not a technical problem, it's an incentive problem."*

*The most cynical answer is always the right answer where institutions are involved.*

*I know this. I **write about** this. I don't know what I was smoking.*

## Part 2: The Prisoner's Dilemma at the Foundation of Everything

A few days after publishing my substrate warfare framework, something happened that I should have expected but somehow didn't: people started asking if they could investigate it.

One reader with a computer security degree wanted to know if the framework was "publicly available to investigate." Another contact---someone I trust---finally responded to the piece with a message I can't stop thinking about:

"Oh, sorry---I forgot to mention that this makes sense. In fact, if I remember right the NSA compromised the random number generator at the NIST several years back to grant themselves a backdoor to everything."

He had receipts. The BBC covered it in 2013. So did the New York Times, Reuters, and every major tech publication. It wasn't speculation. It was documented fact.

And suddenly I understood why the framework I built doesn't exist.

Not because no one thought of it. Not because the cryptography is too hard or the operational model too complex. But because **the people who could build it are the same people who benefit from it not existing.**

## What Chris Told Me

Let's start with the receipts.

### Dual_EC_DRBG: The Backdoor in the Standard

In 2006, the National Institute of Standards and Technology (NIST)---the U.S. government agency responsible for cryptographic standards---published Special Publication 800-90, which included four algorithms for generating random numbers in cryptographic systems.

One of these algorithms, called Dual Elliptic Curve Deterministic Random Bit Generation (Dual_EC_DRBG), was designed by the National Security Agency.

Cryptographers immediately noticed problems. The algorithm was slow. It was unnecessarily complex. And it had what looked like a backdoor---a mathematical relationship between two elliptic curve points that would allow someone who knew the secret relationship to predict the "random" numbers the algorithm generated.

In 2007, two Microsoft security researchers, Dan Shumow and Niels Ferguson, presented at the CRYPTO conference demonstrating exactly how the backdoor would work. Bruce Schneier wrote an article titled "Did NSA Put a Secret Backdoor in New Encryption Standard?"

The answer, it turned out, was yes.

In 2013, documents leaked by Edward Snowden confirmed that the NSA had deliberately inserted the backdoor as part of its Bullrun program, which spent \$250 million per year to "insert vulnerabilities into commercial encryption systems, IT systems, networks, and endpoint communications devices."

Reuters later reported that the NSA had paid RSA Security---one of the most trusted names in cryptography---\$10 million to make Dual_EC_DRBG the default random number generator in their BSAFE toolkit, which was used by thousands of companies worldwide.

The backdoor remained in the NIST standard from 2006 until 2014, when NIST finally withdrew it following the Snowden revelations.

For eight years, the U.S. government's official cryptographic standard contained a known backdoor that could be exploited to decrypt SSL/TLS traffic---the encryption protecting online banking, email, VPNs, and virtually every other "secure" communication on the internet.

### Juniper Networks: The Backdoor That Got Backdoored

But it gets worse.

In December 2015, Juniper Networks---a major manufacturer of enterprise networking equipment---announced that it had discovered "unauthorized code" in ScreenOS, the operating system running on its NetScreen firewalls.

The code introduced two vulnerabilities: one that allowed remote administrative access, and one that allowed decryption of VPN traffic.

The VPN vulnerability was related to Dual_EC_DRBG. Juniper had implemented the NSA's backdoored algorithm in 2008, even though its engineers knew about the potential vulnerability. They did it because the Pentagon---a major customer---required NIST-validated cryptography, and Dual_EC_DRBG was in the NIST standard.

Juniper had tried to protect against the backdoor by using their own elliptic curve point (Q) instead of the NSA's point. This should have prevented the NSA from exploiting the backdoor.

But in 2012, someone---almost certainly a foreign government, likely China---had modified Juniper's code to change the Q point to one *they* controlled. This gave the attackers the ability to decrypt all VPN traffic flowing through Juniper firewalls.

Juniper firewalls were used by the U.S. Department of Defense, Fortune 500 companies, and critical infrastructure operators worldwide.

The backdoor went undetected for at least three years, possibly seven.

Think about that: The NSA designed a backdoor. They got it into a government standard. A major vendor implemented it (reluctantly, to satisfy government requirements). Then a foreign adversary modified the backdoor to work for *them* instead.

The NSA's backdoor was itself backdoored.

And nobody noticed for years.

### China's National Time Service Center: The Latest Accusation

Fast forward to October 2024---just two weeks ago as I write this.

China's Ministry of State Security accused the NSA of conducting a multi-year cyberattack against China's National Time Service Center (NTSC), the facility responsible for generating and distributing "Beijing Time" to China's communications, finance, power, transportation, and defense sectors.

According to China's claims:

-   The operation began in March 2022 when the NSA exploited a vulnerability in a mobile messaging service to compromise NTSC staff phones

-   In April 2023, the NSA used stolen credentials to access NTSC servers

-   Between August 2023 and June 2024, the NSA deployed what China called a "cyber warfare platform" with "42 specialized cyberattack weapons"

-   The attacks attempted to penetrate China's high-precision ground-based timing system

-   The goal was apparently to position for potential disruption or sabotage

The NSA's response? "NSA does not confirm nor deny allegations in the media regarding its operations."

Which is exactly what you'd say if it were true.

Now, is China's accusation accurate? Maybe. Maybe not. China has its own reasons to make the U.S. look bad, especially amid ongoing trade tensions and technology competition.

But here's what we know for certain: attacking timing infrastructure is *exactly* the kind of thing sophisticated nation-state actors do. A senior official at China's time center explained to state media that even microsecond-level errors could trigger "fluctuations worth hundreds of billions of dollars" on global stock markets. Millisecond errors could cause cascading failures at power substations. Timing is substrate. Compromise timing, and everything built on top of it becomes vulnerable.

The NSA has the capability. The NSA has the motive. And the NSA has demonstrated, repeatedly, that it will compromise foundational infrastructure when it serves strategic interests.

Whether this specific attack happened or not, the broader pattern is undeniable: major powers are actively targeting substrate-level systems.

## Why The Framework Would Work (Technical Recap)

Before we get to why it doesn't exist, let's briefly recap why it *could* exist.

The framework I outlined in Part 1 isn't science fiction. It's technically feasible with existing cryptography and infrastructure:

**Attested telemetry** - Systems can cryptographically sign their operational data, creating tamper-evident logs of what they're doing. If someone modifies timing data, GPS signals, DNS responses, or PKI certificates, the signature breaks.

**Multi-source witness correlation** - Multiple independent observers watch the same infrastructure and compare notes. If one source reports something different from the others, you know something's wrong. This prevents single-point compromise.

**Cryptographic proofs** - Mathematical verification that data hasn't been tampered with between generation and consumption. The math works. The protocols exist.

**Economic forcing functions** - Make substrate attacks expensive enough that only nation-states can afford them, and make attribution clear enough that plausible deniability evaporates.

The cryptography is proven. The architecture is straightforward. The operational model is documented.

So why hasn't anyone built it?

## The Three Barriers to Implementation

### Barrier 1: Exposure Risk

Building substrate verification infrastructure would expose past compromises.

The Dual_EC_DRBG backdoor only came to light because Edward Snowden leaked internal NSA documents. The Juniper backdoor was only discovered during an internal security audit. China's allegations about timing infrastructure attacks came from their own defensive investigation.

How much substrate compromise is currently operational and undetected?

If you implement comprehensive verification infrastructure, you don't just prevent *future* attacks---you reveal *existing* attacks. Every backdoor that's currently deployed and working becomes visible. Every compromise that relies on the target not knowing they're compromised suddenly lights up like a Christmas tree.

This creates massive political cost. Allies discover you've been backdooring their systems. Trading partners discover you've been manipulating their infrastructure. Your own citizens discover that the "secure" government standards you've been promoting have known vulnerabilities.

For any nation currently exploiting substrate vulnerabilities---which is probably every major power---building verification infrastructure means admitting what you've been doing.

### Barrier 2: Capability Loss

Every major power currently has substrate access as part of their operational toolkit.

The NSA maintains a catalog of zero-day vulnerabilities and cyberweapons specifically for targeting infrastructure. China has demonstrated sophisticated supply chain attacks. Russia has shown capability to manipulate power grids and communications infrastructure.

Substrate warfare isn't a rogue operation---it's official doctrine. It's considered a legitimate intelligence tool, a military capability, and a strategic deterrent.

Giving up substrate access requires trusting adversaries to also give up substrate access. But how do you verify compliance?

This is the classic arms control problem, but worse. With nuclear weapons, you can count warheads and monitor production facilities. With cyber capabilities, the "weapons" are bits of code that can be copied infinitely, stored anywhere, and deployed in milliseconds.

Even if nations agreed in principle to substrate arms control, enforcement would be nearly impossible. You'd need inspectors with access to classified intelligence systems, offensive cyber capabilities, and operational security protocols. No nation would allow that level of transparency.

Unilateral implementation is equally unattractive. If you build verification infrastructure that makes *your* substrate secure, but your adversaries don't reciprocate, you've just given up a strategic capability while gaining nothing.

So everyone stays in the bad equilibrium: mutual vulnerability, mutual exploitation, mutual distrust.

### Barrier 3: Legal Liability

Evidence trails create legal risk.

Right now, substrate attacks exist in a grey zone. When China accuses the NSA of hacking their timing infrastructure, the NSA says "we don't confirm or deny." When Juniper discovers a backdoor, they can't definitively attribute it. When cryptographers find suspicious patterns in NIST standards, they can speculate but can't prove intent.

Plausible deniability has value. It allows nations to conduct operations that would be politically costly to acknowledge. It prevents escalation. It maintains diplomatic relationships even as intelligence services target each other's infrastructure.

Substrate verification infrastructure destroys plausible deniability.

If attacks become cryptographically attributable---if you can *prove* that Nation A tampered with Nation B's timing infrastructure---then consequences become harder to avoid. International pressure builds. Sanctions become more likely. Legal frameworks start to apply.

For nations conducting substrate warfare, this is undesirable. Deniability is a feature, not a bug. The current system works precisely *because* attribution is hard.

## The Nash Equilibrium of Substrate Insecurity

Game theory has a concept called Nash equilibrium: a state where no player can improve their position by changing strategy unilaterally, even though everyone would be better off if they could coordinate to change strategies together.

Substrate warfare is a textbook example.

**The socially optimal outcome:** Everyone implements substrate verification. All nations gain security for their critical infrastructure. Timing systems, DNS, PKI, GPS---all become trustworthy and auditable. The global digital infrastructure becomes more stable and reliable.

**The individual rational choice:** Don't implement verification. Maintain offensive capability. Exploit substrate vulnerabilities in adversary systems. Deny everything when accused.

Why? Because:

1.  If you implement verification and others don't, you lose capability while staying vulnerable

2.  If others implement verification and you don't, you maintain capability while they gain security (but you can still try to bypass their verification)

3.  If everyone implements verification, you lose capability but so does everyone else (and you'd rather keep the capability)

4.  If no one implements verification, you maintain capability and everyone stays vulnerable (which is bad, but at least you have the capability)

The dominant strategy is: don't build verification infrastructure.

Even though everyone would be safer if everyone built it, no one has individual incentive to go first. And even if some nation tried to go first, others would rationally defect to maintain their operational advantage.

This isn't a bug in human reasoning. It's the rational response to perverse incentives.

The equilibrium is *stable*. Not because it's good, but because changing it requires coordination that's structurally impossible under current geopolitical conditions.

## What This Means

The framework I built in an afternoon works.

The cryptography is sound. The architecture is feasible. The operational model is practical.

And that's precisely why it will never be implemented.

Because building substrate verification infrastructure would:

-   **Expose past compromises** → political cost for whoever goes first

-   **Eliminate operational capability** → strategic cost for all major powers

-   **Create attribution mechanisms** → legal risk and loss of deniability

-   **Require mutual trust** → which doesn't exist and can't be enforced

Substrate warfare arms control isn't a technical problem. It's a prisoner's dilemma where defection is profitable, cooperation is unenforceable, and the cost of the status quo hasn't yet exceeded the cost of coordination.

## The Pattern Repeats: Zero Trust for Thee, Not for Me

This isn't unique to substrate warfare. It's how power structures systematically avoid accountability.

Consider "zero trust" architecture in cybersecurity. The core principle is: trust nothing, verify everything. Every user, every device, every request gets authenticated, authorized, and continuously verified.

But look at *what* gets verified and *what* doesn't.

Individual users? Multi-factor authentication, device attestation, behavioral analysis, continuous re-verification. Every action logged. Every anomaly flagged. Zero trust.

The substrate those users depend on? The timing infrastructure, DNS roots, certificate authorities, cryptographic standards? Those operate on pure institutional authority. We trust them because they have official status. Because they're "the standard." Because someone with power vouches for them.

Zero trust collapses at the substrate level because *someone* has to be the root of trust. And whoever controls that root can do whatever they want---as the NSA's backdoor in NIST standards proves.

The verification effort flows *downward* to the least powerful actors. The most powerful actors---the ones who can cause systemic damage---get trusted by default.

This is the same structure as austerity policy.

Welfare recipients face drug tests, work requirements, means testing, and constant re-verification to prove they deserve minimal assistance. Every transaction scrutinized. Every eligibility criteria enforced with maximum friction.

Meanwhile, corporate subsidies, tax breaks, and defense contracts flow with minimal oversight. Billions in "economic development" funds, PPP loan forgiveness, bailouts---all distributed on institutional authority with verification theater that's perfunctory at best.

The pattern: **Infinite scrutiny on the powerless, implicit trust for the powerful.**

You can't effectively resist if you're spending all your energy proving you deserve basic access. The system can't be threatened if all the verification theater happens at the edges while the core remains unaudited.

When the powerful inevitably abuse that trust---when welfare fraud by corporations dwarfs individual fraud by orders of magnitude, when substrate compromise by nation-states makes endpoint attacks look trivial---the response is predictable: more scrutiny on individuals.

Not because it's effective. Because it's *defensible*. Because verification theater on the powerless looks like governance while verification of the powerful looks like threat.

The Conservation of Paranoia isn't just organizational behavior. It's **how hierarchies defend themselves from accountability.**

Substrate warfare arms control would flip this. It would put the verification apparatus where the systemic risk actually lives---at the foundation, not the edges. It would make the powerful prove their infrastructure isn't compromised instead of making users prove they deserve access.

That's why it won't be built. Not because it doesn't work, but because it works *against* the interests of everyone with the power to implement it.

## The Dark Coda

I built this framework in an afternoon and got scared.

Not because the problem was hard. But because once I understood *why* the obvious solution doesn't exist, I saw how deep the rot goes.

This isn't incompetence. It's not lack of imagination. It's not insufficient funding or bureaucratic inertia.

It's **rational actors making individually optimal choices that produce collectively terrible outcomes.**

The NSA backdoored a cryptographic standard because it gave them access to adversary communications. RSA took \$10 million to implement it because that was profitable. Juniper built it into their products because the Pentagon required it. Foreign adversaries compromised the backdoor because it was there to be compromised. And the whole edifice stood for eight years because no one with the power to tear it down had incentive to do so.

Everyone acted rationally. The system worked as designed.

And the result was that critical encryption infrastructure---used by banks, hospitals, government agencies, and millions of individuals---had a known vulnerability that multiple nation-states could exploit.

This isn't ancient history. The Juniper backdoor was discovered in 2015. China accused the NSA of attacking their timing infrastructure two weeks ago. Right now, today, there are almost certainly substrate compromises in production that we don't know about yet.

My framework would expose them. It would make attacks visible. It would create attribution. It would establish accountability.

**That's why it doesn't exist.**

Not because no one thought of it. But because the people who could build it are the same people who benefit from substrate remaining vulnerable and attacks remaining deniable.

The substrate is compromised. Everyone knows it. Everyone participates in compromising it. And everyone has more to lose from fixing it than from keeping it broken.

This is not a problem that gets solved. It's a problem that gets survived---or doesn't---depending on whether cascading infrastructure failures eventually force the kind of coordination that rational self-interest currently prevents.

Until then, we live on substrate that can't be trusted, protected by standards that contain backdoors, using infrastructure that nation-states actively target.

And the verification systems that could change this will remain unbuilt, not because they're impossible, but because they're threatening to everyone with the power to implement them.

## Acknowledgments

Thanks to Chris for the reminder about Dual_EC_DRBG, and to everyone who asked whether the framework was available to investigate. The framework is in Part 1. This is why it won't be implemented.

## References

**Dual_EC_DRBG:**

-   BBC (2013): <https://www.bbc.com/news/technology-24048343>

-   Wikipedia: <https://en.wikipedia.org/wiki/Dual_EC_DRBG>

-   Scientific American (2013): <https://www.scientificamerican.com/article/nsa-nist-encryption-scandal/>

-   Cloudflare technical primer: <https://blog.cloudflare.com/how-the-nsa-may-have-put-a-backdoor-in-rsas-cryptography-a-technical-primer/>

-   Daniel J. Bernstein analysis: <https://blog.cr.yp.to/20220805-nsa.html>

-   NIST cryptography history: <https://csrc.nist.gov/nist-cyber-history/cryptography/chapter>

**Juniper Networks:**

-   SecurityWeek (2021): <https://www.securityweek.com/lawmakers-ask-nsa-about-its-role-juniper-backdoor-discovered-2015/>

-   SecurityWeek followup (2023): <https://www.securityweek.com/us-officials-ask-juniper-networks-about-investigation-2015-backdoor/>

-   The Register (2020): <https://www.theregister.com/2020/06/10/congress_juniper_letter/>

-   Bloomberg (2021): <https://finance.yahoo.com/news/juniper-breach-mystery-starts-clear-130016591.html>

-   Schneier on Security (2016): <https://www.schneier.com/blog/archives/2016/04/details_about_j.html>

-   CNBC (2020): <https://www.cnbc.com/2020/10/28/spy-agency-ducks-questions-about-back-doors-in-tech-products.html>

-   CyberScoop (2021): <https://cyberscoop.com/nsa-juniper-backdoor-wyden-espionage/>

-   Threatpost (2021): <https://threatpost.com/solarwinds-nsa-encryption/163561/>

**China National Time Service Center:**

-   The Record (Oct 2024): <https://therecord.media/china-attack-national-time-center>

-   Modern Diplomacy (Oct 2024): <https://moderndiplomacy.eu/2025/10/19/nsa-accused-of-stealing-secrets-from-chinas-national-time-centre/>

-   Fox News (Oct 2024): <https://www.foxnews.com/politics/china-accuses-us-yearslong-cyberattack-national-time-service>

-   CyberScoop (Oct 2024): <https://cyberscoop.com/china-mss-nsa-cyberattack-timekeeping-service/>

-   The Register (Oct 2024): <https://www.theregister.com/2025/10/20/china_accuses_us_cyber_warfare/>

-   Nextgov/FCW (Oct 2024): <https://www.nextgov.com/cybersecurity/2025/10/china-accuses-nsa-multi-year-hack-targeting-its-national-time-systems/408912/>

-   Tom's Hardware (Oct 2024): <https://www.tomshardware.com/tech-industry/cyber-security/china-says-it-has-foiled-a-series-u-s-cyberattacks-on-its-critical-infrastructure-ministry-of-state-security-says-it-has-irrefutable-evidence-nsa-tried-to-cause-international-time-chaos>

-   The Hacker News (Oct 2024): <https://thehackernews.com/2025/10/mss-claims-nsa-used-42-cyber-tools-in.html>

-   CSO Online (Oct 2024): <https://www.csoonline.com/article/4075846/us-nsa-alleged-to-have-launched-a-cyber-attack-on-a-chinese-agency.html>

The pattern is clear. The incentives are clear. The equilibrium is stable.

And the framework that could change it will remain theoretical---not because it doesn't work, but *because it works too well.*
