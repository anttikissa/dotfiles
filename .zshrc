alias ls='ls -GFA'
alias l='ls -l'
alias .='source'

export EDITOR=vim
export PROMPT="%~%# "

# Set window title to hostname
echo -ne "\e]1;`hostname`\a"

source .aliases

