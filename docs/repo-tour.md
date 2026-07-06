# Product Loop Kit Repo Tour

This is the shortest useful path through the repo.

## 1. Understand The Framework

Start with [loop-engineering-framework.md](loop-engineering-framework.md).

The core idea is three nested loops:

- Agentic coding loop: agent implements against spec and evals.
- Developer feedback loop: human reviews product behavior and updates the spec.
- External feedback loop: real users or market signals update product direction.

## 2. Inspect The Artifact System

Open [../templates](../templates).

These templates are what `init-loop-kit.sh` copies into a product repo:

- Vision
- Spec
- Eval plan
- Agent task
- PR evidence
- Developer review
- External feedback digest
- Decision log
- Loop map

## 3. Run The First Loop Path

Open [first-loop.md](first-loop.md).

This guide narrows the first hour to four files:

- `01-product-vision.md`
- `02-product-spec.md`
- `03-eval-plan.md`
- `04-agent-task.md`

The goal is to reach `P2 agent-ready` before asking an AI coding agent to implement anything.

## 4. See The Kit Managing Itself

Open [../.loop](../.loop).

This repo uses its own framework. The current `.loop` artifacts show how the kit has moved from framework docs to validator, reference case study, and runnable prototype evidence.

## 5. Run The Validator And Score

From the repo root:

```bash
./scripts/validate-loop-kit.sh .
./scripts/score-loop-kit.sh .
```

Expected result:

```text
summary: 63 passed, 0 warning(s), 0 failed
Product Loop Readiness: 100/100 (P4 external-learning-ready)
```

## 6. Review The Case Study

Open [../examples/typing-tutor/README.md](../examples/typing-tutor/README.md).

This example shows a small product loop with:

- Synthesized external feedback
- Product vision
- Bounded product spec
- Eval plan
- Agent task
- Runnable prototype
- PR evidence
- Developer review

## 7. Try The Prototype

Open:

[../examples/typing-tutor/prototype/index.html](../examples/typing-tutor/prototype/index.html)

Run its scoring tests:

```bash
node examples/typing-tutor/prototype/scoring.test.js
```

## What To Look For

- The framework is not just prose; it has artifacts and checks.
- The validator distinguishes initialized templates from agent-ready product work.
- The score explains product-loop maturity without replacing the strict validator.
- The case study records evidence rather than asking reviewers to trust a narrative.
- The external adoption loop is the next proof point: [external-adoption-loop.md](external-adoption-loop.md).
- The next missing proof is external use, not more local documentation.
