#!/usr/bin/env bash
# Rebuild cleanyourtv's reference launcher with its config.xml and install it as Home.
# The stock launcher is already disabled on this TV, so nothing else is disabled (STOCK_LAUNCHER=none).
# JDK 17 is passed for this build only; the system's default Java is left alone.
#
# Usage: CLEANYOURTV=~/cleanyourtv TV_HOST=<tv ip> ./install-launcher.sh
set -euo pipefail
: "${TV_HOST:?set TV_HOST to the TV address}"
cd "${CLEANYOURTV:?set CLEANYOURTV to your cleanyourtv checkout}"
env STOCK_LAUNCHER=none \
    JAVA_HOME="${JAVA_HOME_17:-/usr/lib/jvm/java-17-openjdk}" \
    ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}" \
    launcher/build-and-install.sh
