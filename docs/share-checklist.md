# Share Checklist

Use this before sending the repo to someone.

## Share-Ready Checks

- [ ] README explains the project in the first screen.
- [ ] `docs/repo-tour.md` gives reviewers a short path.
- [ ] `docs/loop-engineering-framework.md` explains the three loops.
- [ ] `.loop/` validates successfully.
- [ ] `templates/` contains all 9 reusable artifacts.
- [ ] `scripts/init-loop-kit.sh` is executable.
- [ ] `scripts/validate-loop-kit.sh` is executable.
- [ ] Typing Tutor case study has a README.
- [ ] Typing Tutor prototype opens directly.
- [ ] Typing Tutor scoring tests pass.

## Commands

Run from repo root:

```bash
./scripts/validate-loop-kit.sh .
node examples/typing-tutor/prototype/scoring.test.js
bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh
git diff --check
```

Optional YAML check:

```bash
ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'
```

## Suggested Message When Sharing

Product Loop Kit is a plain-file framework for running product development loops with AI coding agents. It includes a framework doc, reusable `.loop` templates, initializer and validator scripts, self-application artifacts, and a Typing Tutor case study with a runnable prototype and evidence.

Start here:

- `README.md`
- `docs/repo-tour.md`
- `examples/typing-tutor/README.md`

## Known Caveats

- The Typing Tutor external feedback is synthesized from builder context; it has not yet been tested with a learner/adult pair.
- Product Loop Kit has not yet been applied by an external user in a separate repo.
- The validator is intentionally opinionated and may need configurability after real adoption feedback.
