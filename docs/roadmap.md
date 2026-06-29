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

## v0.4 Distribution

Goal: Make adoption easier after the workflow is validated.

- Package the initializer if users need it.
- Consider a GitHub template repo.
- Consider agent prompt packs for common coding agents.
- Consider optional issue/PR templates.

Exit criteria:

- Installation path is simpler than cloning the repo.
- Distribution does not require changing the plain-file model.

## Not Yet

- Hosted dashboard.
- Analytics ingestion.
- Agent-specific orchestration servers.
- Heavy project-management integrations.

These may be useful later, but only after the plain-file loop has real adoption evidence.
