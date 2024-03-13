#!/bin/sh

set -e

issue_number=$(git rev-parse --abbrev-ref HEAD | grep --max-count=1 --only-matching '[0-9]\+' | head -n 1)

if [ -n "$issue_number" ]; then gh issue view --json number --jq ".number" "$issue_number"; fi
