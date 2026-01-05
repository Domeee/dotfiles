grim -t png -g "$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused == true).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | wl-copy -t image/png
