# Typing Tutor PR Evidence

Created: 2026-06-29

## Summary

- Slice: first practice-flow slice
- Branch/PR: example case study
- Agent: future coding agent
- Status: example evidence contract

## Changes Expected

- Practice screen with difficulty control.
- Typing input and prompt submission.
- Scoring logic for accuracy and words per minute.
- Result state with restart path.
- Tests for scoring edge cases.

## Acceptance Criteria Evidence

| Criterion | Evidence | Status |
| --- | --- | --- |
| A1 | Browser flow completes one prompt and result screen shows accuracy plus speed. | Required |
| A2 | Difficulty can be changed before starting a session. | Required |
| A3 | Unit tests cover empty input, exact match, partial match, and extra characters. | Required |
| A4 | Desktop and tablet inspection show no text overlap. | Required |

## Checks Run

| Check | Command/Method | Result | Notes |
| --- | --- | --- | --- |
| Scoring unit tests | Target app test runner | Required | Agent fills command output. |
| Browser practice flow | Manual or automated browser check | Required | Agent records result evidence. |
| Difficulty switch check | Browser check | Required | Agent records prompt change evidence. |
| Responsive inspection | Screenshots or visual notes | Required | Desktop and tablet. |

## Product Inspection

- Environment: target app dev server.
- Viewports/devices: desktop and tablet.
- Screenshots/videos: required after implementation.
- Workflow notes: adult controls should be used before active typing, not during result review.

## Risks And Tradeoffs

| Risk | Impact | Mitigation/Next Step |
| --- | --- | --- |
| WPM definition may be disputed. | Result may confuse adults. | Decide and document whether WPM uses prompt words or typed words. |
| Difficulty control may distract learner. | Practice flow may feel busy. | Consider hiding adult controls during active session. |

## Skipped Or Blocked Checks

| Check | Reason | Owner |
| --- | --- | --- |
| Real learner observation | Requires implemented prototype. | Builder |

## Questions For Developer Review

- Is the result language clear enough for a young learner?
- Does adult difficulty control belong on the setup screen only?
