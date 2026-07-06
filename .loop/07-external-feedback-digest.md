# Product Loop Kit External Feedback Digest

Created: 2026-07-06

## Feedback Window

- Start date: 2026-06-29
- End date: 2026-07-06
- Release/build: v0.6 external adoption kit candidate
- Audience: product-minded engineers using AI coding agents

## Sources

| Source | Count/Volume | Quality | Notes |
| --- | --- | --- | --- |
| Self-application | 6 slices | Medium | Framework, validator, case study, prototype evidence, readiness score, and adoption kit were managed through `.loop/`. |
| Reference example | 1 | Medium | Typing Tutor has a full artifact chain plus runnable prototype evidence. |
| Browser prototype QA | 2 viewports | Medium | Desktop and tablet checks prove local implementation behavior, not real learner usefulness. |
| Score regression fixtures | 5 scenarios | Medium | P0-P4 scoring behavior is covered with generated temporary repos and the current repo. |
| User interviews | 0 | Pending | Needed before claiming external adoption. |
| Real product repo application | 0 | Pending | Needed before distribution choices. |

## Observations

Keep observations separate from interpretations.

| Observation | Source | Frequency | Confidence |
| --- | --- | --- | --- |
| No external users have tested the kit yet. | Current repo state | 1 | High |
| Self-application reveals that `.loop/` can act as repo product memory. | Maintainer usage | 6 | Medium |
| A reference case study makes artifact expectations more concrete than templates alone. | Typing Tutor example | 1 | Medium |
| Runnable prototype evidence makes PR evidence easier to understand. | Typing Tutor prototype | 1 | High |
| Validation creates a useful gate between initialized templates and complete product-loop work. | v0.2 checks | 1 | High |
| Readiness scoring gives incomplete setups a maturity signal before strict validation passes. | v0.5 scoring | 1 | Medium |
| First-loop and adoption guides make the next external test easier to run. | v0.6 docs | 2 | Medium |

## Interpretations

| Interpretation | Supporting Evidence | Confidence | Alternative Explanation |
| --- | --- | --- | --- |
| The next important learning is real-use friction, not more local docs. | The repo now has framework docs, templates, initializer, validator, score, score tests, self-application artifacts, adoption docs, CI, a reference case study, and a runnable prototype. | High | One more example may still help before external testing. |
| The prototype proves implementation workflow, not learner usefulness. | Browser QA and tests are local; no learner/adult session has happened. | High | A close-fit user may still find the prototype immediately informative. |
| A real repo or real learner session should come before packaging. | Current evidence is still local and documentation-focused. | High | Packaging might reduce enough setup friction to be worth doing earlier. |
| Score tests reduce local regression risk but do not validate adoption. | P0-P4 fixtures passed, but no external builder has reacted to the score. | High | Score stability may itself make adoption easier. |

## Product Implications

| Implication | Vision Impact | Spec Impact | Eval Impact |
| --- | --- | --- | --- |
| Run one observed learner/adult session with the prototype. | Tests the product bet behind the case study. | Add observed-session feedback slice. | Capture hesitation, completion, adult difficulty choice, and next feature decision. |
| Run one external setup test with an AI-agent builder. | Tests Product Loop Kit adoption friction. | Add adoption feedback slice. | Capture setup time, score interpretation, validation failures, and confusing artifacts. |
| Keep packaging conditional on real usage. | Prevents optimizing distribution before workflow value. | Keep distribution roadmap after v0.6. | Use real adoption evidence as the gate. |

## Decisions

Decision: refine

Why:

The core product bet is stronger after self-application, validation, scoring, score tests, adoption docs, CI, a reference case study, and runnable prototype evidence. It still needs external use before distribution work.

## Next External Loop

- Audience: one learner/adult pair and 1-2 engineers who actively use coding agents.
- Learning goal: Can the learner complete a session, can the adult choose difficulty, and can an engineer adapt `.loop/` without hand-holding?
- Release or prototype needed: v0.6 candidate with first-loop guide, external adoption guide, validator, score, score tests, Typing Tutor prototype, screenshots, case study, and self-application artifacts.
- Deadline: before v0.7 distribution work.
