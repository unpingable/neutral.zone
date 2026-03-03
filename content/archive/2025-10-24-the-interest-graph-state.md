---
title: "The Interest Graph State"
date: 2025-10-24
---

*We're entering what McLuhan called the **acoustic space**---participatory, simultaneous, nonlinear. The new literacy is **meta-literacy**: the ability to read systems, not just sentences. The tragedy isn't that people stopped reading books; it's that they're being trained to read nothing but themselves reflected back by the feed.*

TikTok didn't win with better content; it won with better learning. ByteDance's **Monolith** system updates the parts of the model that changed---**in real time**---so preference inferences keep pace with your thumb. Short video yields dense signals; **dwell and completion** out-predict likes; within a couple of hours the system has a working profile that feels like mind-reading. From there everything that matters---trend velocity, creator precarity, and the theater of moderation playing catch-up with the recommender---falls out as a property of the machine.

## The Machine Learns Faster Than You Can Swipe

Unlike batch-trained systems that update models daily or weekly, Monolith pushes minute-level sparse embedding updates from training to serving via a "touched-keys" set---only changed parameters transfer, not full models. This uses collisionless embedding tables implementing Cuckoo hashing to minimize degradation from hash collisions that plague traditional systems. The consequence: real-time learning collapses the pause that used to protect users from their own impulses.

Wall Street Journal investigations using bot accounts documented this capability empirically: TikTok locked onto user interests within roughly two hours, heavily keying on dwell time and completion rate. Reporting on leaked internal documents revealed videos receive scores calculated from predicted probabilities of engagement multiplied by value weights---with watch time and completion rate dramatically outweighing likes. The system learned that people casually like content but only rewatch what genuinely compels them.

ByteDance's infrastructure separates training and serving functions, allowing the system to learn continuously while delivering recommendations without performance degradation. Processing billions of daily videos, the system achieves something competitors still struggle to match: it learns from your behavior faster than you can notice it happening. The technical result is algorithmic omniscience that feels like magic---until you recognize it as industrial-scale behavioral surveillance optimized for engagement.

## From Social Graph to Interest Graph

TikTok's most revolutionary design choice was deprioritizing the social graph entirely. While Facebook, Instagram, and Twitter built platforms where connections determine distribution, TikTok made follower counts algorithmically irrelevant through graduated exposure testing. Every video gets shown to a small initial audience regardless of creator size. Strong engagement triggers exponential distribution expansion; weak performance confines videos to obscurity. Each video gets evaluated independently.

**The result is opportunity without baseline reach---zero-follower virality becomes structurally possible, but so does perpetual anxiety.** Creators with millions of followers can see videos die with hundreds of views. Success becomes unpredictable, creating the conditions for what creators call the "treadmill": constant content production attempting to maintain algorithmic visibility, with no ability to bank past successes into future security.

This interest-based routing means new creators automatically find audiences if content matches established interest patterns. Remixable sounds provide built-in audience networks---using trending audio connects creators to existing communities consuming that sound. This democratization powers TikTok's cultural position as the platform where "anyone can go viral overnight," while simultaneously creating economic precarity for those dependent on algorithmic favor.

## Creator Convergence and "TikTok Voice"

Observable creator behavior reveals sophisticated adaptation to algorithmic incentives. Despite the system's opacity, creators develop shared theories through experimentation and community knowledge exchange. The first three seconds determine video fate, so creators develop standardized hook strategies: provocative questions, timers creating urgency, flash-forwards showing end results. Jump cuts maintain stimulation, eliminating contemplative pacing that risks viewer departure.

The most striking convergence appears in vocal patterns. "TikTok voice" emerged as recognizable speech aesthetic: exaggerated intonation, high rising terminal, vocal fry, breathiness. Linguists identify these as floor-holding strategies optimizing for attention retention. The algorithm rewards content that keeps viewers watching, selecting for vocal characteristics that prevent thumb-scrolling. Creators report consciously adopting TikTok voice after noticing engagement spikes---rational economic actors responding to algorithmic signals by homogenizing their speech.

Content formats standardize similarly. GRWM (Get Ready With Me), "POV" scenarios, storytime narratives---successful frameworks get replicated thousands of times. The most sophisticated adaptation is "algospeak"---coded language evading automated content moderation. "Unalive" replaces suicide, "seggs" means sex, "le\$bian" bypasses filters. Marginalized creators---LGBTQ+, plus-size, BIPOC---report disproportionate flagging, making algospeak development necessary for visibility and income access.

This convergence isn't artistic laziness---it's economically rational adaptation to opacity under dependence. When income relies on algorithmic distribution and the algorithm remains black-boxed, creators converge on proven patterns rather than risk innovation that might tank reach. Selection pressure toward algorithmic legibility reduces diversity despite the platform's appearance of infinite variety.

## Addiction Is a Design Outcome, Not a Side Effect

Washington Post analysis tracking user behavior documented how TikTok's design creates compulsive usage patterns. The full-screen swipeable interface creates flow states where time distortion occurs---users lose track of time across hour-scale daily usage. Everything happens in the thumb zone with minimal friction, removing natural stopping points. The algorithm continuously serves content matching interests, maintaining engagement through personalization.

Documents obtained through legal discovery and state investigations revealed TikTok executives knew users could develop compulsive usage patterns quickly, with algorithmic "filter bubbles" forming in under an hour of targeted content consumption. Internal communications showed the company understood screen time limiting tools had minimal effectiveness.

Research on attention dynamics documents observable impacts. Studies found roughly 50% of TikTok users report finding videos over 1 minute "stressful"---they've adapted to 15-30 second content consumption, making longer engagement feel effortful. Students report difficulty reading books, finishing homework, and watching full-length films. The mechanism operates through dopamine systems and variable reinforcement schedules similar to gambling mechanics---the next video might be the perfect one.

Oxford named "brain rot" its 2024 Word of the Year, defining it as "supposed deterioration of a person's mental or intellectual state" from consuming "trivial or unchallenging" online content. Paradoxically, teens use the term with sophisticated irony to describe content they deliberately seek. What's undeniable is the structural optimization for engagement over wellbeing---design that deliberately exploits psychological vulnerabilities to maximize watch time, the metric determining advertising revenue.

## Moderation Theater vs. Amplification Reality

TikTok's stated content policies claim "safety and well-being" as top priority. **In practice: TikTok's policy stack performs safety; the recommender optimizes watch time. When those collide, watch time wins.**

Research from the Molly Rose Foundation analyzing publicly available posts found 49% of the most engaged posts on TikTok were harmful (suicide, self-harm, depression content), with 54% exceeding 1 million views. A March 2025 arXiv study using bot accounts found "content aligned with the bots' interests undergoes strong amplification, with rapid reinforcement typically occurring within the first 200 videos watched." As amplification increases, content diversity declines.

In the Molly Russell case (UK, 2022), a coroner found suicide and self-harm content "contributed to her death in a more than minimal way"---the algorithm had "selected and provided her with further content that romanticised acts of self-harm by young people." The coroner's Prevention of Future Deaths report specifically named algorithmic recommendation as a contributing factor.

Documents obtained by The Intercept revealed explicit instructions to moderators to exclude creators with "ugly facial looks," "abnormal body shape," and "too many wrinkles" from the For You feed to avoid decreasing "short-term new user retention rate." TikTok admitted to a "glitch" making #BlackLivesMatter and #GeorgeFloyd posts appear to receive 0 views in June 2020---during Black creator protests about shadow banning.

The pattern reveals moderation as performance rather than operational priority. TikTok maintains policies creating legitimacy and regulatory compliance while the recommendation algorithm operates according to engagement optimization, not safety guidelines.

## Creator Economics = Poverty Wages

The original Creator Fund (2020-2023) paid \$0.02-\$0.04 per 1,000 views---meaning 1 million views earned \$20-\$40. The replacement Creativity Program pays more (\$0.40-\$1.00 CPM) but only for 1-minute+ videos and creators meeting strict thresholds. **Net result: survey data shows 92% of creator income still comes from brand deals; TikTok's in-product payouts remain supplementary and volatile.**

The structural problem was the static pool model. TikTok allocated \$200 million initially, dividing this fixed amount among all qualifying creators. As ByteDance's revenue exploded and more creators joined, individual payouts declined. Unlike YouTube's revenue-sharing model where creators get percentages of ad revenue their content generates, TikTok's fixed pool meant platform success paradoxically reduced creator earnings. The economics proved so unpopular that TikTok discontinued the Creator Fund in December 2023.

The economic model creates fundamental instability. TikTok content peaks in 24-72 hours with no evergreen passive income potential. High posting frequency requirements (1-3 times daily) demand constant production without guaranteed returns. Algorithm changes dramatically affect earnings without warning or transparency. Unlike traditional employment with benefits or YouTube's cumulative model where successful videos generate years of passive income, TikTok creators face constant need for virality with no ability to bank past successes.

The contradiction is stark: TikTok portrays itself as empowering creators while operating an extractive economic model that pays poverty wages, maintains opacity about calculations, and creates precarity through algorithmic dependence. The platform captures enormous value from creator content---ByteDance's \$34+ billion revenue depends on creator labor---while compensating them at rates requiring external brand deals for sustainability.

## Surveillance, Jurisdiction, and Theater

TikTok positions itself as an "entertainment app" while operating industrial-scale data collection infrastructure. **Canada's September 2025 privacy ruling delivers the crispest statement to date:** TikTok provided regulators with a 31-page table listing data elements collected, infers age and gender from facial features and voice characteristics, and couldn't keep under-13s off the system at scale---removing approximately 500,000 underage Canadian users per year, but only after they've been tracked, profiled, and targeted with ads.

The investigation documented comprehensive collection: user-provided content, inferred biometric data (facial/voice analytics for age/gender estimation), device information, behavioral tracking, location data, social graphs, and third-party advertiser data. TikTok "estimates or infers, through data analysis, the interests, location, age range, and gender of the individual, as well as their spending power."

TikTok argued it doesn't use "biometric technology" because it doesn't identify unique individuals. Privacy commissioners determined this constituted semantic evasion---TikTok does collect and analyze biometric information by processing physiological features to infer age and gender, even if not for unique identification.

Independent privacy researchers found "TikTok does not appear to collect any more data than your typical mainstream social network." University of Toronto's Citizen Lab reached similar conclusions---collection scope matches competitors. **The distinction lies in legal jurisdiction:** China's national security laws require "any organization or citizen" to "support, assist and cooperate with state intelligence work," creating theoretical government access without equivalent US requirements.

The fundamental issue is which government has potential access, not whether surveillance occurs. US platforms can be compelled to provide data to US intelligence agencies through national security letters and FISA court orders. TikTok could theoretically be compelled by Chinese government under national security laws. The difference concerns which jurisdiction you trust more with your data---a political rather than technical distinction.

CSIS analysis provides perspective: "Influence operations are generally overrated. If American democracy is at risk, survey data suggests this has little to do with external actors. The problem is domestic." The discourse often obscures that data collection, algorithmic amplification of harmful content, and platform governance failures are systemic issues across social media---not TikTok-specific problems.

## So What?

TikTok represents a fundamental shift in platform power dynamics. Where earlier social media distributed content according to explicit human choices (following, subscribing, friending), TikTok operates through machine agency that largely guides content consumption. Users become passive recipients of algorithmically-determined feeds, with limited ability to understand or influence what they see beyond providing behavioral signals through engagement.

This creates asymmetric information environments where the platform knows users better than users know themselves. The algorithm builds psychological profiles from thousands of micro-interactions, learning interests users haven't consciously recognized. For creators, algorithmic dependency creates profound power imbalances. Income depends entirely on an opaque system that changes without notice, explanation, or recourse.

The rational response to opacity under dependence is convergence on proven patterns. When innovation risks income loss and successful formats guarantee engagement, economic logic drives homogenization. The "TikTok voice," standardized hook strategies, replicated formats, and aesthetic convergence all reflect creators optimizing toward algorithmic legibility rather than artistic vision. Selection pressure toward engagement metrics reduces cultural diversity despite surface abundance.

**This isn't meme drift. It's infrastructure working as designed.** The algorithm doesn't just recommend content---it structures human activity at scale, reshaping aesthetic production, cultural metabolism, cognitive patterns, and economic relationships. This transformation extends far beyond TikTok itself, forcing competitors to adopt similar approaches and normalizing algorithmic mediation of cultural production.

The contradictions between institutional narratives and operational realities reveal that TikTok's stated commitments to creator support, user wellbeing, and safety operate as legitimacy-generating rhetoric rather than organizational priorities. The actual priority is engagement optimization---maximum watch time driving advertising revenue. Everything else remains subordinate to this imperative.

The future of digital culture increasingly resembles TikTok's model: interest graphs over social graphs, algorithmic curation over human choice, short-form over long-form, rapid trend cycles over lasting movements, engagement optimization over user wellbeing. Whether this transformation serves human flourishing or corporate profit extraction remains the central question.

**The path forward requires governing the incentive gradient---ranking mechanisms and revenue structures---rather than "digital well-being" cosmetics.** Platforms teach us to read ourselves reflected in the feed rather than read the world. The new literacy is meta-literacy: learning to read the systems that read us, understanding the architectures that structure visibility, and recognizing when optimization for engagement creates selection pressure against human flourishing.

<div>

------------------------------------------------------------------------

</div>

## References

**Technical Architecture:**

-   Zhao, Z., et al. (2022). "Monolith: Real Time Recommendation System With Collisionless Embedding Table." <https://arxiv.org/abs/2209.07663>

**Algorithmic Profiling:**

-   Shapiro, H. (2021). "Inside TikTok's Algorithm: A WSJ Video Investigation." <https://www.wsj.com/tech/tiktok-algorithm-video-investigation-11626877477>

**Compulsive Use Patterns:**

-   Tan, S. & Tiku, N. (2025). "How TikTok keeps its users scrolling for hours a day." *The Washington Post*. <https://www.washingtonpost.com/wellness/interactive/2025/tiktok-addiction-algorithm-scrolling-mental-health/>

**Harm Amplification:**

-   Harwell, D., et al. (2025). "Dynamics of Algorithmic Content Amplification on TikTok." <https://arxiv.org/abs/2503.20231>

-   Molly Russell Prevention of Future Deaths Report (2022). <https://www.judiciary.uk/wp-content/uploads/2022/10/Molly-Russell-Prevention-of-future-deaths-report-2022-0315_Published.pdf>

**Creator Economics:**

-   Lyons, K. (2023). "TikTok is ending its Creator Fund." *CBS News*. <https://www.cbsnews.com/news/tiktok-creator-fund-1-billion-paid-users-making-content-creativity-program/>

**Privacy & Surveillance:**

-   Office of the Privacy Commissioner of Canada (2025). "Joint investigation of TikTok Pte. Ltd." <https://www.priv.gc.ca/en/opc-actions-and-decisions/investigations/investigations-into-businesses/2025/pipeda-2025-003>/

**Cultural Context:**

-   Oxford University Press (2024). "'Brain rot' named Oxford Word of the Year 2024." <https://corp.oup.com/news/brain-rot-named-oxford-word-of-the-year-2024>/
