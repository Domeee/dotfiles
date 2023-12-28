# Source environment variables that need to be available
# in sway
if [ -f "$HOME/.config/sway/env" ]; then
  source "$HOME/.config/sway/env"
fi

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec sway
fi
