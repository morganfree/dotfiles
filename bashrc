shopt -s checkwinsize		# check the window size after each command and update the values of LINES and COLUMNS.
shopt -s globstar				# enable recursive globbing (**)
shopt -s cmdhist				# save multiline command in one line
shopt -s nocaseglob			# match files in a case-insensitive fashion


HISTCONTROL=ignoreboth	# don't put duplicate lines or lines starting with space in the history.

export HISTIGNORE="&:[ ]*:?:exit:ls:bg:fg:history:clear:pwd"
export PS1='\$ '
export EDITOR='vim -e'
export VISUAL=vim


# aliases
alias c='clear'

alias dotfiles='cd ~/dotfiles'

alias tmuxconf='vim ~/.tmux.conf'
alias vimrc='vim ~/.vimrc'
alias bash_aliases='vim ~/.bash_aliases'
alias bashrc='vim ~/.bashrc'
alias bash_profile='vim ~/.bash_profile'
alias inputrc='vim ~/.inputrc'
alias lvim='vim -u .vimrc.local'


# load local config if exists
if [ -f ~/.bashrc.local ]; then
	# shellcheck source=/dev/null
	. ~/.bashrc.local
fi
