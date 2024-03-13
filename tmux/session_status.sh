#!/usr/bin/env bash

status=""
sessions=$(tmux ls -F '#S')

if [ "$( echo "$sessions" | wc -l )" -le 1 ]; then exit; fi

for session in $sessions; do
  if [ "$session" = "$1" ]; then
    status="$status#[fg=green]$session #[default]"
  else
    status="$status$session "
  fi
done

printf '%s#[fg=white,bold]| ' "$status"
