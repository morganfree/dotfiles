#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -s "$DIR" $HOME/.vim
ln -s "$DIR/vimrc" $HOME/.vimrc
