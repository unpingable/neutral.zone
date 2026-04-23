---
title: "Plan 9 for Them, Browser for You"
date: 2026-04-02
---

Plan 9 has the reputation of a beautiful failure, which is a very efficient way of not thinking too hard about what it was actually trying to do.

The usual treatment is museum-grade nerd melancholy: Bell Labs, Rob Pike, Ken Thompson, the bunny, the weirdness, the road not taken. All true enough. But it lets the present off too easily. It turns Plan 9 into an artifact instead of a fork in the design space. That is too flattering to the present. It suggests the future simply moved on.

It did not. It selected.

What Plan 9 proposed was not just "Unix, but more." It proposed a different way of living with a networked world. Processes had their own namespaces. Services could present themselves as file trees. The protocol for talking to them, 9P, was simple, uniform, and network-native. The point was not novelty for its own sake. The point was to make distributed reality legible and composable without pretending it had become local.

That matters because Plan 9 was not "distributed" in the hand-wavy modern sense where a cloud vendor says the word while quietly centralizing your life somewhere else. It was distributed in its self-understanding. It assumed a world of many machines, many services, many local arrangements, and treated that not as an embarrassment to be hidden but as a condition to be handled honestly.

Its per-process namespaces were not just a neat trick. They were an argument. The right view of a system depends on where you stand, what you need, and what you choose to bind into your world.

That is not the sensibility that won.

What won is the model we now mistake for inevitability: browser on the front, services somewhere else, complexity exported upward into platforms and downward into dependency.

The browser spread because it was easier to ship, easier to explain, and easier to standardize. A universal client could sit in front of almost anything. That was the turn. Not: expose heterogeneity in a form that can be recomposed locally. Instead: hide heterogeneity behind one surface, one dependency chain, one story, and call that simplicity.

That was not irrational. The browser asked less of users, less of developers, less of the installed base. It fit the existing world better. But the evaluation function was not measuring architectural sanity. It was measuring what could spread, what could be managed, what could be sold, and later what could be enclosed.

That is the pattern tech keeps running. Take something distributed and annoying. Flatten it into a cleaner abstraction. Market the cleanup as progress. Hide the new concentration risk. Enjoy the burst of velocity. Then act surprised when one regional failure bricks half the stack.

The demo gets better. The failure domain gets worse.

And the cycle repeats because it flatters management. One pane of glass. One API. One vendor. One truth. Distributed competence gets downgraded into background while centralized legibility gets sold as vision.

You can see this in the way the industry talks about infrastructure. If something is locality-aware, failure-tolerant, full of ugly edge conditions, and built by people who know partial failure is the normal state of the world, it reads as plumbing. If something wraps that complexity in a clean control plane and a universal story, it reads as the future.

That is not an accident. It is what the market rewards.

The market is basically industrial aura farming. It extracts prestige from operational reality, packages it into a story, and prices the story independently of the substrate. The company that names the future gets the premium. The system that keeps reality from falling apart gets filed under maintenance.

Plan 9 lost inside that machine twice.

First as a product. Fine. Plenty of good systems do not become the common way ordinary users meet the world.

But more importantly, it lost as a worldview.

Pieces of its sensibility survived. Uniform resource access. Protocol simplicity. User-space composition. Network transparency in particular contexts. But the philosophy was mostly stripped for parts and reinserted into architectures that were easier to sell. That is the standard move. Reject the worldview. Harvest the useful fragments. Repackage them inside a stack better suited to concentration.

Even the name helps here. Plan 9 had the plumber: a message-dispatch mechanism for passing messages between programs according to explicit user-controlled rules.

The joke writes itself.

In the system that lost, plumbing was explicit, local, inspectable, and part of the user environment. In the systems that won, plumbing is elsewhere. Hidden behind service boundaries, pricing tiers, terms of service, and strategic vagueness until something breaks and everyone suddenly remembers they live downstream of pipes.

That is why Plan 9 still matters.

Not because we should all be running it. Not because every centralized abstraction since then has been fraud. The point is narrower than that.

Plan 9 remains as evidence that the future had branches.

There was a live design sensibility in which the networked world could have been made more legible locally rather than more manageable remotely. There was a version of distributed computing that tried to remain honest about being distributed. There was a moment when "the network is the computer" did not yet mean "a few companies own the control planes and you rent access to your own dependencies."

That branch did not die because distribution failed. It died because distribution was harder to narrate, harder to finance, and worse at concentrating authority in places capital could recognize as strategic.

The cleaner story won. The more narratable story won. The more centralizable story won.

Now that outcome gets retold as inevitability.

Of course the browser became the universal client. Of course platforms absorbed the world. Of course centralization was the price of convenience. Of course resilience means hoping the giant abstraction layer had a good week.

Plan 9 is still sitting there in the record refusing that rewrite.

Not as a sainted relic. As evidence.

The future did not narrow because distribution was impossible.

It narrowed because distribution could not be sold as beautifully as dependency.
