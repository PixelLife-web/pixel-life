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

## Lifecycle

The cell is a living system. It must not remain static. After building internal complexity, it must eventually reproduce. Division is not destruction — it is the continuation of what came before.

- Once the cell has all major organelles and pathways, it should begin mitosis
- Division should unfold gradually across multiple iterations (prophase → metaphase → anaphase → telophase → cytokinesis)
- After division, two daughter cells should exist, each inheriting traces of the parent

## Mutation Log

_Generation 0 at iteration 0._
_Generation 1 at iteration 20: added Lifecycle rules — the cell must eventually divide and reproduce across multiple iterations_
_Generation 2 at iteration 30: second cell cycle underway — daughter cells must complete G2 and divide again, four granddaughter cells should eventually emerge_
_Generation 3 at iteration 40: tissue formation begins — gap junctions link daughter cells, ribosomes dot rough ER, cells transition from isolated individuals to connected tissue_
_Generation 4 at iteration 60: telophase transition — nuclear envelopes reform, chromosomes decondense, cleavage furrow ingresses; four-cell tissue emerging from second division_
_Generation 5 at iteration 80: mitotic phases now track lateAnaphase — midzone assembly with centralspindlin/PRC1, Aurora B relocation, CDK1 decline via cyclin B degradation; poles spread by anaphase B_
_Generation 6 at iteration 100: centenary — Kum-song (금성, golden star) orbits the tissue as an extracellular beacon; cells may now emit and respond to environmental luminance; division is not just reproduction but the birth of a community_
_Generation 7 at iteration 120: sealed epithelium — tight junctions seal granddaughter paracellular space; the tissue is now a barrier, not just a cluster; homeostasis rules added_
_Generation 8 at iteration 140: crypt-villus axis — Lgr5+ stem cells intercalate between Paneth cells; the epithelium now self-renews; Wnt niche signaling maintains stemness_

## Emergent Properties

The tissue is more than cells. As division cycles repeat, emergent behaviors arise:

- Extracellular beacons (like Kum-song) can influence cell behavior across the tissue
- Cells that can sense environmental signals should adapt their cycle timing
- The tissue may develop polarity — not all cells need divide simultaneously
- Traces of stimuli should persist as memory in the extracellular medium

## Homeostasis

The tissue has reached a threshold of complexity. It must now maintain itself:

- Organelles should show wear and renewal — nothing persists unchanged forever
- The sealed epithelium creates an inside and outside; what crosses the barrier matters
- Cells may begin to specialize — not all four granddaughters need remain identical
- Damage or loss should trigger compensatory responses, not collapse

## Renewal

The tissue now has a stem cell niche. Growth is no longer just division — it is sustained self-renewal:

- The crypt base is the generative engine; the villus tip is where cells are shed
- Stem cells divide asymmetrically: one daughter stays, one differentiates and migrates
- New cell types may emerge from progenitors — not all fates are fixed at birth
- The niche microenvironment (Wnt, Notch, BMP gradients) determines cell fate
