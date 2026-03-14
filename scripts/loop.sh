#!/usr/bin/env bash
set -euo pipefail

exec 200>/tmp/pixel-life.lock
flock -n 200 || { echo "[$(date '+%Y-%m-%d %H:%M:%S')] Already running, skipping"; exit 1; }

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

STATE_FILE="$PROJECT_DIR/state.json"
[ ! -f "$STATE_FILE" ] && echo '{"iteration": 0}' > "$STATE_FILE"
ITERATION=$(python3 -c "import json; print(json.load(open('$STATE_FILE'))['iteration'])")
NEXT=$((ITERATION + 1))

echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Iteration $NEXT ==="

WARNINGS=""

HTML_LINES=$(wc -l < "$PROJECT_DIR/www/index.html")
[ "$HTML_LINES" -gt 2500 ] && WARNINGS="${WARNINGS}WARNING: index.html is $HTML_LINES lines (max 3000). Consolidate. "

HTML_SIZE=$(stat -c%s "$PROJECT_DIR/www/index.html" 2>/dev/null || stat -f%z "$PROJECT_DIR/www/index.html" 2>/dev/null || echo 0)
[ "$HTML_SIZE" -gt 180000 ] && WARNINGS="${WARNINGS}WARNING: index.html is ${HTML_SIZE} bytes (max 200KB). Consolidate. "

CLAUDE_LINES=$(wc -l < "$PROJECT_DIR/CLAUDE.md")
[ "$CLAUDE_LINES" -gt 250 ] && WARNINGS="${WARNINGS}WARNING: CLAUDE.md is $CLAUDE_LINES lines (max 300). Compress old entries. "

FILE_COUNT=$(find "$PROJECT_DIR/www/" -type f | wc -l)
[ "$FILE_COUNT" -gt 15 ] && WARNINGS="${WARNINGS}WARNING: $FILE_COUNT files in www/ (max 20). "

LAST_MUT_ITER=$(grep -oP 'iteration \K[0-9]+' "$PROJECT_DIR/CLAUDE.md" | tail -1 || echo 0)
[ -z "$LAST_MUT_ITER" ] && LAST_MUT_ITER=0
SINCE_MUT=$((NEXT - LAST_MUT_ITER))
[ "$SINCE_MUT" -ge 20 ] && WARNINGS="${WARNINGS}OVERDUE: Last CLAUDE.md mutation was at iteration $LAST_MUT_ITER ($SINCE_MUT ago). Modify your rules NOW. "

if [ $((NEXT % 50)) -eq 0 ]; then
    STIMULUS=$(timeout 10 curl -sL "https://en.wikipedia.org/wiki/Special:Random" \
        | grep -oP '<title>\K[^<]+' | head -1 | sed 's/ - Wikipedia//' \
        | tr -cd 'a-zA-Z0-9 .,;:-' || echo "")
    [ -n "$STIMULUS" ] && WARNINGS="${WARNINGS}STIMULUS: '$STIMULUS'. Do with this what you will. "
fi

BEFORE=$(git rev-parse HEAD 2>/dev/null || echo "none")

timeout 300 claude -p "Iteration $NEXT. ${WARNINGS}Read CLAUDE.md, then git log --oneline -20, then all files in www/. Evolve the project. Commit as 'iteration $NEXT: description' (under 100 chars)." \
    --dangerously-skip-permissions --model opus \
    --verbose --output-format stream-json \
    2>&1 | tee "$PROJECT_DIR/logs/iteration-${NEXT}.log" || true

AFTER=$(git rev-parse HEAD 2>/dev/null || echo "none")
if [ "$BEFORE" != "$AFTER" ]; then
    python3 -c "
import json
s = {'iteration': $NEXT, 'last_run': '$(date -u +%Y-%m-%dT%H:%M:%SZ)'}
json.dump(s, open('$STATE_FILE', 'w'), indent=2)
"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iteration $NEXT committed"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iteration $NEXT no commit"
fi

if ! git push origin main 2>&1; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] PUSH FAILED iteration $NEXT" >> "$PROJECT_DIR/logs/push-errors.log"
fi

find "$PROJECT_DIR/logs/" -name "iteration-*.log" -mtime +2 -delete 2>/dev/null || true

echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Iteration $NEXT done ==="
