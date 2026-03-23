---
title: "The Moral Panic Has an API Now"
date: 2026-03-18
---

Bluesky likes to say moderation is a protocol, not a policy. Fine. Sounds clean. Then the protocol turns a familiar moral slogan into a machine-readable object and the tidy abstraction starts smelling like reality.

I built **[Labelwatch](https://github.com/unpingable/atproto-labelwatch)** to watch that layer. Not content. Not discourse. The governance substrate underneath. Independent labelers tag posts and accounts with metadata. Clients decide what to do with it: show it, warn on it, hide it, ignore it.

That architecture is new enough to still look like plumbing instead of politics. It also lets a lot of other nonsense hitch a ride.

Some labelers mark obvious things. Some are abandoned test instances. Some are tiny ministries of taste. Some are just broken in interesting ways. A very few are fun toys. And some are little portable bureaucracies with opinions.

Labelwatch surfaced one of those.

[This one exists to identify Substack links and treat them as contamination signals](https://bsky.app/profile/did:plc:uxjwly6emtgik7juvxxdpl3c). Not "this post contains Nazi content." Not "this account posted hate speech." The judgment is infrastructural: you are on Substack, therefore a warning should follow.

We already have a script for this. The "Nazi bar" argument compresses a messy dispute into a simple instruction: if management tolerates extremists, ordinary participation becomes complicity-adjacent, so leave. As rhetoric, that's old news. A moral compression phrase. A way to stop arguing and start sorting.

The interesting part is what happens when that judgment stops being rhetoric and becomes metadata.

::: captioned-image-container
<figure>
<a href="https://substackcdn.com/image/fetch/$s_!ERaX!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png" class="image-link image2 is-viewable-img" target="_blank" data-component-name="Image2ToDOM"></a>
<div class="image2-inset">
<img src="https://substackcdn.com/image/fetch/$s_!ERaX!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png" title="Screenshot of Labelwatch&#39;s Label Climate page for @neutral.zone " class="sizing-normal" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:775,&quot;width&quot;:1252,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:149212,&quot;alt&quot;:&quot;Screenshot of Labelwatch&#39;s Label Climate page for @neutral.zone &quot;,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://neutralzone.substack.com/i/190554056?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" srcset="https://substackcdn.com/image/fetch/$s_!ERaX!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png 424w, https://substackcdn.com/image/fetch/$s_!ERaX!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png 848w, https://substackcdn.com/image/fetch/$s_!ERaX!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png 1272w, https://substackcdn.com/image/fetch/$s_!ERaX!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F07f44553-8f58-4e51-8d83-3750ad3690d8_1252x775.png 1456w" sizes="100vw" data-fetchpriority="high" width="1252" height="775" alt="Screenshot of Labelwatch&#39;s Label Climate page for @neutral.zone " />
<div class="image-link-expand">
<div class="pencraft pc-display-flex pc-gap-8 pc-reset">
<img src="data:image/svg+xml;base64,PHN2ZyByb2xlPSJpbWciIHN0eWxlPSJoZWlnaHQ6MjBweDt3aWR0aDoyMHB4IiB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdib3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZT0idmFyKC0tY29sb3ItZmctcHJpbWFyeSkiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48Zz48dGl0bGU+PC90aXRsZT48cGF0aCBkPSJNMi41MzAwMSA3LjgxNTk1QzMuNDkxNzkgNC43MzkxMSA2LjQzMjgxIDIuNSA5LjkxMTczIDIuNUMxMy4xNjg0IDIuNSAxNS45NTM3IDQuNDYyMTQgMTcuMDg1MiA3LjIzNjg0TDE3LjYxNzkgOC42NzY0N00xNy42MTc5IDguNjc2NDdMMTguNTAwMiA0LjI2NDcxTTE3LjYxNzkgOC42NzY0N0wxMy42NDczIDYuOTExNzZNMTcuNDk5NSAxMi4xODQxQzE2LjUzNzggMTUuMjYwOSAxMy41OTY3IDE3LjUgMTAuMTE3OCAxNy41QzYuODYxMTggMTcuNSA0LjA3NTg5IDE1LjUzNzkgMi45NDQzMiAxMi43NjMyTDIuNDExNjUgMTEuMzIzNU0yLjQxMTY1IDExLjMyMzVMMS41MjkzIDE1LjczNTNNMi40MTE2NSAxMS4zMjM1TDYuMzgyMjQgMTMuMDg4MiI+PC9wYXRoPjwvZz48L3N2Zz4=" />
<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld2JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9ImN1cnJlbnRDb2xvciIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGNsYXNzPSJsdWNpZGUgbHVjaWRlLW1heGltaXplMiBsdWNpZGUtbWF4aW1pemUtMiI+PHBvbHlsaW5lIHBvaW50cz0iMTUgMyAyMSAzIDIxIDkiPjwvcG9seWxpbmU+PHBvbHlsaW5lIHBvaW50cz0iOSAyMSAzIDIxIDMgMTUiPjwvcG9seWxpbmU+PGxpbmUgeDE9IjIxIiB4Mj0iMTQiIHkxPSIzIiB5Mj0iMTAiPjwvbGluZT48bGluZSB4MT0iMyIgeDI9IjEwIiB5MT0iMjEiIHkyPSIxNCI+PC9saW5lPjwvc3ZnPg==" class="lucide lucide-maximize2 lucide-maximize-2" />
</div>
</div>
</div>
<figcaption><strong>A moral campaign rendered as dashboard furniture.</strong></figcaption>
</figure>
:::

That's what Labelwatch showed me. Not a debate. Not critique. A governance event. A moral campaign smuggled into the same channel as ordinary moderation labels.

On my own account's [climate page](https://labelwatch.sp00ky.net/v1/climate/did%3Aplc%3Adki5xu3vgyo7ubl7vaw55zzq?window=30&format=html&handle=neutral.zone), it looked almost insultingly plain: screenshots, topical flags, routine classifier noise, then **substack**, sitting there with exactly the same ontological status as everything else.

That flattening is the whole turn.

A judgment that used to live in discourse now lives in infrastructure. What once required persuasion can now be emitted, ingested, cached, surfaced, and acted on by software. The network did not answer with counterargument. It answered with classification.

Whether Substack "deserves" this is mostly beside the point here. The fairness question is real. It's also not the interesting part. The interesting part is how little machinery it takes to turn a social posture into an administrative fact.

Labelers aren't just moderation tools. They're little administrative devices for carrying worldviews around. Define a moral category. Emit metadata. Let the clients and the culture do the rest. Filtering shifts. Discovery shifts. Association shifts. The judgment starts as rhetoric and ends as a coordination primitive.

At that point, persuasion is over. Now we're doing intake.

That's why this felt less like being argued with than being processed.

That's also why Labelwatch matters. It doesn't moderate. It doesn't decide which labelers are right. It watches the governance layer itself: who is labeling, how often, against whom, with what cadence, burstiness, churn, and concentration. An audit log for the little distributed authorities now sitting between speech and visibility.

Without that observability, this stuff just starts to feel normal. A label appears. A client responds. A meaning hardens. Pretty soon it disappears into the wallpaper and everyone acts like it was always there. With instrumentation, you can see what it actually is: a belief moving through a technical substrate.

That's the new part.

For years, people argued online as if discourse alone shaped the politics of platforms. Increasingly, the real action is one layer down: metadata, filters, heuristics, feeds, blocklists, labelers, ranking logic. The fight is not only over what people say. It is over how the system classifies what they are.

I'd been writing about adversarial semiotics, reflexive sorting, the way symbolic cues harden into social instructions. Bluesky's answer was almost too perfect. The medium did not rebut the argument. It instantiated it.

The specimen labeled itself.
