#!/usr/bin/env bash

status=""

for session in $(tmux ls -F '#S'); do
  if [ "$session" = "$1" ]; then
    status="$status#[fg=green]$session #[default]"
  else
    status="$status$session "
  fi
done

echo "$status"
