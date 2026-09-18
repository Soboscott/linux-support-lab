#!/bin/bash
search_term="${1:-ERROR}"
mkdir -p reports
grep -n -F -- "$search_term" logs/*.log > reports/errors.txt
printf 'Report for "%s" saved to reports/errors.txt\n' "$search_term"
