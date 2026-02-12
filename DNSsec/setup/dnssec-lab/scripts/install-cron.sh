#!/usr/bin/env bash
set -euo pipefail
# Monthly cron job (1st of each month at 02:10) to run monthly-rotate.sh.
cd "$(dirname "$0")/.."
LINE="10 2 1 * * bash $PWD/scripts/monthly-rotate.sh >> $PWD/logs/monthly-rotate.log 2>&1"
( crontab -l 2>/dev/null | grep -v monthly-rotate.sh; echo "$LINE" ) | crontab -
echo "Installed cron: $LINE"
