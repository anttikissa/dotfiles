alias ls='ls -GFA'
alias l='ls -l'
alias .='source'

export EDITOR=vim
export PROMPT="%~%# "

# Don't you zsh sniff my $EDITOR, please.
bindkey -e

# Set window title to hostname
echo -ne "\e]1;`hostname`\a"

source .aliases

