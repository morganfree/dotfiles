#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -s "$DIR/gitconfig" "$HOME/.gitconfig"
ln -s "$DIR/gitignore" "$HOME/.gitignore"

ln -s "$DIR/commands/git-bd" /usr/local/bin
