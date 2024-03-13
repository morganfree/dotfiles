#!/bin/bash

set -eo pipefail

tee \
	>( sed -n '2 p' | xargs -I {} gh pr edit --title '{}') \
	>( gh pr edit -F- ) \
	| cat # without cat or with /dev/null the script cannot exit
