#!/bin/bash

# Terminate already running instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar encore &

echo "Polybar launched..."
