const assert = require("node:assert/strict");
const { normalizeText, scoreAttempt } = require("./scoring.js");

function test(name, fn) {
  try {
    fn();
    console.log(`pass: ${name}`);
  } catch (error) {
    console.error(`fail: ${name}`);
    throw error;
  }
}

test("normalizes casing and whitespace", () => {
  assert.equal(normalizeText("  Cat   Sat  "), "cat sat");
});

test("scores empty input without crashing", () => {
  const score = scoreAttempt("cat", "", 30000);
  assert.equal(score.accuracy, 0);
  assert.equal(score.wpm, 0);
  assert.equal(score.correctCharacters, 0);
  assert.equal(score.responseCharacters, 0);
});

test("scores exact match at 100 accuracy", () => {
  const score = scoreAttempt("cat", "cat", 30000);
  assert.equal(score.accuracy, 100);
  assert.equal(score.correctCharacters, 3);
  assert.equal(score.responseCharacters, 3);
  assert.equal(score.wpm, 2);
});

test("scores partial match below 100", () => {
  const score = scoreAttempt("cat", "ca", 30000);
  assert.equal(score.accuracy, 67);
  assert.equal(score.correctCharacters, 2);
  assert.equal(score.responseCharacters, 2);
});

test("penalizes extra characters", () => {
  const score = scoreAttempt("cat", "cats", 30000);
  assert.equal(score.accuracy, 75);
  assert.equal(score.correctCharacters, 3);
  assert.equal(score.responseCharacters, 4);
});

test("scores multi-word typing speed with accuracy", () => {
  const score = scoreAttempt("cat sat", "cat sat", 60000);
  assert.equal(score.accuracy, 100);
  assert.equal(score.typedWords, 2);
  assert.equal(score.wpm, 2);
});
