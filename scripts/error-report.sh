#!/bin/bash
mkdir -p reports
grep -n 'ERROR' logs/*.log > reports/errors.txt
printf 'Error report saved to reports/errors.txt\n'
