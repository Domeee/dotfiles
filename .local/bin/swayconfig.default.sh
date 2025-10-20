#!/bin/bash

set -euo pipefail

output_left="DP-3"
output_middle="DP-1"
output_right="DP-2"

swaymsg output $output_left enable
swaymsg output $output_left scale 2 pos 0 0
swaymsg output $output_middle scale 2 pos 1920 0
swaymsg output $output_right enable
swaymsg output $output_right scale 2 pos 3840 0
