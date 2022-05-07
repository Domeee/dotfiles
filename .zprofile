if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec ssh-agent startx
fi

. /opt/asdf-vm/asdf.sh
