# Local custom conguration
if [ -f ~/.zshrc.local ]
then
	source ~/.zshrc.local
fi

# Something M1
eval $(/opt/homebrew/bin/brew shellenv)
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

## path

export PATH=$HOME/bin:$PATH:./node_modules/.bin:~/node_modules/.bin

alias node='node --harmony-top-level-await --experimental-repl-await'

# enable https localhost with self-signed certificate
alias http='http --verify=no'

# Save history
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# autocompletion
autoload -U compinit
compinit

## aliases

source ~/.aliases
if [ -f ~/.aliases.custom ]
then
	source ~/.aliases.custom
fi

## environment

export EDITOR=vim

## prompt

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd () {
    vcs_info
#	print -Pn "info ${vcs_info_msg_0_}"
#	print -Pn "\e]0;${vcs_info_msg_0_} ${PWD/$HOME/\~}\a"
#	print -Pn "\e]0;${PWD/$HOME/\~}\a"
}

zstyle ':vcs_info:git*' formats "%{$fg[green]%}%b%m%u%c%{$reset_color%} "
zstyle ':vcs_info:git*' actionformats "%{$fg[magenta]%}%b (%a)%m%u%c%{$reset_color%} "

#export PROMPT='${vcs_info_msg_0_}%m:%~%# '
setopt prompt_subst
export PROMPT=': $vcs_info_msg_0_%~%(?..%F{1})%(!.#.;)%f '
#export RPROMPT='$vcs_info_msg_0_'
# no escape codes in vcs_info
#zstyle ':vcs_info:git:*' formats '%b'

## misc

# make things like "scp host.com:*.txt ." work
unsetopt nomatch

# Don't you zsh sniff my $EDITOR, please.
bindkey -e

# Set window title to hostname
# Not needed because precmd
#echo -ne "\e]1;`hostname`\a"

if [ -r ~/.todo ]; then
	cat ~/.todo
else
	for t in ~/.todo?*; do
		echo "[$t]:"
		cat $t
	done
fi

# NVM
# [ -s "/Users/antti/.nvm/nvm.sh" ] && . "/Users/antti/.nvm/nvm.sh" # This loads nvm

# source ~/.rvm/scripts/rvm
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# [ -s "/Users/antti/.scm_breeze/scm_breeze.sh" ] && source "/Users/antti/.scm_breeze/scm_breeze.sh"

eval "$(scmpuff init -s)"
