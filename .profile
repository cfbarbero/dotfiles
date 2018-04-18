## PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### Git helpers
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '

export PATH="$HOME/.local/bin:$PATH"

### AWS AutoComplete
complete -C aws_completer aws


### Aliases
alias profile="code ~/.profile"
alias reload_profile="source ~/.profile"
alias al-inf='awssaml -u $USER -a "inf:AWS-Developer" -d'

alias dc="docker-compose"
### Functions