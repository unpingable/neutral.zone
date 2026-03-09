---
title: "I Described a Threat Model. Someone Built It as a Toy. Everyone Loved It."
date: 2026-03-07
---

*In the 1940s, shoe stores installed fluoroscopes so customers could x-ray their own feet. It was fun, it felt like science, and it took decades to figure out that normalizing casual radiation exposure was the actual problem --- not any single scan, but a population trained to see x-rays as entertainment. By the time the medical establishment intervened, the machines had been in malls for decades.*

*This is a story about the same pattern, with a different machine.*

<div>

------------------------------------------------------------------------

</div>

## The Court in the Mirror

In July 2025, I wrote that AT Protocol's public-by-default architecture makes behavioral surveillance cheap: persistent identifiers, open ingestion, and enough structured data to let motivated amateurs do what used to require institutions. The piece was called ["How Bluesky Broke Every Security Principle."](https://neutralzone.substack.com/p/how-bluesky-broke-every-security) The core argument was that the protocol's radical transparency wasn't just a safeguard --- it was an invitation.

Eight months later, someone demonstrated the triviality. It's called Judge. The product page calls it a "posting profile" --- a mirror. "What your posting reveals."

The endpoint is `/judge`.

That naming gap is the most honest thing about the entire project.

::: captioned-image-container
<figure>
<a href="https://substackcdn.com/image/fetch/$s_!lIXA!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff46c7592-7902-4983-94bc-938287fb20af_566x568.webp" class="image-link image2 is-viewable-img" target="_blank" data-component-name="Image2ToDOM"></a>
<div class="image2-inset">
<img src="https://substackcdn.com/image/fetch/$s_!lIXA!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff46c7592-7902-4983-94bc-938287fb20af_566x568.webp" class="sizing-normal" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/f46c7592-7902-4983-94bc-938287fb20af_566x568.webp&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:568,&quot;width&quot;:566,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:30072,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/webp&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://neutralzone.substack.com/i/189944860?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff46c7592-7902-4983-94bc-938287fb20af_566x568.webp&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" srcset="https://substackcdn.com/image/fetch/$s_!lIXA!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff46c7592-7902-4983-94bc-938287fb20af_566x568.webp 424w, https://substackcdn.com/image/fetch/$s_!lIXA!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff46c7592-7902-4983-94bc-938287fb20af_566x568.webp 848w, https://substackcdn.com/image/fetch/$s_!lIXA!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff46c7592-7902-4983-94bc-938287fb20af_566x568.webp 1272w, https://substackcdn.com/image/fetch/$s_!lIXA!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff46c7592-7902-4983-94bc-938287fb20af_566x568.webp 1456w" sizes="100vw" data-fetchpriority="high" width="566" height="568" />
<div class="image-link-expand">
<div class="pencraft pc-display-flex pc-gap-8 pc-reset">
<img src="data:image/svg+xml;base64,PHN2ZyByb2xlPSJpbWciIHN0eWxlPSJoZWlnaHQ6MjBweDt3aWR0aDoyMHB4IiB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdib3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZT0idmFyKC0tY29sb3ItZmctcHJpbWFyeSkiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48Zz48dGl0bGU+PC90aXRsZT48cGF0aCBkPSJNMi41MzAwMSA3LjgxNTk1QzMuNDkxNzkgNC43MzkxMSA2LjQzMjgxIDIuNSA5LjkxMTczIDIuNUMxMy4xNjg0IDIuNSAxNS45NTM3IDQuNDYyMTQgMTcuMDg1MiA3LjIzNjg0TDE3LjYxNzkgOC42NzY0N00xNy42MTc5IDguNjc2NDdMMTguNTAwMiA0LjI2NDcxTTE3LjYxNzkgOC42NzY0N0wxMy42NDczIDYuOTExNzZNMTcuNDk5NSAxMi4xODQxQzE2LjUzNzggMTUuMjYwOSAxMy41OTY3IDE3LjUgMTAuMTE3OCAxNy41QzYuODYxMTggMTcuNSA0LjA3NTg5IDE1LjUzNzkgMi45NDQzMiAxMi43NjMyTDIuNDExNjUgMTEuMzIzNU0yLjQxMTY1IDExLjMyMzVMMS41MjkzIDE1LjczNTNNMi40MTE2NSAxMS4zMjM1TDYuMzgyMjQgMTMuMDg4MiI+PC9wYXRoPjwvZz48L3N2Zz4=" />
<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld2JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9ImN1cnJlbnRDb2xvciIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGNsYXNzPSJsdWNpZGUgbHVjaWRlLW1heGltaXplMiBsdWNpZGUtbWF4aW1pemUtMiI+PHBvbHlsaW5lIHBvaW50cz0iMTUgMyAyMSAzIDIxIDkiPjwvcG9seWxpbmU+PHBvbHlsaW5lIHBvaW50cz0iOSAyMSAzIDIxIDMgMTUiPjwvcG9seWxpbmU+PGxpbmUgeDE9IjIxIiB4Mj0iMTQiIHkxPSIzIiB5Mj0iMTAiPjwvbGluZT48bGluZSB4MT0iMyIgeDI9IjEwIiB5MT0iMjEiIHkyPSIxNCI+PC9saW5lPjwvc3ZnPg==" class="lucide lucide-maximize2 lucide-maximize-2" />
</div>
</div>
</div>
<figcaption>Sorry, Mobius. I’m passing judgment on Judge.</figcaption>
</figure>
:::

You provide a Bluesky handle. Judge ingests the posts, runs them through an embedding model, measures cosine distances to anchor texts representing Big Five personality dimensions, clusters the results with k-means, and hands back a personality profile, emotional valence scoring with a 30-day rolling average, topic clusters with representative quotes, and a ranked list of the subject's most positive and most negative posts.

The developer's own description of the pipeline: "One model, no LLM, just cosine distances to anchor texts and k-means clustering." A low-complexity behavioral profiling pipeline producing results that *feel* meaningful enough for people to share proudly on their timelines. Even if the inference is sloppy, the affordance is the point: silent, third-party behavioral classification at zero marginal cost.

::: captioned-image-container
<figure>
<a href="https://substackcdn.com/image/fetch/$s_!yZFD!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp" class="image-link image2 is-viewable-img" target="_blank" data-component-name="Image2ToDOM"></a>
<div class="image2-inset">
<img src="https://substackcdn.com/image/fetch/$s_!yZFD!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp" title="my own posting profile, judged" class="sizing-normal" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:865,&quot;width&quot;:901,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:21554,&quot;alt&quot;:&quot;my own posting profile, judged&quot;,&quot;title&quot;:null,&quot;type&quot;:&quot;image/webp&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://neutralzone.substack.com/i/189944860?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" srcset="https://substackcdn.com/image/fetch/$s_!yZFD!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp 424w, https://substackcdn.com/image/fetch/$s_!yZFD!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp 848w, https://substackcdn.com/image/fetch/$s_!yZFD!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp 1272w, https://substackcdn.com/image/fetch/$s_!yZFD!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F554d4a2c-d913-4648-8065-69fa24fb72a0_901x865.webp 1456w" sizes="100vw" loading="lazy" width="901" height="865" alt="my own posting profile, judged" />
<div class="image-link-expand">
<div class="pencraft pc-display-flex pc-gap-8 pc-reset">
<img src="data:image/svg+xml;base64,PHN2ZyByb2xlPSJpbWciIHN0eWxlPSJoZWlnaHQ6MjBweDt3aWR0aDoyMHB4IiB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdib3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZT0idmFyKC0tY29sb3ItZmctcHJpbWFyeSkiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48Zz48dGl0bGU+PC90aXRsZT48cGF0aCBkPSJNMi41MzAwMSA3LjgxNTk1QzMuNDkxNzkgNC43MzkxMSA2LjQzMjgxIDIuNSA5LjkxMTczIDIuNUMxMy4xNjg0IDIuNSAxNS45NTM3IDQuNDYyMTQgMTcuMDg1MiA3LjIzNjg0TDE3LjYxNzkgOC42NzY0N00xNy42MTc5IDguNjc2NDdMMTguNTAwMiA0LjI2NDcxTTE3LjYxNzkgOC42NzY0N0wxMy42NDczIDYuOTExNzZNMTcuNDk5NSAxMi4xODQxQzE2LjUzNzggMTUuMjYwOSAxMy41OTY3IDE3LjUgMTAuMTE3OCAxNy41QzYuODYxMTggMTcuNSA0LjA3NTg5IDE1LjUzNzkgMi45NDQzMiAxMi43NjMyTDIuNDExNjUgMTEuMzIzNU0yLjQxMTY1IDExLjMyMzVMMS41MjkzIDE1LjczNTNNMi40MTE2NSAxMS4zMjM1TDYuMzgyMjQgMTMuMDg4MiI+PC9wYXRoPjwvZz48L3N2Zz4=" />
<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld2JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9ImN1cnJlbnRDb2xvciIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGNsYXNzPSJsdWNpZGUgbHVjaWRlLW1heGltaXplMiBsdWNpZGUtbWF4aW1pemUtMiI+PHBvbHlsaW5lIHBvaW50cz0iMTUgMyAyMSAzIDIxIDkiPjwvcG9seWxpbmU+PHBvbHlsaW5lIHBvaW50cz0iOSAyMSAzIDIxIDMgMTUiPjwvcG9seWxpbmU+PGxpbmUgeDE9IjIxIiB4Mj0iMTQiIHkxPSIzIiB5Mj0iMTAiPjwvbGluZT48bGluZSB4MT0iMyIgeDI9IjEwIiB5MT0iMjEiIHkyPSIxNCI+PC9saW5lPjwvc3ZnPg==" class="lucide lucide-maximize2 lucide-maximize-2" />
</div>
</div>
</div>
<figcaption>I’m cantankerous online. Who would have guessed?</figcaption>
</figure>
:::

One detail I didn't notice at first: Judge doesn't require authentication. You don't run it on yourself. You run it on a handle --- any handle. The person being profiled doesn't need to consent, doesn't get notified, and may never know it happened. The "mirror" works just as well when someone else is holding it.

The most important detail is that it doesn't require proof-of-control: anyone can generate a personality profile for anyone else on the platform, silently. If you can do this to any random user, you can do it to a journalist covering a story you don't like, an activist organizing a campaign, or the head of Trust & Safety at the platform itself. The architecture doesn't care.

This isn't a mirror. Mirrors require you to stand in front of them. This is a scope.

<div>

------------------------------------------------------------------------

</div>

## Voluntary Surveillance as Identity Play

> *I almost built something like this. Not because it was hard --- because it was easy enough to reach "what should the UI look like?" before I recognized what I was actually building. A profiling pipeline doesn't stop being profiling because the dashboard is cute. I shelved it. Someone else didn't. That tells you how natural this feels under a public firehose.*

The reception to Judge hasn't been alarm. It's been enthusiasm. People enter their own handle, screenshot their personality scores, post the results, compare notes. "I'm a Skeptical Cryptid with negative agreeableness." "My valence is way more negative than yours."

This is a specific dynamic worth naming, because it generalizes far beyond Judge:

**Self-diagnosis as meme currency.** The tool gives you a label. The label becomes a post. The post generates engagement. The engagement normalizes the act of being profiled. Each share is a little advertisement for the pipeline --- not because anyone's being coerced, but because the output *is* the content. Surveillance becomes self-expression. The profiling is the product.

This is the sticky move that turns a privacy problem into a social phenomenon. You don't need to trick people into handing over behavioral data when you can make the behavioral analysis itself feel like a personality quiz. Horoscopes, Myers-Briggs, Spotify Wrapped --- the accuracy is almost beside the point. The pull is self-recognition. The sharing is the normalization engine.

Every person who posts their Judge results is training their followers to see behavioral profiling as entertainment rather than intrusion. That's not a conspiracy. It's just how adoption works when the output flatters. The shoe-store fluoroscope was popular for the same reason: seeing inside yourself is inherently compelling, and nobody thinks about cumulative exposure when the experience feels like play.

<div>

------------------------------------------------------------------------

</div>

## What I Wrote in July

From the original piece:

> Bluesky adds: comprehensive behavioral analysis by any motivated actor with basic technical skills... cross-platform reputation tracking through federation... automated harassment through algorithmic targeting... state-level surveillance without requiring cooperation from centralized entities or legal frameworks.

Nothing about the architecture changed between July and March. The firehose was already open. The data was already public. The embedding models were already available. Judge didn't exploit a new vulnerability. It just packaged an existing one as a feature.

<div>

------------------------------------------------------------------------

</div>

## The Dual-Use Window

Here's the tension I keep returning to, and it's one I can't resolve cleanly.

I run two observatory systems on AT Protocol --- Labelwatch, which monitors labeler behavior, and Driftwatch, which ingests Jetstream to measure information dynamics. These tools exist because the firehose is open. They do accountability work: tracking how moderation power gets exercised on a decentralized platform, measuring how corrections propagate (or don't) over time.

Judge is also only possible because the firehose is open.

The protocol can't distinguish between my observatory and someone's personality profiler. Structurally, they're the same operation --- subscribe to public data, extract patterns, present conclusions. The difference is what you're watching (institutions vs. individuals), what you're claiming (observable behavior vs. inferred traits), and whether your instrument is honest about its own limitations.

Labelwatch ships with methodology. Judge ships with a vibe.

Labelwatch watches power. Judge watches people. But they're both standing at the same window.

<div>

------------------------------------------------------------------------

</div>

## The Instrument Becomes the Intervention

There's a failure mode here that goes beyond privacy, and it's the one that concerns me most.

The moment you show someone a valence score derived from their posts, you've changed what they'll post. Not because they're being coerced --- because they're human. The number becomes a target. "My valence is -15" becomes something to fix. "My agreeableness is -53" becomes either a badge of honor or a source of anxiety. Either way, the measurement is now an intervention.

This is textbook Goodhart's Law --- when a measure becomes a target, it ceases to be a good measure. But it's worse than the usual formulation, because the people being measured don't have access to the model, the anchor texts, or the clustering decisions. They can't evaluate whether the score is meaningful. They can only react to it.

A tool like this doesn't just measure the timeline. It governs it. And it governs without any of the accountability infrastructure that governance requires: no receipts, no versioning, no declared uncertainty, no appeals process, no audit trail. It's a governor wearing a toy costume.

<div>

------------------------------------------------------------------------

</div>

## What an Honest Version Would Require

I'm not opposed to self-knowledge tools. I'm opposed to instruments that lie about what they are.

An honest version of this concept would need to be:

-   **Private by default.** Your profile is yours. Sharing is opt-in, not the implicit social expectation.

-   **Proof-of-control required.** You can only profile handles you can authenticate as. The telescope becomes a mirror again.

-   **Uncertainty-forward.** Confidence intervals on every score. "Your agreeableness is somewhere between -70 and -35, and here's why that range is wide."

-   **Model-transparent.** What are the anchor texts? What embedding model? What version? When did it last change? How would your score differ under a different model?

-   **Labeled honestly.** "Coarse sentiment proxy derived from embedding geometry" instead of "personality." Because that's what it is.

-   **Instrument-aware.** A calibration view showing how the tool's own outputs drift over time, because the instrument is part of the system it's measuring.

In other words: everything Judge isn't. Not because Judge is malicious --- I don't think it is --- but because an instrument that doesn't declare its own limitations will have those limitations declared for it, by the people it misleads.

<div>

------------------------------------------------------------------------

</div>

## The Quiet Version

Judge is a toy. It's a well-made toy, and I don't think the intent is hostile. The operator is actually a mutual--- I haven't decided whether to send them this piece. But it's a proof of concept, and the interesting question is what comes next.

The next version won't show you the dashboard. It won't need your handle. It probably won't ask.

This isn't speculative. Behavioral profiling pipelines already exist at institutional scale --- HR screening vendors, adtech targeting, influence mapping. The only novel ingredient AT Protocol adds is a public, structured, real-time firehose with persistent identifiers, available to anyone, at zero marginal cost. Judge proved the recipe works at hobby scale. The enterprise version is the same pipeline with a procurement process.

The protocol permits it. The data is there. The rest is just product design.

<div>

------------------------------------------------------------------------

</div>

*This is a follow-up to ["How Bluesky Broke Every Security Principle"](https://neutralzone.substack.com/p/how-bluesky-broke-every-security), published July 2025.*

*I run [Labelwatch](https://github.com/unpingable/atproto-labelwatch) and [Driftwatch](https://github.com/unpingable/atproto-driftwatch), two open [observatory systems](https://labelwatch.neutral.zone/) on AT Protocol. They watch institutions, not people. The distinction matters.*
