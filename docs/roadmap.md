# Product Loop Kit Roadmap

This roadmap keeps the framework moving from useful files to a productized workflow without adding tool complexity before it proves useful.

## v0.1 Plain-File Kit

Goal: Make one complete loop possible in any repo.

- Framework doc explains the three nested loops and control gates.
- Templates cover vision, spec, evals, agent task, PR evidence, developer review, external feedback, and decisions.
- `scripts/init-loop-kit.sh` initializes `.loop/` without overwriting existing artifacts.
- Product Loop Kit self-applies the framework under `.loop/`.
- One example product loop shows the model in a small 0-to-1 product.

Exit criteria:

- A new repo can initialize 9 loop artifacts.
- A maintainer can run the documented checks.
- A reviewer can understand the next agent task from `.loop/04-agent-task.md`.

## v0.2 Validation And Status

Goal: Help users see whether their loop system is ready for an agent.

- Add `scripts/validate-loop-kit.sh`.
- Check required `.loop/` files exist.
- Detect empty critical sections.
- Check loop map structure and parse YAML when Ruby is available.
- Report missing evidence before developer review.

Exit criteria:

- Validation passes on this repo.
- Validation fails clearly on a missing or incomplete `.loop/` setup.
- README documents the command in the quick start.

## v0.3 Reference Case Study

Goal: Show what a complete product loop looks like before asking users to apply the kit to their own repos.

- Apply the kit to at least one product example or real product repo.
- Capture the full path from external feedback to spec, eval, agent task, PR evidence, and developer review.
- Remove or simplify template fields that remain unused.
- Add one short case-study doc.

Exit criteria:

- A reference product loop is documented end to end.
- At least one repeated failure mode becomes an eval.
- External feedback changes either the product vision or next spec.

## v0.4 Real Usage Evidence

Goal: Turn reference evidence into real usage evidence.

- Run the typing-tutor prototype with one learner/adult pair.
- Apply Product Loop Kit to at least one real product repo.
- Capture real validation failures, confusion points, and template friction.
- Update templates or validator rules from observed behavior.

Exit criteria:

- One real product loop completes end to end.
- At least one external observation changes a spec, eval, or template.
- The next distribution decision is based on adoption evidence.

## v0.5 Product-Layer Positioning And Readiness Score

Goal: Make the kit's product-layer role explicit and give users a lightweight maturity signal before packaging.

- Position Product Loop Kit as the product artifact layer for agentic development, not a replacement for agent loop automation tooling.
- Add `scripts/score-loop-kit.sh` to report product-loop maturity from P0 to P4.
- Keep `scripts/validate-loop-kit.sh` as the strict pass/fail gate.
- Document when to use scoring versus validation.
- Use the score to identify the next missing product-loop artifact without weakening validation.

Exit criteria:

- README explains the product-layer boundary.
- Scoring passes on this repo with P4 external-learning-ready.
- Scoring gives useful next actions for incomplete `.loop/` setups.
- Validation still passes unchanged on this repo.

## v0.6 External Adoption Kit And Score Tests

Goal: Make the first real adoption loop easier to run and keep readiness scoring stable while the templates evolve.

- Add a first-loop guide that narrows the first hour to vision, spec, eval plan, and agent task.
- Add an external adoption loop guide for testing the kit in a real product repo with a real builder.
- Add regression tests for `scripts/score-loop-kit.sh` across P0, P1, P2, P3, and P4 scenarios.
- Add a lightweight CI workflow for validator, score, score tests, prototype tests, shell syntax, YAML parse, and whitespace.
- Feed adoption findings back into templates, score next actions, and validator rules.

Exit criteria:

- A new user can follow `docs/first-loop.md` to reach P2 without a live walkthrough.
- One adoption session can be run from `docs/external-adoption-loop.md`.
- Score regression tests protect level thresholds and category output.
- CI catches drift in core scripts, docs, `.loop`, and the Typing Tutor case study.

## v0.7 Distribution

Goal: Make adoption easier after the workflow is validated.

- Package the initializer if users need it.
- Consider a GitHub template repo.
- Consider agent prompt packs for common coding agents.
- Consider optional issue/PR templates.
- Keep distribution focused on the `.loop/` product artifact model rather than agent orchestration.

Exit criteria:

- Installation path is simpler than cloning the repo.
- Distribution does not require changing the plain-file model.

## Not Yet

- Hosted dashboard.
- Analytics ingestion.
- Agent-specific orchestration servers.
- Heavy project-management integrations.

These may be useful later, but only after the plain-file loop has real adoption evidence.
