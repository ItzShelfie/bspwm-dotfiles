#!/usr/bin/env bash
# Robust rofi launcher for X11/bspwm
if pgrep -x rofi >/dev/null 2>&1; then
  exit 0
fi
# ensure DISPLAY is set when launched from hotkey daemon
export DISPLAY="${DISPLAY:-:0}"
exec /usr/bin/rofi -show drun
