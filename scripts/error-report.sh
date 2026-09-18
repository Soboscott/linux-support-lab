#!/bin/bash
search_term="${1:-ERROR}"

mkdir -p reports
grep -n -F -- "$search_term" logs/*.log > reports/errors.txt
result=$?

if [ "$result" -eq 0 ]; then
    printf 'Report for "%s" saved to reports/errors.txt\n' "$search_term"
elif [ "$result" -eq 1 ]; then
    printf 'No matches found for "%s".\n' "$search_term"
else
    printf 'Search failed. Check the error message above.\n'
fi

exit "$result"
