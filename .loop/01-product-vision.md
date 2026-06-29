# Product Loop Kit Product Vision

Created: 2026-06-29

## Target User

- Primary user: Product-minded engineers building 0-to-1 products with AI coding agents.
- Secondary user: Founders, PMs, designers, and technical leads who need a shared operating model for agentic product work.
- Situation where the product is used: A repo has an AI coding agent, but product intent, evals, review evidence, and user feedback are scattered across prompts, chats, PRs, and notes.
- Current workaround: Builders write ad hoc prompts, manually QA the agent's work, and keep product decisions in their head or in disconnected docs.

## Human Context Advantage

What do we know that the AI agent does not know by default?

- User context: The builder knows the target users, real constraints, taste, and product history.
- Domain constraints: Early products need speed and learning, while mature workflows need stronger evals and regression protection.
- Distribution constraints: The kit must be useful as plain files in any repo before it becomes a heavier tool.
- Business constraints: Adoption depends on low setup cost and clear value after the first agent task.
- Design or workflow preferences: The artifacts should feel like an operating system for builders, not a bureaucratic PM process.

## Product Bet

We believe that:

> For product-minded engineers using AI coding agents, Product Loop Kit will help them convert product intent and feedback into bounded agent work by providing loop contracts, templates, and evidence gates, and we will know it is working when users initialize it in a repo and run at least one complete spec-to-evidence-to-review cycle.

## Success Criteria

- User outcome: A builder can initialize `.loop/`, write a bounded agent task, and review evidence without inventing the workflow from scratch.
- Business outcome: The repo is credible as a reusable open-source kit and can support a v0.1 release.
- Quality bar: The framework, templates, script, and example agree on the same loop model.
- Time horizon: v0.1 should be ready for external feedback after one or two more focused repo iterations.

## Non-Goals

- Build a hosted SaaS dashboard in v0.1.
- Automate all product judgment or remove human review.
- Create a heavyweight process that requires project-management software.
- Support every agent platform with custom integrations immediately.

## Product Principles

- Plain files first.
- Evidence before merge.
- Human context stays explicit.
- Evals grow from repeated failure modes.
- External feedback changes vision, not just backlog order.

## Current Risks

| Risk | Why It Matters | How We Will Learn |
| --- | --- | --- |
| The framework feels like documentation instead of a tool. | Builders may understand it but not adopt it. | Test whether a new repo can be initialized and used within minutes. |
| Templates are too broad. | Users may leave them blank or create low-signal artifacts. | Apply the kit to a real product and observe which fields get filled. |
| The CLI/script is too minimal. | Setup may be easy, but repeated usage may not improve. | Add v0.1 usage tasks and see where manual friction remains. |
| External feedback loop is underdeveloped. | The framework may optimize coding without improving product direction. | Run a feedback digest from real user notes or a demo. |

## Feedback Sources

| Source | Cadence | Owner | Notes |
| --- | --- | --- | --- |
| Self-application in this repo | Every repo slice | Maintainer | Use `.loop/` to manage the kit itself. |
| Applying kit to one real product repo | Before v0.1 | Maintainer | Checks whether templates survive real work. |
| Peer review from AI-agent builders | Before public release | Maintainer | Tests clarity and adoption language. |
| GitHub issues or discussion | After public release | Community | Converts repeated confusion into docs/evals. |

## Vision Change Log

| Date | Change | Source | Decision |
| --- | --- | --- | --- |
| 2026-06-29 | Initial vision | Founder/developer context | Start with a plain-file kit and script-based initialization. |
