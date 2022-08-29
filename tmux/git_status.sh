#!/bin/sh

path_status=${1:-$(pwd)}
#is_active=${2:-0}
is_active="0"
host_status="" # "${3:-$(hostname)}:"
git_status=""

default_color="colour244"

if [ "$is_active" = 1 ]; then
	# path_color="colour10"
	path_color="white"
else
	path_color="$default_color"
fi

if git -C "$1" rev-parse --git-dir > /dev/null 2>&1; then
	git_status=$(git -C "$1" status --branch --porcelain=2 | awk -v is_active="$is_active" default_color="$default_color"'
		$2 ~ /upstream/ { upstream=$3 }
		$2 ~ /head/ { head=$3 }
	END {
		if ( is_active ) {
			#upstream_color = "red"
			#head_color = "yellow"
			#separator_color = "white"
			upstream_color = "white"
			head_color = "white"
			separator_color = "white"
		} else {
			upstream_color = default_color
			head_color = default_color
			separator_color = default_color
		}

		print "#[fg="upstream_color"]"head"#[fg="separator_color"]<#[fg="head_color"]"upstream
	}
	')
fi

printf "#[fg=%s]%s%s %s" "$path_color" "$host_status" "$path_status" "$git_status"
