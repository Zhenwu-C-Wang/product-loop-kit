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

## 3. See The Kit Managing Itself

Open [../.loop](../.loop).

This repo uses its own framework. The current `.loop` artifacts show how the kit has moved from framework docs to validator, reference case study, and runnable prototype evidence.

## 4. Run The Validator

From the repo root:

```bash
./scripts/validate-loop-kit.sh .
```

Expected result:

```text
summary: 63 passed, 0 warning(s), 0 failed
```

## 5. Review The Case Study

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

## 6. Try The Prototype

Open:

[../examples/typing-tutor/prototype/index.html](../examples/typing-tutor/prototype/index.html)

Run its scoring tests:

```bash
node examples/typing-tutor/prototype/scoring.test.js
```

## What To Look For

- The framework is not just prose; it has artifacts and checks.
- The validator distinguishes initialized templates from agent-ready product work.
- The case study records evidence rather than asking reviewers to trust a narrative.
- The next missing proof is external use, not more local documentation.
