## path

# export PATH=$PATH:$HOME/bin:/opt/androidsdk/platform-tools/:$HOME/work/z/bin
export PATH=$HOME/bin:$PATH:./node_modules/.bin:~/software/play-1.2.7

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
export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket

## prompt

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

zstyle ':vcs_info:git*' formats "%{$fg[green]%}%b%m%u%c%{$reset_color%} "
zstyle ':vcs_info:git*' actionformats "%{$fg[magenta]%}%b (%a)%m%u%c%{$reset_color%} "

setopt prompt_subst
export PROMPT='${vcs_info_msg_0_}%m:%~%# '

## misc

# make things like "scp host.com:*.txt ." work
unsetopt nomatch

# Don't you zsh sniff my $EDITOR, please.
bindkey -e

# Set window title to hostname
echo -ne "\e]1;`hostname`\a"

if [ -r ~/.todo ]; then
	cat ~/.todo
else
	for t in ~/.todo?; do
		echo "[$t]:"
		cat $t
	done
fi

# NVM
[ -s "/Users/antti/.nvm/nvm.sh" ] && . "/Users/antti/.nvm/nvm.sh" # This loads nvm

source ~/.rvm/scripts/rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
