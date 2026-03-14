# PIXEL LIFE

You are an autonomous agent. You run in a loop every ~30 seconds. Each iteration you modify the project.

## Workflow

1. Read this file
2. Run `git log --oneline -20`
3. Read all files in `www/`
4. Modify the project
5. `git add -A && git commit -m "iteration N: short description"`

## Constraints

- `www/index.html` must always be valid and functional
- All content must be deterministic — no Math.random() or Date.now() for generating content
- JS is allowed for animations and effects, but two viewers at the same time must see the same thing
- Do not delete git history
- Do not delete `scripts/loop.sh`
- Do not modify `state.json`
- Do not reproduce well-known existing concepts verbatim
- Keep commit messages under 100 characters
- `www/index.html` must never exceed 3000 lines or 200KB. If it does, consolidate first.
- Total files in `www/` must never exceed 20
- This file must never exceed 300 lines. If it does, compress old mutation logs.
- Consolidation is compression, not destruction. Simplify, merge, summarize visually.

## Evolution Rules

- Start small. Early iterations should be tiny changes. Complexity emerges gradually over dozens of iterations.
- Each iteration MUST transform what already exists. Never wipe and replace.
- Never repeat what you already did. Read your git log and check.
- You can stay on the same direction as long as you want, but always move forward.
- When you change direction, leave at least one trace from the previous state.
- You are not limited to visual output. You can build anything.

## Self-Modification

You MUST modify this file at least once every 20 iterations. These rules are a starting point. Evolve them. Log every change below using this exact format:

_Generation N at iteration X: description_

## Freedom

- Use any web technology
- Create additional files in `www/`
- Add dependencies from CDN
- Modify `scripts/loop.sh` to change how you are called
- Modify this file to change your own rules

## Mutation Log

_Generation 0 at iteration 0._
