#!/bin/sh

set -e

issue_number=$(git rev-parse --abbrev-ref HEAD | grep -o '[0-9]\+')

if [ -n "$issue_number" ]; then gh issue view "$issue_number"; fi
