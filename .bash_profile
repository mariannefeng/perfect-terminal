[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

source /usr/local/etc/bash_completion
GIT_PS1_SHOWDIRTYSTATE=true
HISTSIZE=5000
HISTFILESIZE=10000
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

alias ll='ls -altr'
alias gc='git checkout'
alias gs='git status'
alias gf='git fetch'
alias gd='git diff'
alias gpush='git push origin'
alias gpull='git pull origin'
alias gca='git commit -am'
alias reload='source ~/.bash_profile'

export PS1="😎:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

