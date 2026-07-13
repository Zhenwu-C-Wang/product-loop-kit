# Product Loop Kit Roadmap

This roadmap moves Product Loop Kit from a useful artifact system to a proven product-development loop. It treats AI execution as cheap and repeatable, while protecting the scarce input: human product context, corrections, and judgment.

## Operating Bets

- Start implementation before the first spec feels complete when a cheap prototype can expose better questions.
- Treat the spec as working product memory that changes after implementation and review, not as an up-front waterfall gate.
- Persist every material human correction before the next agent task so the builder does not have to explain it twice.
- Turn expensive or repeated failure modes into evals; do not add eval ceremony that cannot change a decision.
- Prove the manual product loop with real builders before adding packaging, orchestration, or unattended execution.

## Current Position

| Milestone | Status | Evidence |
| --- | --- | --- |
| v0.1 Plain-file kit | Complete | Framework, templates, initializer, and self-application exist. |
| v0.2 Validation and status | Complete | Strict validator passes on this repo. |
| v0.3 Reference case study | Complete | Typing Tutor includes artifacts, prototype, tests, and screenshots. |
| v0.4 Real usage evidence | Not completed | The original milestone is carried into v0.7 with stronger human-token measures. |
| v0.5 Product-layer positioning and readiness score | Complete | P0-P4 score and positioning are documented. |
| v0.6 External adoption kit and score tests | Complete | First-loop guide, adoption protocol, and score fixtures exist. |
| v0.7 External adoption and human-token proof | Next | Requires a real builder using a real product repo. |

## Completed Foundation: v0.1-v0.3

Goal: Make a complete product loop understandable and runnable as plain files.

- Define the agentic coding, developer feedback, and external feedback loops.
- Provide artifacts for vision, spec, evals, task handoff, evidence, review, external feedback, and decisions.
- Initialize `.loop/` without overwriting existing files.
- Validate whether the artifact set is complete enough for review.
- Show one end-to-end reference case with a runnable prototype.

Foundation exit criteria:

- A repo can initialize all 9 loop artifacts.
- A reviewer can understand the bounded task and its completion contract.
- A reference implementation returns tests, screenshots, risks, and developer review.

## Completed Productization: v0.5-v0.6

Goal: Clarify the product-layer role and make first use observable before packaging.

- Position Product Loop Kit upstream of agent scheduling and orchestration.
- Add `scripts/score-loop-kit.sh` for P0-P4 readiness.
- Keep `scripts/validate-loop-kit.sh` as the strict completion gate.
- Narrow the first hour to vision, spec, eval plan, and agent task.
- Define an external adoption protocol.
- Add score regression fixtures and a dependency-light local check suite.

Productization exit criteria:

- A fresh repo gets actionable next steps before strict validation passes.
- Score thresholds are protected by regression tests.
- The repo is ready to run an adoption experiment without adding a hosted workflow.

## v0.7 External Adoption And Human-Token Proof

Goal: Prove that one real builder can complete a product loop and that the second agent iteration requires less repeated human explanation than the first.

- Run one observed loop in a real product repo with a builder who already uses coding agents.
- Begin with an intentionally small, imperfect spec and reach implementation evidence early.
- Capture time to first useful implementation, extra prompts, corrections, repeated instructions, and skipped fields.
- After developer review, persist each material human correction in the spec, eval plan, product vision, or decision log.
- Run a second bounded agent task and check whether persisted context is reused without the builder restating it.
- Remove, merge, or rewrite artifact fields that do not affect an implementation or product decision.
- Feed observed friction into templates, score next actions, validator rules, and onboarding.

Exit criteria:

- One real product loop reaches evidence and developer review, even if the result is rejected or stopped.
- At least one external observation changes a spec, eval, template, or product decision.
- Every material human correction is linked to a durable artifact before the next agent task.
- A second agent iteration reuses at least one recorded correction without the builder repeating it.
- The distribution decision is based on observed adoption behavior rather than local completeness.

## v0.8 Durable Iteration Memory

Goal: Preserve learning across many slices without making the active handoff heavier.

- Keep the current spec, eval plan, and agent task compact enough for immediate execution.
- Add a lightweight way to retain completed slice history when git history alone is not discoverable enough.
- Make feedback provenance traceable from observation to spec, eval, vision, or decision.
- Distinguish a one-time product preference from a reusable regression check.
- Measure whether builders can find the latest decision without reading old chat history.

Exit criteria:

- A new agent session can recover the current product bar and important prior corrections from repo artifacts alone.
- Completed slice history is discoverable without copying all prior context into the active task.
- The memory mechanism is justified by v0.7 evidence and does not add mandatory ceremony to the first loop.

## v0.9 Executable Loop Contract

Goal: Let a coding harness execute the inner loop from repo-owned contracts without turning Product Loop Kit into an agent orchestration platform.

- Define a machine-readable representation for required checks, retry conditions, blockers, and evidence paths.
- Add a minimal adapter or command that can run checks and report whether the agent should retry, escalate, or stop.
- Keep product judgment and direction changes behind an explicit human gate.
- Generate or update evidence from actual command results where practical.
- Remain compatible with multiple coding agents and external orchestration tools.

Exit criteria:

- A bounded agent task can run until required checks pass or a named blocker is reached.
- The stop decision is derived from the spec and eval contract, not from chat memory.
- Actual command results are distinguishable from self-reported evidence.
- The executable contract works in at least two different product repos or agent environments.

## v1.0 Proven Plain-File Workflow

Goal: Publish a stable workflow only after the loop demonstrates real human leverage.

- Package the initializer only if v0.7 shows installation friction matters.
- Consider a template repo, agent prompt packs, and optional issue or PR templates.
- Document evidence from real adoption, including stopped or rejected loops.
- Stabilize the smallest artifact contract that supports spec-to-evidence-to-learning cycles.

Exit criteria:

- Multiple builders complete loops without live walkthroughs.
- Recorded product context reduces repeated prompting across iterations.
- Product feedback reliably changes specs or evals rather than remaining in review notes.
- Distribution simplifies adoption without weakening the plain-file model.

## Not Yet

- Hosted dashboard.
- Analytics ingestion.
- Agent-specific orchestration servers.
- Heavy project-management integrations.
- Unattended product-direction decisions.

These may become useful after the plain-file loop has real adoption evidence and a demonstrated need for more automation.
