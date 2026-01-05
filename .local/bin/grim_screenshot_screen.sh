grim -t png -o "$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused) | .output')" - \
| wl-copy -t image/png
