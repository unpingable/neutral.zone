---
title: "The Next Restriction Is a Ticket"
date: 2026-08-18
---

There is something almost perfectly stupid about the way this is happening.

Kalshi spent years insisting that its event contracts were federally regulated derivatives rather than gambling. Then it expanded heavily into sports, elections, politics, entertainment, and every other category where the distinction between "prediction market" and "betting website with unusually serious typography" becomes difficult to maintain with a straight face.

Washington state sued. A preliminary injunction followed in July. On August 13, King County Superior Court Judge John McHale issued a final order requiring Kalshi to stop offering a broad set of contracts to Washington residents. Kalshi has also failed, so far, to obtain a stay.

And then the interesting part happened.

The order did not merely tell Kalshi to stop serving certain markets in Washington. It gave the company an implementation schedule. **Tomorrow, August 19, Kalshi must have an IP-address and residency-based geofence in place. By September 2, it must deploy a multi-source geofencing solution.** Sports, elections, politics, entertainment, culture, technology, science, and "mentions" contracts are covered; commodities, climate, economics, and finance are not. Failure to comply with the September deadline can expose Kalshi to penalties of up to \$120,000 per day.

Read that again, but ignore the gambling dispute for a moment.

A court has effectively handed an internet service a category matrix, a deployment deadline, and a per-day fine.

That is the more consequential story.

Not because Washington has suddenly acquired jurisdiction over packets. It hasn't. Not because every future state restriction will survive constitutional review. It won't.

The important change is more boring:

**Jurisdiction is becoming a routine application-layer primitive.**

What once looked like an awkward exception to the architecture of the internet increasingly looks like an ordinary function call:

    policy(user, jurisdiction, category, attributes) → permitted_product

Once that function exists, a service is no longer quite one service.

It is a family of projections.

### The borderless internet had an engineering dependency

There has always been a philosophical version of the borderless internet: packets do not care about state lines; publishing to a global network should not require fifty different versions of reality; one jurisdiction should not casually dictate what everybody else can see.

But the practical force of that idea also depended partly on engineering. For a long time, reliably determining where an internet user was located was difficult, expensive, inaccurate, or all three. That did not create a constitutional right to geographic ambiguity. It did make some state-specific remedies considerably harder to impose without effectively burdening activity outside the state as well.

Jack Goldsmith and Eugene Volokh made the argument explicitly in their 2023 *Texas Law Review* article, ["State Regulation of Online Behavior: The Dormant Commerce Clause and Geolocation."](https://texaslawreview.org/state-regulation-of-online-behavior-the-dormant-commerce-clause-and-geolocation/) As geolocation became more pervasive, accurate, and inexpensive, they argued, one of the practical objections to state-specific internet regulation weakened: an online service could increasingly distinguish users in one state from users elsewhere, comply locally, or refuse service there rather than necessarily changing the product for the entire country.

David Post responded in *[Texas Law Review Online](https://texaslawreview.org/wp-content/uploads/2023/04/Post.FR_.pdf)* that geolocation did not solve the jurisdictional problem so much as accentuate it. The network might remain global while services became responsible for reconstructing political borders at the application layer.

The argument was somewhat theoretical in 2023.

It is now becoming procurement.

### Gambling paid the fixed cost

Online sports betting created an unusually strong commercial reason to know, with high confidence, exactly where a customer is.

An IP address was not enough. VPNs exist. Mobile users move. People spoof locations. Betting operators are licensed state by state and have enormous incentives to exclude wagers originating a few hundred feet outside the permitted jurisdiction.

So an industry grew around solving the problem.

GeoComply, probably the best-known example, sells a stack combining geolocation, device integrity, fraud detection, KYC, VPN and proxy detection, and evidence suitable for demonstrating compliance. Its customers include major regulated gambling operators.

But the product category is already spreading beyond gambling.

In September 2025, GeoComply cofounder and chair **Anna Sainsbury** published an op-ed titled ["Fixing the Online Safety Act: look to betting, not to bans."](https://www.techradar.com/pro/fixing-the-online-safety-act-look-to-betting-not-to-bans)

The argument was explicit. US sports betting already has location-verification infrastructure capable of detecting circumvention. Rather than banning VPNs, online-safety regulators could require platforms to obtain additional location signals when circumvention is detected. If the technology can uphold geographic restrictions in regulated betting, Sainsbury argued, it can be applied to online-safety rules as well.

There is the mechanism.

It does not require a conspiracy. Nobody needed to sit down and design a general-purpose state-border enforcement system for the internet.

They built a sports-betting compliance product.

Everyone else now gets the option to buy the affordance.

### The next restriction is a ticket

This trajectory is easy to misread.

It is tempting to say:

> Gambling gets geofenced, therefore eventually everything will be geofenced.

That is a slippery-slope argument, and it is not the one I am making.

**The mechanism spreading is not the same as the authority spreading.**

Washington has unusually broad authority over gambling within Washington. A state trying to geographically restrict constitutionally protected speech faces a very different legal problem. Telemedicine, financial products, adult content, AI systems, gambling, and political speech all sit in different statutory and constitutional regimes.

The fact that a regulator *can technically enforce* a restriction does not give it legal authority to impose one.

But technical feasibility still matters. It changes the menu of remedies that courts and regulators can plausibly consider, and it changes how burdensome geographic tailoring appears.

The Supreme Court's 2025 decision in *Free Speech Coalition v. Paxton* is instructive, although narrower than some commentary suggests. The Court upheld Texas's age-verification requirement for commercial pornography under intermediate scrutiny, treating the burden on adults as incidental and age verification as an ordinary means of enforcing an age restriction in that specific context. It did **not** announce that any technically precise internet restriction is constitutional, and other categories of speech may receive substantially stronger protection.

The broader shift is nevertheless hard to miss.

A remedy that once sounded technologically extraordinary increasingly sounds administratively ordinary.

The Washington Kalshi order does not say:

> Somehow figure out how to stop people in Washington from doing this.

It says, in effect:

> IP and residency geofence by this date. Multi-source geofence by that one.

That matters because the generic enforcement point now exists. A future regulator operating under some *independently valid authority* does not necessarily have to litigate feasibility from first principles. There is an industry, a vendor category, deployed examples, and a growing body of experience saying: this can be done.

The expensive political and legal argument remains.

The expensive engineering argument increasingly does not.

Once the enforcement point is generic, compliance begins to look like configuration:

    WA × sports              → deny
    WA × elections           → deny
    WA × commodities         → allow
    MA × sports              → deny
    TX × age-gated-content   → require_verification

The first row required an industry.

The next one may require a ticket in somebody's sprint.

### This is already entering the AI-policy conversation

AI makes the trajectory particularly easy to see because state legislation is developing faster than any durable national settlement.

A 2025 [Andreessen Horowitz policy discussion](https://a16zpolicy.substack.com/p/the-dormant-commerce-clause-explained) on the Dormant Commerce Clause and state AI laws repeatedly returned to geographical scope: whether a state is regulating activity directed toward people inside the state, whether developers can segment their operations, and whether a provider can simply decline to make a particular product available there. Technological ability to distinguish users by geography was part of the practical discussion.

A16z is hardly a disinterested observer in AI regulation. That is precisely why the conversation is useful.

Industry lawyers are already thinking in terms of **jurisdictionally segmented products**.

The likely future is not necessarily fifty different model binaries or fifty national firewalls in miniature. It is one service with a policy layer.

Perhaps one state prohibits a particular category of automated hiring system. Another imposes additional requirements on an AI companion product. Another requires specific disclosures. Another creates rules around financial or medical advice.

Whether any particular law survives constitutional, statutory, or federal-preemption challenges is a separate question.

But where the authority survives, the implementation path increasingly looks familiar:

    if jurisdiction == X and category == Y:
        apply policy Z

The model remains the model.

The product does not.

### Jurisdiction over customers, not packets

There is an important limit here.

This machinery works most naturally where the service already knows something about you.

Kalshi is unusually governable because Kalshi has customers. It has accounts, identity information, money moving through financial rails, regulatory registrations, and a company with assets that courts can sanction.

The Washington order itself makes the distinction obvious: the first-stage requirement combines **IP location with residency**. That is not merely packet geography. It is a join between network observations and an identified customer.

This is why the ratchet will bite hardest first on systems that already contain obvious chokepoints:

-   gambling

-   financial services

-   age-gated products

-   licensed professional services

-   large social platforms

-   payment-mediated services

-   regulated AI products

A foreign website with no accounts, no domestic assets, no payments to interrupt, and no interest in compliance remains a much harder problem.

Nor are accounts the only enforcement point. App stores, payment networks, hosting providers, identity vendors, and other intermediaries can sometimes impose geographic rules farther out in the distribution chain. The direct version of this architecture converges on identifiable customers; the indirect version converges on whatever intermediary can practically withhold something the service needs.

The point is not that every packet acquires state citizenship.

The point is that a growing share of the economically important internet already contains enough identity, payment, distribution, or platform machinery to make jurisdiction operational.

### One service becomes many services

Once jurisdiction enters the policy engine, something conceptually strange happens.

Two people can visit the same hostname, use the same app version, authenticate to the same company, and receive materially different products.

One sees a market. The other does not.

One sees a piece of content. The other sees an age gate.

One has access to a feature. The other receives "not available in your state."

Nothing about the underlying network needs to fragment.

The fragmentation occurs in **composition**.

This is where the argument generalizes beyond Kalshi, and the distinction matters. A betting transaction is an explicit attempted act: the service ordinarily has to accept or deny it. A feed, search result, recommendation surface, or feature set does not necessarily work that way. An object can simply fail to enter the composed response at all.

Kalshi demonstrates the increasingly ordinary **jurisdictional policy primitive**. It does not demonstrate every future use of that primitive.

But once the primitive exists, domains whose own legal authority permits geographically differentiated composition have a much cheaper architectural path to doing it.

This is why "splinternet" is slightly the wrong metaphor. It suggests separate networks, national firewalls, broken routing, or different copies of the web.

The network can remain perfectly intact.

What changes is the projection.

The declared object remains something like:

*Kalshi.*\
*Instagram.*\
*ChatGPT.*\
*Whatever comes next.*

The operational object becomes:

> the version of this service permitted for **you**, **here**.

Eventually it becomes surprisingly difficult to answer the simple question:

**What does this service do?**

The honest answer may be another question:

**For whom?**

### And then history becomes optional

Now add time:

    policy(user, jurisdiction, category, attributes, t) → view

Suppose a platform decides that users in Washington may no longer receive items in category X.

Yesterday, a matching object appeared in your feed.

Today, the feed service simply removes matching objects before returning its response. There need be no deletion, no moderation record, and perhaps no "blocked because you are in Washington" artifact. The object simply never reaches the array your client renders.

From your perspective, it disappeared.

But did an event occur?

Not necessarily.

**Not being shown something isn't an event.**

This does not mean platforms *cannot* preserve history. They can log policy decisions, retain policy versions, archive composition inputs, and record which rule excluded which object from which response. Compliance obligations may sometimes require exactly that.

The point is that **view history is not naturally produced by the operation itself**.

A denied financial transaction often creates a durable record because the business needs one. A feed item that never entered the response may leave no comparably useful artifact unless someone deliberately decides to preserve it.

And reconstructing a historical view requires much more than saving the current policy table. You may need the policy version, relevant user attributes at the time, the candidate set before filtration, ranking inputs, and the specific exclusion decisions that produced the response.

Without those, the service can remain perfectly operational while historical reconstructability disappears.

You cannot meaningfully ask:

> What changed in the service for Washington users last Tuesday?

if the system retained only enough information to answer:

> What does the policy return now?

That creates an accountability problem quite different from old-fashioned deletion.

"The underlying records remained available" can be completely true while saying very little about what ordinary users were actually permitted to encounter.

**Openness at the record layer can become an alibi for opacity at the composition layer.**

### Compliance may become a moat

There is another reason this architecture may become difficult to unwind once established.

A fifty-state policy matrix is not free.

Someone has to track legislation, court orders, categories, residency rules, product classifications, age requirements, identity rules, appeals, policy versions, logging requirements, and exceptions. Someone has to integrate the geolocation and identity vendors. Someone has to defend the resulting compliance program.

Large incumbents are better positioned to amortize that cost than small operators.

That does not mean the Kalshi order has already created a competitive moat, or that every regulated firm will eventually welcome the regime. It means the economics point in a familiar direction: once a large incumbent has absorbed the fixed cost of sophisticated compliance, a mature and predictable regime can become less threatening to it than to a new entrant that has not.

We have seen versions of that dynamic across regulated industries. It would be unsurprising to see it here.

The vendor certainly has no incentive for the enforcement primitive to disappear. The compliance industry does not either. Regulators gain an increasingly credible answer to "how would this even be enforced?" Large firms may eventually gain infrastructure whose cost newcomers must duplicate.

The regime can therefore acquire constituencies of its own even if nobody originally set out to build "state borders for the internet."

### American internet probably will not become fifty internets

It will not need to.

The more plausible future is much less theatrical.

The packets still route.

The TLS connection still works.

The hostname still resolves.

The app still opens.

Behind it sits an increasingly sophisticated policy engine determining which version of the product this particular user is legally and commercially entitled to receive.

That may sometimes be good. There are legitimate differences among jurisdictions. There are products we already expect to be regulated geographically. There are laws that cannot function at all if putting something on the internet automatically places it beyond local authority.

Nor is technical impossibility a particularly principled foundation for civil liberty.

But we should notice when a practical constraint that quietly limited the available regulatory toolkit begins to disappear.

For much of internet history, "you cannot realistically make this service behave differently at every state border" was often a serious implementation objection. It was not an enumerated right. It wasn't absolute. But it made some remedies costly, unreliable, extraterritorial, or simply absurd.

Sports betting had enough money behind it to weaken that objection.

Now the vendor industry that helped solve the problem for gambling is openly arguing that the machinery transfers to online safety. State AI-policy discussions already contemplate geographic segmentation. Courts can increasingly order geofencing without requiring someone to *invent* geofencing first.

The authority for each restriction will still have to be fought over separately.

**The mechanism is increasingly sitting there waiting.**

The American internet may remain one network while becoming thousands of legally contingent product surfaces assembled per user, per jurisdiction, per category, and eventually per request.

Nobody will announce the transition.

From inside any one session, everything will look normal.

**The border moves from the router into the policy engine.**

And once it's there, the expensive part is over.
