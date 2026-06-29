# Typing Tutor Case Study

This example shows Product Loop Kit applied to a small 0-to-1 product: a typing practice tool for a young learner with adult supervision.

## Read In Order

1. [case-study.md](case-study.md)
2. [external-feedback-digest.md](external-feedback-digest.md)
3. [product-vision.md](product-vision.md)
4. [product-spec.md](product-spec.md)
5. [eval-plan.md](eval-plan.md)
6. [agent-task.md](agent-task.md)
7. [pr-evidence.md](pr-evidence.md)
8. [developer-review.md](developer-review.md)

## Runnable Prototype

Open the static prototype:

[prototype/index.html](prototype/index.html)

Run scoring tests from the repo root:

```bash
node examples/typing-tutor/prototype/scoring.test.js
```

## Evidence

- Concept image: [assets/typing-tutor-concept.png](assets/typing-tutor-concept.png)
- Desktop screenshot: [prototype/screenshots/desktop-result.png](prototype/screenshots/desktop-result.png)
- Tablet screenshot: [prototype/screenshots/tablet-result.png](prototype/screenshots/tablet-result.png)

## What This Example Demonstrates

- External feedback shapes the first product slice before coding.
- Human context is captured in product vision and spec.
- Likely failure modes become evals.
- Agent work is bounded by acceptance criteria.
- PR evidence records tests, browser checks, and screenshots.
- Developer review decides the next loop.

## Caveat

The prototype has local implementation evidence, but it has not yet been tested with a real learner/adult pair. The next loop should be external feedback.
