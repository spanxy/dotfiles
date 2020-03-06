# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Extended Globbing options
shopt -s extglob

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

red="\033[1;31m";
norm="\033[0;39m";
cyan="\033[1;36m";
if [ "$PS1" ]; then
    if [[ $UID -eq 0 ]]; then
      PS1="\[$red\]\u@\h: \w\[\033[0;39m\]\n# "
    else
      PS1="\[$cyan\][\u@\h]: \w\[\033[0;39m\]\n> "
    fi
    #export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\] "
    export PS1="$PS1"
fi

# Editor to vim
EDITOR='/usr/bin/vim'
export EDITOR

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# Pip barks at installation of packages in version 2 if not present
PIP_REQUIRE_VIRTUALENV=false
export PIP_REQUIRE_VIRTUALENV

umask 027
