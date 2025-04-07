#!/bin/bash

set -euo pipefail

output_middle="DP-1"
output_right="DP-2"

swaymsg output $output_middle scale 1
swaymsg output $output_right scale 2 pos 5760 0
