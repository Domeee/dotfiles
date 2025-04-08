#!/bin/bash

set -euo pipefail

output_left="DP-3"
output_middle="DP-1"
output_right="DP-2"

swaymsg output $output_left scale 1 pos 0 0
swaymsg output $output_middle scale 1 pos 3840 0
swaymsg output $output_right scale 1 pos 7680 0
