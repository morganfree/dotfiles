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

export_aws () {
	profile=${1:-default}

	AWS_ACCESS_KEY_ID="$(aws configure get --profile "$profile" aws_access_key_id)"
	AWS_SECRET_ACCESS_KEY="$(aws configure get --profile "$profile" aws_secret_access_key)"

	export AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY
}

set_aws_profile () {
	export AWS_PROFILE=${1:-default}
}

export AWS_VAULT_BACKEND=pass
export AWS_VAULT_PASS_PREFIX=aws-vault

get_mfa() {
	oathtool --base32 --totp "$(pass aws/dev/mfa)" | pbcopy
}

get_mfa_prod() {
	oathtool --base32 --totp "$(pass aws/prod/mfa)" | pbcopy
}
