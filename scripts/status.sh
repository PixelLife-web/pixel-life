#!/bin/bash
cd ~/pixel-life
echo "=== ITERATION ==="; cat state.json
echo -e "\n=== LAST 30 COMMITS ==="; git log --oneline -30
echo -e "\n=== MUTATIONS ==="; grep "^_Generation" CLAUDE.md
echo -e "\n=== SIZES ==="
echo "index.html: $(wc -l < www/index.html) lines, $(stat -c%s www/index.html 2>/dev/null || stat -f%z www/index.html) bytes"
echo "CLAUDE.md: $(wc -l < CLAUDE.md) lines"
echo "www/ files: $(find www/ -type f | wc -l)"
echo -e "\n=== PUSH ERRORS ==="
tail -5 logs/push-errors.log 2>/dev/null || echo "none"
