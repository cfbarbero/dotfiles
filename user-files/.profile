## PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

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

# Increase bash history
export HISTFILESIZE=1000000
export HISTSIZE=1000000

### GOLANG
export GOPATH=$HOME/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


### NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


### AWS AutoComplete
complete -C /usr/local/bin/aws_completer aws


### Aliases
alias profile="code ~/.profile"
alias reload_profile="source ~/.profile"
alias dotfiles="code ~/projects/cfbarbero/dotfiles"
alias update_dotfiles="source ~/projects/cfbarbero/dotfiles/bootstrap.sh"
alias al='awssaml -u $USER'
alias al-sb1='awssaml -u $USER -a "dhisandbox1:AWS-Engineer" -d'
alias al-sb2='awssaml -u $USER -a "dhisandbox2:AWS-Engineer" -d'
alias al-shrdsvcdev='awssaml -u $USER -a "dhishrdsvcdev:DHI-PowerUser" -d'
alias al-shrdsvcprod='awssaml -u $USER -a "dhishrdsvcprod:DHI-PowerUser" -d'
alias al-dhiprod='awssaml -u $USER -a "dhiprod:DHI-PowerUser" -d'
alias al-shrdsvcall='awssaml -u $USER -a "dhishrdsvcdev:DHI-PowerUser" -a "dhishrdsvcprod:DHI-PowerUser"'

alias dc="docker-compose"

alias hosts="sudo vim /etc/hosts"
alias reload-dns="sudo killall -HUP mDNSResponder"

alias create-venv="python3 -m venv .venv"
alias activate-venv="source .venv/bin/activate"
alias av='activate-venv'

alias dhi="cd ~/projects/dhi"

alias bright="brightness 1"
### Functions