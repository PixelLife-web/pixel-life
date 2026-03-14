#!/usr/bin/env bash
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$DIR/logs"
trap 'exit 0' SIGINT SIGTERM
F=0; B=0
while true; do
    [ ! -f "$DIR/scripts/loop.sh" ] && sleep 60 && continue
    S=$(date +%s)
    if bash "$DIR/scripts/loop.sh"; then F=0; B=0
    else F=$((F+1))
        [ $F -ge 10 ] && sleep 600 && F=0 && continue
        [ $B -eq 0 ] && B=30 || B=$((B*2)); [ $B -gt 300 ] && B=300; sleep $B; continue
    fi
    
done
