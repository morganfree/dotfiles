#!/usr/bin/env bash

status=""

if git -C "$1" rev-parse --git-dir > /dev/null 2>&1; then
	status=$(\
		git -C "$1" status --branch --porcelain=2 \
		| awk '$2 ~ /head|upstream/ { print "#[fg=green]"$3 }' ORS=' '\
	)
fi

tmux set-window-option status-right "$status" > /dev/null
