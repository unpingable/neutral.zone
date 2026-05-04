---
title: "The Lie Is Cheaper Than the Proof"
date: 2026-05-01
---

The smallest version of the problem is maybe six characters long:

`as any`

That is basically TypeScript for: please stop asking.

Not always dishonestly. Not always lazily. Sometimes the type system is wrong, or incomplete, or standing between you and an urgent fix. Sometimes the proof is genuinely too expensive for the moment. Production is on fire. The release has to go out. The library types are broken. The API lies. The world, inconsiderately, has failed to conform to the interface.

Fine.

The problem is not that escape hatches exist; any real system needs them. The problem is that software culture has spent decades turning escape hatches into operating procedure.

`as any`. `# type: ignore`. `// eslint-disable`. `@ts-expect-error`. `TODO`. `FIXME`. `mock.patch`. Happy path. Golden fixture.

Each one can be legitimate. Each one can also be a tiny epistemic laundering device: an instruction to the toolchain, the test suite, the reviewer or the future maintainer to stop demanding proof.

The lie is cheaper than the proof.

That is not a moral accusation against individual developers. Mostly. Software is full of people doing their best inside machines designed to reward the wrong evidence. The person writing `as any` at 4:50 p.m. on a Friday and the VP signing off on a "known limitation" before launch are often performing the same move at different altitudes. One is local. One is institutional. Both convert an unresolved obligation into a declared non-problem.

The unresolved thing does not disappear. It merely changes custody.

Usually to ops.

## The compiler was instructed not to ask

A type checker is not truth. A test suite is not truth. CI is not truth. But each is at least a small procedural demand: show me why this works.

Escape hatches are ways to interrupt that demand.

Again, this is sometimes necessary. A language without escape hatches becomes a little compliance state with syntax highlighting. But a culture built around escape hatches becomes something worse: a system where the cheapest path to progress is declaring the problem uninteresting.

This is why "technical debt" is often too polite a term. Debt implies accounting. Debt implies a creditor, a balance, a maturity date, an expectation of repayment. What software usually creates is not debt. It is unpriced obligation.

There is no ledger. There is no due date. There is no owner whose name survives the reorg.

There is just a comment.

A comment is not a plan.

A skipped test is not a risk assessment.

A green build is not evidence that the thing works. It may only be evidence that the build was taught not to look where the body is buried.

This is why little tools that force metadata onto unresolved work feel more serious than their size suggests. A tool whose entire value proposition is "the lie you told the compiler should at least have an expiration date" is not really a productivity tool so much as harm reduction.

The joke is funny because the premise is obscene: the industry normalized lying to its own verification machinery, so now we need tiny rude software to ask whether the lie still has a business justification.

This is not sophistication; it's closer to a sink with a Post-it note that says "water probably stops eventually."

## Happy path theology

"Happy path" is one of those phrases that tells on an industry.

The happy path is the system under parental supervision. The input is polite. The dependency responds. The user behaves. The network stays up. The schema is exactly the shape we embalmed last Tuesday. The fixture is golden because we dipped reality in acrylic and called it reproducibility.

These tests are not useless. You need them. A parser that cannot parse the polite example is not ready for the impolite one.

But happy path testing becomes theology when the green checkmark is treated as permission to stop thinking.

The world does not send golden fixtures. The world sends valid JSON containing social violence. It sends a customer record with three middle names, a missing country code, a 17-year-old migration artifact, a null where the docs promised a string and a third-party API response that is technically standards-compliant in the way a raccoon is technically a mammal.

Production is not the happy path. Production is where inputs develop motive.

A serious engineering culture would treat happy path tests as smoke tests, not sacraments. It would ask what happens under ambiguity, partial failure, stale state, adversarial input, inconsistent dependencies and operator fatigue. It would price those questions into the work.

Software mostly does not price those questions into the work.

Instead, it prices the demo.

## Accepted risk, the executive `as any`

At the organizational layer, the syntax changes but the operation is the same.

"Accepted risk."

"Known limitation."

"Temporary workaround."

"Post-launch cleanup."

"We'll circle back."

These phrases can be legitimate. Risk acceptance is real. You cannot eliminate every hazard before shipping anything. Engineering is not monastic purity, even though some mailing lists have tried. Adults make tradeoffs.

But a tradeoff is not the same thing as a euphemism.

A real tradeoff names the hazard, the owner, the blast radius, the detection mechanism, the rollback path and the date at which the decision must be reconsidered. It says: we are choosing this exposure because the alternative costs more than the current risk, and here is the person authorized to make that decision.

Most "accepted risk" in software is less dignified. It means the unresolved obligation has been moved out of the release conversation.

It means the lie has changed format.

At the code layer, the bypass is `as any`.

At the product layer, the bypass is "MVP."

At the management layer, the bypass is "strategic priority."

At the governance layer, the bypass is "accepted risk."

Different costumes. Same gesture.

**Stop asking for proof.**

The trick works because software organizations are very good at producing artifacts that resemble accountability. Tickets. Roadmaps. Risk registers. Incident reviews. Compliance documents. Architecture decision records. Quarterly planning rituals. Sacred burndown charts arranged in pleasing managerial geometry.

The artifacts create the appearance of custody.

But appearance is cheap. Actual custody is expensive.

Of course, metadata is not accountability. A ticket, owner or expiration date only matters if it can actually bind behavior. Otherwise it becomes a more legible form of theater: the system has not accepted responsibility, it has merely improved the labeling on the hole.

Custody means someone remains answerable after the launch, after the migration, after the reorg, after the architect leaves, after the vendor changes pricing, after the dependency enters maintenance mode and after the person who understood the actual invariant burns out and buys a farm, or more realistically threatens to and then keeps paying rent.

That is the work software avoids pricing.

## Velocity is legible. Reliability is invisible until it fails.

This is where the incentive structure does its little knife trick.

Velocity is visible. Shipping is visible. New features are visible. Roadmaps are visible. Demos are visible. A dashboard showing more completed tickets is visible enough to become a management object, which is the closest thing many organizations have to reality.

**Reliability is mostly invisible when it works.**

The best ops work is anti-theatrical. It prevents the meeting. It prevents the outage. It prevents the urgent migration. It prevents the expensive executive apology. It prevents the sort of event that would have proved its own necessity.

This makes reliability institutionally fragile. It has to be defended before the failure. But the failure is often the only evidence management recognizes.

So the system rewards the person who creates visible motion and externalizes the risk. It under-rewards the person who quietly prevents collapse. Then, when collapse arrives, the second person is handed a pager and asked why they were not more proactive.

This is not a craft problem, but an evidence problem.

Software organizations tend to treat proof as delay and declaration as progress. They reward the artifact that can be shown upward, not the invariant that keeps the system alive downward.

Shipping becomes proof of competence.

Not failing yet becomes proof of safety.

A quiet dashboard becomes proof of health.

A passing test suite becomes proof of truth.

A compliance checklist becomes proof of governance.

None of these are proof. They are, at best, observations. Sometimes they are just vibes with timestamps.

## The liability surface is smeared on purpose

Traditional engineering has its own pathologies, mythology and paperwork theater. This is not a hymn to civil engineering as a lost priesthood of perfect adults. Bridges fail. Planes crash. Firms cut corners. Institutions lie.

But older engineering disciplines have a clearer relationship between public consequence and professional accountability. A bridge collapses. A pressure vessel explodes. A plane falls out of the sky. There are drawings, signoffs, regulations, inspections, licensing structures and a public vocabulary for asking who was authorized to make the decision.

Software never built that substrate at scale.

There were attempts. They mostly died quietly, because the market had little incentive to recognize professional liability when it could route consequence through employment contracts, vendor opacity, terms of service, insurance, procurement fog and the magical phrase "known issue."

Meanwhile software became infrastructure anyway.

It runs hospitals, logistics, banking, elections, identity, schools, utilities, media distribution, transportation, emergency response and the management systems that decide whether humans are eligible for basic services. It did not wait for the profession to become serious. It simply became load-bearing while everyone was still arguing about frameworks.

**This is how you get civilizational-scale dependence on systems governed by app-store incentives.**

[Log4Shell](https://www.cisa.gov/news-events/news/apache-log4j-vulnerability-guidance) was not simply "a bug in a logging library." It was a demonstration that a small dependency could become a global emergency because modern software supply chains make local code globally infrastructural.

CrowdStrike was not simply "a bad update." It was a demonstration that a private security control deployed at platform speed could disable public-facing institutions at infrastructure scale.

In both cases, the public consequence was larger than the accountability surface. That is the shape of the era.

The software industry became civil infrastructure without accepting civil engineering's burden of legibility.

## Rigor was priced out

This is the part that makes the usual reform language feel weak.

People say software engineering needs more rigor. Fine. True enough.

But rigor did not merely fail to arrive. Rigor was priced out.

It interferes with velocity narratives. It slows demos. It makes uncertainty visible. It forces uncomfortable conversations about ownership, consequence and whether the thing being shipped has actually earned the authority it is being given.

Rigor asks for evidence.

The system wants declarations.

That is why so many software rituals feel like accountability cosplay. The industry is full of processes that resemble discipline while carefully avoiding the expensive part: binding consequences to decisions.

Agile became schedule laundering.

DevOps became "ops absorbs product's consequences, but with better YAML."

SRE became, in some places, a reliability conscience bolted to organizations structurally committed to ignoring it.

Security became compliance theater until attackers performed the audit.

Architecture became diagrams of wishes.

AI governance, now arriving with the damp confidence of a consultant in a quarter-zip, often repeats the pattern exactly: policy declarations, evaluation artifacts, red-team theater and alignment claims that may or may not survive contact with incentives.

Again: declaration is cheaper than proof.

## The machine converts assertions into consequence

Modern software is a machine for converting unproved assertions into shipped systems, then redistributing the consequences to whoever is closest to production.

That is the postmortem before the incident.

A developer asserts the type is fine.

A test asserts the example is representative.

A team asserts the risk is acceptable.

A manager asserts the launch is necessary.

A vendor asserts the platform is resilient.

A compliance artifact asserts the control exists.

A company asserts the user accepted the terms.

Then reality arrives with a tire iron.

The system does not fail because nobody cared. It fails because care was made non-authoritative. The people closest to the failure often saw the shape of it. They knew the shortcut was not free. They knew the test was thin. They knew the dependency was weird. They knew the migration plan had a smell. They knew the rollback path was mostly folklore. They knew the runbook was aspirational literature.

But knowing is not standing.

This is the real insult. Software organizations are full of knowledge that cannot bind action.

The person who knows is not necessarily the person authorized to stop the launch. The person authorized to stop the launch is not necessarily the person who understands the failure. The person who will inherit the failure may be neither.

That is not engineering. That is consequence arbitrage.

## Make the lie carry weight

You do not fix this by banning escape hatches; that's childish. Real systems need overrides, bypasses, temporary suppressions and emergency authority.

Some shortcuts are rational. Some are even *correct*. The pathology begins when the organization cannot tell the emergency bypass from the architecture.

You fix it by making every bypass carry weight.

If you write `as any`, say why.

If you suppress a lint, name the owner.

If you skip a test, give it an expiration.

If you accept risk, identify who is allowed to accept it and who will live with the result.

If you ship a known limitation, define the detection mechanism and the rollback path.

If you rely on a dependency, record what failure would look like if it betrayed you.

If you declare something safe, produce the evidence, not the mood.

The point is not perfection. The point is custody. Not paperwork around evasion; custody.

A lie with an owner, a reason and an expiration is at least a governable object. A lie without those things becomes sediment. It hardens into architecture. Then one day someone calls it legacy and hires consultants to excavate it with spoons.

Software does not need more ritual. It needs sharper accounting for unproved claims.

The happy path is not enough.

The golden fixture is not enough.

The green build is not enough.

The roadmap is not enough.

The risk register is not enough.

The question is always the same:

**What has actually been proven, what has merely been declared and who inherits the difference?**

Until software can answer that cleanly, the industry will keep doing what it has learned to do best: shipping the assertion, hiding the proof debt and letting production collect.
