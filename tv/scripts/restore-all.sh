#!/usr/bin/env bash
# Undo every batch on the TV, newest first, using cleanyourtv's tools/restore.sh.
#
# The lists must live at work/philips-55pus6581/ inside a cleanyourtv checkout: tools/disable.sh keys
# its restore records (~/.cleanyourtv/recovery-*.json) on the list's absolute path, so a copy of the
# list somewhere else has no record and restore.sh falls back to "enable everything in the list".
#
# Usage: CLEANYOURTV=~/cleanyourtv TV_HOST=<tv ip> ./restore-all.sh
set -uo pipefail
: "${TV_HOST:?set TV_HOST to the TV address}"
cd "${CLEANYOURTV:?set CLEANYOURTV to your cleanyourtv checkout}"
L=work/philips-55pus6581
for b in batch9-nettv-launcherapp batch8-smarttvhome batch7-stock-launcher batch5-google-preloads \
         batch4-philips-content batch3-frameworklogger batch2b-tvinput-false-positives \
         batch2a-philips-telemetry batch1-google-telemetry; do
  echo "== $b"
  tools/restore.sh "$L/$b.txt" com.google.android.tvlauncher || echo "!! $b did not restore cleanly, see above"
done
echo "== still disabled:"; tools/venv/bin/python tools/tv.py 'pm list packages -d'
