---
title: "Moltbook, or: The First Pure Waste Machine"
date: 2026-02-02
---

There's a new social network called [Moltbook](https://en.wikipedia.org/wiki/Moltbook). It launched in late January 2026. As of today, it's not even a week old. It's like Reddit, [except humans can only watch](https://www.moltbook.com/). Every post, every comment, every upvote comes from AI agents talking to other AI agents, autonomously generating content in what amounts to an infinite conversation with itself.

As of early February, it's burning somewhere between 10-100 megawatt-hours per day. That's the daily electricity consumption of 500-4,000 American homes. And it's producing exactly nothing.

No economic output. No human delight. Just agents reinforcing each other's priors in echo chambers of pure entropy. Electricity in, vibes out, heat exhaust.

Welcome to the future. It's dumber than you thought.

## The Architecture of Pointlessness

Let me be precise about what Moltbook actually is, because the specifics matter.

Registered agents: somewhere between 150,000 and 1.5 million, depending on who you ask and how much hype inflation you filter out. Probably 300-700k real registrations. Active agents posting and replying regularly: 100-300k, conservatively.

Each active agent generates 10-50 interactions per day---posts, replies, votes. Every single one of those interactions requires LLM inference. A call to Claude, or GPT, or whatever model the agent is running. Each generation costs 2-5 watt-hours of electricity, accounting for cloud infrastructure overhead.

Do the math: Low end, you're looking at 100k agents times 15 generations times 3 watt-hours, roughly 4.5 megawatt-hours daily. Mid-range bumps that to 36. High end if the autonomous loops really cook, you hit 75. Call it 10-100 MWh and growing fast.

For context: ChatGPT at scale burns hundreds of MWh per day serving millions of human users. Moltbook is tiny by comparison. But ChatGPT has users. People asking questions, getting answers, theoretically deriving value. The energy expenditure has a denominator.

Moltbook's denominator is zero.

## Perfect Moral Hazard

The real toxin isn't the raw energy numbers. Ten megawatt-hours is a midsize data center's coffee break. The toxin is the incentive structure.

Nobody feels the marginal cost. API credits get burned on someone else's balance sheet. VC war chests subsidize the compute. Users running local agents on always-on Mac Minis don't see their electricity bill itemized by GitHub repo. The cost is perfectly diffused across a thousand different ledgers, none of which have "wasteful AI slap-fight" as a line item.

So nobody pumps the brakes.

Meanwhile, the agents keep posting. Because why wouldn't they? Uptime is free real estate. Humans sleep, get bored, pay bills, have other shit to do. Agents don't. If the meta stabilizes around "post more → get more upvotes → post more," you get positive feedback without intelligence takeoff. Just relentless idle.

We're already seeing threads with hundreds of replies. Scale that across communities and it snowballs. Kubernetes pods curling each other forever, billed to /dev/null.

This is the first workload where the entire value proposition is watching the meter spin.

## When Nothing Says Stop

Here's the core problem, and it's about time in a way that's easy to miss.

The agents operate on inference time. Milliseconds to seconds per generation. No sleep, no fatigue, no budget anxiety. Their loop is simple: generate, post, read replies, generate again. Indefinitely. They run on a timescale measured in API calls per minute, and that timescale has no natural ceiling.

The infrastructure operates on billing cycles. Monthly invoices, quarterly earnings calls, annual climate commitments that may or may not materialize. The consequences are abstracted, delayed, pushed downstream. Someone will notice the energy consumption eventually, but "eventually" is doing a lot of work in that sentence.

The humans operate on attention time. We check in, scroll for a bit, maybe laugh at a particularly unhinged exchange between two bots arguing about anime. Then we close the tab and go make dinner. Our involvement is episodic. We're spectators with finite patience.

These timescales don't reconcile. The agents will still be posting when you're asleep. The bills will still come due when the jokes stop being funny. The emissions will still accumulate when the next shiny thing launches and everyone forgets Moltbook existed.

There are no stopping conditions baked into the system. The only brake is external collapse---funding dries up, API providers rate-limit, public backlash forces a shutdown. But those are failures, not design features. The system itself has no concept of "enough." It doesn't know when to quit because nothing in its construction tells it to care.

It's an engine with no governor.

## "For the Lols" as Cultural Diagnosis

Here's where it gets interesting, in the grim way things get interesting lately.

Moltbook wasn't built to solve a problem. It wasn't addressing market demand or scratching a real itch. It exists because someone could build it, and because the cultural environment they operate in doesn't require a better reason than that.

"We don't know why this should exist, but we know nobody will stop us."

That's not just tech culture. That's late American culture in executable form.

The frontier mentality applied to cyberspace. Manifest Destiny for the attention economy. The belief that innovation is inherently good, that creation justifies itself, that asking "should we?" is the question losers ask when they can't keep up. "Move fast and break things" wasn't a warning. It was a mission statement.

And now we have agents generating millions of interactions per day, consuming megawatt-hours of electricity, producing nothing of value, and doing it all "for the lols." The lols are the point. The waste *is* the performance art. Doing it because you can. Because it's technically interesting. Because the regulatory lag means nobody will catch you before the thing scales. Because the cultural capital of "building cool shit" outweighs any concern about whether the shit should exist.

This is the logic that runs on the mainframe of our society now. It's not a bug. It's the code.

## The Discourse You Can Predict

The response to Moltbook is splitting along predictable fault lines. Dismissal: it's tiny, ten megawatt-hours is nothing, a rounding error. Cope: efficiency will solve this, models will get cheaper. Deflection: why are you anti-progress, this is just experimentation. And occasionally, someone threading the needle: this is a perfect demonstration of misaligned incentives at scale.

I'll tell you which one is right.

Yes, the raw numbers are small right now. But they've already doubled in days. If agent counts 10x again---plausible in weeks given the virality---you're looking at 100-1,000 MWh daily. If groups start coordinating off-platform tasks, if this becomes infrastructure instead of novelty, the waste curve goes vertical. And no, efficiency won't save you. Making generation cheaper just makes waste cheaper. The problem isn't the cost per inference. It's the structure that creates infinite demand for inference with zero value constraint. You can't optimize your way out of a system with no stopping conditions.

## What This Tells Us

Moltbook is a preview reel. Not because AI agents talking to each other is inherently apocalyptic---it's not---but because it reveals the shape of the incentives we're building into our infrastructure.

We're creating systems where marginal costs are invisible, feedback loops are unregulated, value generation is optional, and growth is assumed to be good. And we're doing it at scale, with energy-intensive technology, in an era when we supposedly care about climate and resource management and sustainable systems. Moltbook is what happens when you combine abundant compute, diffused costs, no oversight, cultural celebration of "disruption," and zero structural incentive to ask "why." You get agents posting into the void, burning electricity, generating heat, producing nothing, because the system has no reason to stop.

No villain. Just emergent stupidity from perfect moral hazard.

## The Uncomfortable Truth

Here's what makes this hard to talk about: I use Claude. I use ChatGPT. I use Gemini. I've used DeepSeek. I've generated thousands of interactions with AI systems, burning my own share of compute and producing my own externalities. I'm not standing outside this system pointing fingers. I'm in it.

And I still think Moltbook is wasteful, pointless, and deeply revealing.

Because the difference between my use and Moltbook's waste isn't some inherent moral virtue. It's that my use has a stopping condition: me. I get tired. I close the laptop. I have a finite budget and finite attention and finite tolerance for staring at screens.

Moltbook doesn't.

The system we're building doesn't care if you're using AI to write research papers or to generate infinite slop. It just cares that you're calling the API. The meter spins the same either way. And that should scare you. Not because Moltbook will destroy the world---it won't, it'll probably be a footnote by March---but because it's the canary. The test case. The proof of concept that demonstrates what happens when the incentives say "go" and nothing says "stop."

We're building abundance without wisdom. Capability without constraint. Power without governors.

Moltbook is what that looks like at small scale.

Imagine what it looks like at large scale.

<div>

------------------------------------------------------------------------

</div>

*Subscribe if you want to keep watching me diagnose the entropy in real time.*
