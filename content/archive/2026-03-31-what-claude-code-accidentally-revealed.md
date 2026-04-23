---
title: "What Claude Code Accidentally Revealed About Agent Safety"
date: 2026-03-31
---

Anthropic accidentally shipped a source map in a public npm package for Claude Code, exposing the CLI's orchestration layer to public inspection.\[1\] That matters less as a security embarrassment than as an involuntary design document. The exposure did not reveal some hidden moral engine inside the model. It revealed something much more mundane and much more important: contemporary agent safety is mostly a control plane.\[1\]

That is not even a criticism, at least not at first. If you are letting an LLM edit files, run commands, call tools, and chain actions together over time, you are going to end up building middleware around it. You need approval flows, policy layers, context injection, fallback logic, boundary enforcement, and auditability. Real systems work like this. Claude Code is simply the clearest involuntary example; the broader point applies to agent tooling generally.\[2\]\[3\]\[4\]\[5\]

Start with memory. Claude Code's own documentation says `CLAUDE.md` files and auto memory are loaded at the start of every conversation, and that Claude treats them as "context, not enforced configuration." Those files consume tokens, follow scope-based precedence, and work best when they are short, specific, and well structured.\[2\] One of the system's primary steering mechanisms, in other words, is not an inviolable rules engine but instructions injected into the context window and interpreted probabilistically by the model. That is not nothing. It is also not sovereignty.\[2\]

Then there are hooks. Claude Code exposes lifecycle events including `PreToolUse`, `PermissionRequest`, `PostToolUse`, `SubagentStart`, and `SubagentStop`.\[3\] The docs show that `PermissionRequest` hooks can allow or deny on the user's behalf, modify tool input, and apply permission updates; `PreToolUse` hooks can also modify tool input before execution.\[3\] This is not fake safety. It is a programmable policy membrane around tool execution, with all the familiar problems of precedence, composition, and enforcement order.\[3\]

Permissions tell the same story. Claude Code documents allow, ask, and deny rules; multiple permission modes; and an `auto` mode that auto-approves tool calls with background safety checks and is currently labeled a research preview.\[4\] Anthropic's permissions docs say the auto-mode classifier uses natural-language `environment`, `allow`, and `soft_deny` rules, and warn that replacing `allow` or `soft_deny` replaces the built-in defaults for that section. Set `soft_deny` badly and you can discard built-in block rules for force-pushes, exfiltration, `curl | bash`, and production deploys.\[4\] A safety-critical review layer exists, but part of its policy surface is itself prose. That is sensible engineering under the circumstances. It is also a long way from the fantasy that safety lives inside the model as a purified essence.\[4\]

The hardest edge in the stack is sandboxing, and even there the tradeoff is revealing. Anthropic's settings docs say sandboxing is configurable, that `failIfUnavailable` defaults to false, and that when sandbox startup fails Claude Code warns and runs unsandboxed unless you explicitly harden that behavior.\[5\] The same settings surface exposes `allowUnsandboxedCommands`, which permits use of the `dangerouslyDisableSandbox` escape hatch unless it is turned off.\[5\] That is not pure negligence. It is the familiar bargain between developer velocity and strict isolation. But it is still a bargain, which is precisely the point. Even the hardest boundary in the stack is operational rather than metaphysical.\[5\]

That is what the exposure clarified. Agent safety, in practice, is layered, negotiated, and administrative. By "administrative" I do not mean fake. I mean that it depends on settings, enforcement order, policy scope, classifier behavior, hook logic, approval state, enterprise controls, and whether the hard boundary is actually enabled.\[3\]\[4\]\[5\] It depends on whether the system fails closed or fails open. It depends on which layer gets the last word.\[4\]\[5\]

That is a much more grounded picture than the one usually presented in AI discourse. The public argument tends to oscillate between two bad models. The first imagines that alignment is mostly a property of trained model behavior: teach the model the right values and the rest is implementation detail. The second dismisses all safety work as prompt-engineering theater. Claude Code points to a third answer, which is both less glamorous and more real: the meaningful question is not whether the model is aligned in some metaphysical sense. The meaningful question is where authority lives when the model proposes an action.

Once you ask it that way, the fog clears. Prompts are not authority. Memory files are not authority. A classifier is not authority. A hook is not authority unless something downstream is obligated to honor it. Even permissions are only partial authority, because they remain embedded in a wider regime of overrides, defaults, modes, and fallbacks.\[2\]\[3\]\[4\] The closest thing to authority in systems like this is custody: the place where a proposed action can actually be intercepted, refused, rewritten, constrained, or logged in a way the model itself cannot narrate away.

That is what Claude Code accidentally revealed. Not a hidden theology of safety, but its bureaucracy. Not virtue, but custody. Not alignment as essence, but alignment as control plane.

The prompt is not the policy. It is the proposal.

And proposals are cheap.

## Endnotes

**\[1\]** Public reporting on March 31, 2026 described Anthropic accidentally shipping a source map in the public npm package for Claude Code, which exposed readable TypeScript source for the CLI. ([The Register](https://www.theregister.com/2026/03/31/anthropic_claude_code_source_code/))

**\[2\]** Anthropic's Claude Code memory docs say `CLAUDE.md` files and auto memory are loaded at the start of each conversation, are treated as "context, not enforced configuration," consume context-window tokens, and follow scope-based precedence rules. ([Claude API Docs](https://docs.anthropic.com/en/docs/claude-code/memory))

**\[3\]** Anthropic's hooks docs describe lifecycle hook events including `PreToolUse` and `PermissionRequest`; they say `PermissionRequest` hooks can allow or deny on behalf of the user, modify tool input, and apply updated permissions, while `PreToolUse` hooks can also modify tool input before execution. ([Claude API Docs](https://docs.anthropic.com/en/docs/claude-code/hooks))

**\[4\]** Anthropic's permissions docs describe permission modes including `auto`, which is marked as a research preview using background safety checks, and document `autoMode.environment`, `allow`, and `soft_deny` as natural-language rule arrays. The same docs warn that replacing `allow` or `soft_deny` replaces the built-in defaults, and that a bad `soft_deny` replacement can discard default block rules. ([Claude](https://code.claude.com/docs/en/permissions))

**\[5\]** Anthropic's settings docs say `sandbox.failIfUnavailable` defaults to false, meaning a failed sandbox startup produces a warning and unsandboxed execution, and that `allowUnsandboxedCommands` controls whether the `dangerouslyDisableSandbox` escape hatch is available. ([Claude](https://code.claude.com/docs/en/settings))
