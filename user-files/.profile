## PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

## iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### Git helpers
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

## Shell Prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
### user@hostname path/to/directory (git state)$
PS1='\u@\h \w$(__git_ps1 " (%s)")\$ '

export PATH="$HOME/.local/bin:$PATH"

### GOLANG
export GOPATH=$HOME/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


### AWS AutoComplete
complete -C aws_completer aws


### Aliases
alias profile="code ~/.profile"
alias reload_profile="source ~/.profile"
alias dotfiles="code ~/projects/cfbarbero/dotfiles"
alias update_dotfiles="source ~/projects/cfbarbero/dotfiles/bootstrap.sh"
alias al-inf='awssaml -u $USER -a "inf:AWS-Developer" -d'
alias al-shrdsvcdev='awssaml -u $USER -a "dhishrdsvcdev:AWS-Developer" -d'
alias al-shrdsvcprod='awssaml -u $USER -a "dhishrdsvcprod:AWS-Developer" -d'
alias al-dhiprod='awssaml -u $USER -a "dhiprod:AWS-Engineer" -d'


alias dc="docker-compose"
### Functions