# Typing Tutor Eval Plan

Created: 2026-06-29

## Scope

This eval plan covers:

- Product slice: first practice-flow slice.
- Critical workflows: choose difficulty, complete prompt, calculate score, show results, restart.
- Known risks: scoring edge cases, confusing result language, difficulty controls interrupting practice, responsive text overlap.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Scoring unit tests | Target app test runner | Yes | Empty, exact, partial, and extra-character cases. |
| Browser practice flow | Manual or automated browser check | Yes | Complete one session. |
| Difficulty switch check | Browser check | Yes | Switch difficulty before start and verify prompt changes. |
| Responsive inspection | Desktop and tablet viewport screenshots | Yes | Confirm no text overlap. |
| Build/type/lint | Target app standard commands | Yes | Use existing project commands. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | Browser practice flow plus scoring test | Result screen shows accuracy and speed. |
| A2 | Difficulty switch check | Difficulty changes before active session. |
| A3 | Scoring unit tests | Four edge cases pass. |
| A4 | Responsive inspection | Desktop and tablet evidence recorded. |

## Manual Review Checklist

- [ ] Prompt is readable.
- [ ] Typing input is obvious and focused.
- [ ] Result language is simple and kind.
- [ ] Adult difficulty control is available before a session.
- [ ] Empty input does not crash.
- [ ] Restarting returns to setup state.

## Regression Evals

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Scoring handles exact match only | Add empty, partial, and extra-character tests | Builder | 2026-06-29 |
| UI overlaps on tablet | Add tablet viewport screenshot | Builder | 2026-06-29 |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| Empty input | Prompt `cat`, response empty | 0 accuracy, 0 WPM, no crash. |
| Exact match | Prompt `cat`, response `cat` | 100 accuracy. |
| Partial match | Prompt `cat`, response `ca` | Partial accuracy below 100. |
| Extra characters | Prompt `cat`, response `cats` | Accuracy below or equal to prompt-normalized score. |

## Evidence Required From Agent

- Commands run and results.
- Scoring test output.
- Browser inspection notes or screenshots.
- Evidence for A1-A4.
- Known risks and open product questions.
