#!/bin/sh
# Schlägt fehl, wenn eine auslieferbare Datei eine Mailadresse im Klartext enthält.
cd "$(dirname "$0")/.." || exit 2
hits=$(grep -rInE '[A-Za-z0-9._%+-]+@(benkohler\.de|gmail\.com)|mailto:[^ "'"'"']*@' . \
  --exclude-dir=.git --exclude-dir=.claude --exclude-dir=scripts --exclude-dir=node_modules)
if [ -n "$hits" ]; then
  echo "Mailadresse im Klartext gefunden:"; echo "$hits"; exit 1
fi
echo "OK: keine Klartext-Mailadresse."
