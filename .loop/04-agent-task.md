# Product Loop Kit Agent Task

Created: 2026-07-13

## Goal

Update Product Loop Kit's roadmap and adoption protocol so the next milestone proves that durable product context reduces repeated human explanation across agent iterations.

## Inputs

- Product vision: `.loop/01-product-vision.md`
- Product spec: `.loop/02-product-spec.md`
- Eval plan: `.loop/03-eval-plan.md`
- Source: user-provided guidance about iterative specs, cheap agent execution, expensive human context, and durable `SPEC.md`-style memory.
- Relevant files:
  - `docs/roadmap.md`
  - `docs/external-adoption-loop.md`
  - `docs/loop-engineering-framework.md`
  - `docs/first-loop.md`
  - `templates/06-developer-review.md`
  - `.loop/`

## Scope

In scope:

- Reprioritize the roadmap around v0.7 external adoption and human-token proof.
- Add later milestones for durable iteration memory and an executable loop contract.
- Instrument the adoption guide for time, extra prompts, corrections, durable destinations, and second-task reuse.
- Add a human-token retention ledger to developer review.
- Add a durable-correction rule to the framework and first-loop guide.
- Self-apply the new rule in product vision, spec, eval, evidence, review, external feedback, and decision history.
- Run all existing local checks.

Out of scope:

- Running the real external adoption session.
- Building orchestration or a loop runner.
- Adding a new mandatory artifact.
- Packaging or publishing.

## Implementation Rules

- Keep the active first-loop path lightweight.
- Persist material product feedback, not every conversational detail.
- Distinguish a product correction from a repeatable failure that deserves an eval.
- Do not claim that documentation or self-application equals external validation.
- Keep changes compatible with the existing 9-file plain-file model.
- Record evidence in `.loop/05-pr-evidence.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` |
| Readiness score | `./scripts/score-loop-kit.sh .` |
| Score regression tests | `./scripts/test-score-loop-kit.sh` |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'` |
| Retention contract | `rg -n "human-token|Human-Token|material human correction|material correction" docs templates .loop` |
| Whitespace | `git diff --check` |

## Working Loop

1. Read the existing roadmap and current self-application artifacts.
2. Convert the new human-token insight into milestone ordering and measurable adoption evidence.
3. Reuse existing spec, eval, vision, and decision artifacts as durable destinations.
4. Update review and adoption guidance without adding mandatory first-loop ceremony.
5. Run required checks.
6. Fix defects and repeat until checks pass or a blocker is clear.
7. Fill out `.loop/05-pr-evidence.md` and `.loop/06-developer-review.md`.

## Completion Contract

Return:

- Summary of roadmap and contract changes.
- Evidence for each acceptance criterion.
- Checks run and results.
- The artifact that retains the user-provided product judgment.
- Known risks and the next external experiment.
