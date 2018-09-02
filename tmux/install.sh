#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -s "$DIR/tmux.conf" $HOME/.tmux.conf
ln -s "$DIR/tmux-gitbar.conf" $HOME/.tmux-gitbar.conf
ln -s "$DIR/tmux-gitbar" $HOME/.tmux-gitbar

if [ "$(uname -s)" == "Darwin" ]; then
  ln -s "$DIR/tmux.osx.conf" $HOME/.tmux.osx.conf
else
  ln -s "$DIR/tmux.linux.conf" $HOME/.tmux.linux.conf
fi
