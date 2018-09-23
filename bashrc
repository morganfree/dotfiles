if [ -f ~/.bash_aliases ]; then
	# shellcheck source=/dev/null
	. ~/.bash_aliases
fi

shopt -s checkwinsize		# check the window size after each command and update the values of LINES and COLUMNS.
shopt -s globstar				# enable recursive globbing (**)
shopt -s autocd					# if a command name is a directory execute it with cd
shopt -s cmdhist				# save multiline command in one line
shopt -s nocaseglob			# match files in a case-insensitive fashion

HISTCONTROL=ignoreboth	# don't put duplicate lines or lines starting with space in the history.

export HISTIGNORE="&:[ ]*:?:exit:ls:bg:fg:history:clear:pwd"

export PS1='\$ '
export EDITOR='vim -e'
export VISUAL=vim

if [ -f ~/.bashrc.local ]; then
	# shellcheck source=/dev/null
	. ~/.bashrc.local
fi
