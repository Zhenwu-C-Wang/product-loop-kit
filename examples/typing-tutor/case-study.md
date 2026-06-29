# Case Study: Typing Tutor

This case study shows how Product Loop Kit turns a small 0-to-1 product idea into an agent-ready task with evals and review evidence.

## Starting Signal

A builder wants a young learner to practice typing in short sessions. The human context advantage is specific: the learner needs low-friction practice and the adult needs simple control over difficulty.

The first product risk is not whether a full learning platform can be built. The first risk is whether one session can be completed without confusion.

## External Feedback Loop

Artifact: `external-feedback-digest.md`

Key interpretation:

- Build one complete session before accounts, rewards, or long-term analytics.
- Adult difficulty control belongs before persistence.
- Scoring edge cases should become evals immediately.

Decision: refine.

## Developer Feedback Loop

Artifacts:

- `product-vision.md`
- `product-spec.md`
- `eval-plan.md`
- `developer-review.md`

The developer translates context into a narrow product slice:

- Choose difficulty.
- Complete one prompt.
- See accuracy and speed.
- Restart or choose the next difficulty.

The developer also defines non-goals so the agent does not expand scope into accounts, rewards, or storage.

## Agentic Coding Loop

Artifacts:

- `agent-task.md`
- `pr-evidence.md`
- `prototype/`

The agent task is bounded by four acceptance criteria:

| ID | Criterion | Evidence |
| --- | --- | --- |
| A1 | Learner can finish a prompt and see accuracy plus speed. | Browser check and scoring test. |
| A2 | Adult can switch difficulty before a session starts. | Browser check. |
| A3 | Scoring handles empty input, exact match, partial match, and extra characters. | Unit tests. |
| A4 | Main flow fits desktop and tablet widths without text overlap. | Screenshots or visual inspection. |

Implementation evidence now exists:

- Static prototype: `prototype/index.html`
- Scoring logic: `prototype/scoring.js`
- Scoring tests: `prototype/scoring.test.js`
- Desktop screenshot: `prototype/screenshots/desktop-result.png`
- Tablet screenshot: `prototype/screenshots/tablet-result.png`

## What This Demonstrates

- The external loop changes the product slice before coding starts.
- Human context becomes explicit in the vision and spec.
- Repeated or likely failure modes become evals.
- The agent receives a task that includes scope, commands, acceptance criteria, and evidence requirements.
- Developer review is about product behavior, not just code diff review.
- A reference case study becomes stronger when PR evidence contains real checks and screenshots.

## Next Learning

After implementation, the next external feedback loop should observe one learner/adult session and answer:

- Can the learner complete a session without adult rescue?
- Does the adult understand difficulty control?
- Is the result language motivating or confusing?
- Which feature should be next: rewards, adaptive difficulty, or progress history?
