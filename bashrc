shopt -s checkwinsize  # check the window size after each command and update the values of LINES and COLUMNS.
shopt -s cmdhist       # save multiline command in one line
shopt -s nocaseglob    # match files in a case-insensitive fashion

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

export HISTIGNORE="&:[ ]*:?:??:exit:history:clear:pwd"
export PS1='\$ '
export EDITOR='vim -e'
export VISUAL=vim


# aliases
alias dotfiles='cd ~/dotfiles'

alias tmuxconf='vim ~/.tmux.conf'
alias vimrc='vim ~/.vim/vimrc'
alias bashrc='vim ~/.bashrc'
alias inputrc='vim ~/.inputrc'

if [ -f ~/.bashrc.local ]; then
	# shellcheck source=/dev/null
	. ~/.bashrc.local
fi
