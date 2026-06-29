# Typing Tutor External Feedback Digest

Created: 2026-06-29

## Feedback Window

- Start date: 2026-06-29
- End date: 2026-06-29
- Release/build: concept prototype
- Audience: one learner/adult use case synthesized from builder context

## Sources

| Source | Count/Volume | Quality | Notes |
| --- | --- | --- | --- |
| Builder context | 1 | Medium | Strong context for target learner, weak external generality. |
| Competitive scan | 1 | Low | Generic typing tools often emphasize speed or gamification before adult control. |
| Observed session | 0 | Pending | Needed after first prototype. |

## Observations

| Observation | Source | Frequency | Confidence |
| --- | --- | --- | --- |
| The learner needs a short session that starts quickly. | Builder context | 1 | Medium |
| The adult needs to choose difficulty without managing a curriculum. | Builder context | 1 | Medium |
| Scoring edge cases are easy to get wrong and should be tested early. | Product analysis | 1 | High |

## Interpretations

| Interpretation | Supporting Evidence | Confidence | Alternative Explanation |
| --- | --- | --- | --- |
| The first useful slice should focus on one complete session, not long-term retention features. | Target situation requires quick practice and immediate feedback. | Medium | A reward loop may be more motivating than scoring in the first slice. |
| Adult difficulty control belongs before persistence. | Adult needs to steer the next session before there is enough data for automation. | Medium | Difficulty could be inferred automatically later. |
| Scoring logic should become an eval immediately. | Empty, partial, exact, and extra-character inputs are known failure modes. | High | Browser-only manual testing could catch enough for a toy prototype. |

## Product Implications

| Implication | Vision Impact | Spec Impact | Eval Impact |
| --- | --- | --- | --- |
| Build one complete practice flow first. | Confirms short-session principle. | Add practice screen, result state, and reset path. | Browser check for session completion. |
| Add adult difficulty selection. | Confirms adult-control principle. | Add pre-session setting for prompt length. | Browser check for difficulty switch. |
| Test scoring edge cases. | Confirms evidence-before-merge principle. | Keep scoring logic separable. | Unit tests for empty, exact, partial, and extra-character inputs. |

## Decisions

Decision: refine

Why:

The need is plausible, but the first product slice should be small enough to test with an actual learner/adult pair. Build one session before accounts, rewards, or long-term analytics.

## Next External Loop

- Audience: one learner and supervising adult.
- Learning goal: Can the learner complete a session and can the adult choose the next difficulty without help?
- Release or prototype needed: first practice-flow slice.
- Deadline: after agent implements the bounded task.
