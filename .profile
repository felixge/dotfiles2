# infinite history
export HISTFILESIZE=
export HISTSIZE=

# prefer homebrew bins
export PATH="/usr/local/bin:$PATH"

# editor
export EDITOR='vim'

# git
[[ $- == *i* ]] && source /usr/local/etc/bash_completion.d/git-completion.bash
[[ $- == *i* ]] && source /usr/local/etc/bash_completion.d/git-prompt.sh

# golang
export GOPATH="$HOME/code/go"
export PATH="$HOME/code/go/bin:$PATH"

# prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUPSTREAM=verbose
export GIT_PS1_SHOWUNTRACKEDFILES=true
PROMPT_COMMAND='__git_ps1 "" "\W \[\e[0;31m\]⌁\[\e[0m\]\[\e[0m\] " "(%s) "'

# direnv
eval "$(direnv hook bash)"

# postgres app cli tools
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# avoids wrong locale setting due to using german regional setting
export LANG="en_US.UTF-8"

# homebrew
export PATH="/usr/local/sbin:$PATH"

# secrets
source "$HOME/.profile_secret"

# fasd
eval "$(fasd --init auto)"
alias j='fasd_cd -d'
alias jo='fasd -e open -d'

# other aliases
alias h='sudo vim /etc/hosts'
alias jour='vim ~/Documents/Journal/$(date +'%Y-%m-%d.md')'

# anaconda
export PATH="/Users/felix/anaconda/bin:$PATH"
