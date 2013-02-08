## path

# export PATH=$PATH:$HOME/bin:/opt/androidsdk/platform-tools/:$HOME/work/z/bin
export PATH=$HOME/bin:$PATH:./node_modules/.bin:~/code/play-2.1.0

## aliases

source ~/.aliases
if [ -f ~/.aliases.custom ]
then
	source ~/.aliases.custom
fi

## environment

export EDITOR=vim

## prompt

function git_current_branch() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "[${ref#refs/heads/}] "
}

function collapse_pwd {
	echo $(pwd | sed -e "s,^$HOME,~,")
}

setopt prompt_subst

export PROMPT='$(git_current_branch)%m:%~%# '

## misc

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


