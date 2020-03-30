# Starship
eval "$(starship init zsh)"

## Homebrew
export PATH="/usr/local/sbin:$PATH"
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi


## iterm shell integration
source ~/.iterm2_shell_integration.zsh



## PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

# pyenv virtual env auto-acitvate/deactivate
eval "$(pyenv virtualenv-init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

#Pipx
eval "$(register-python-argcomplete pipx)"

### GOLANG
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

### AWS AutoComplete
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

### Aliases
alias profile="code ~/.bash_profile"
alias reload_profile="source ~/.bash_profile"
alias dotfiles="code ~/projects/cfbarbero/dotfiles"
alias update_dotfiles="source ~/projects/cfbarbero/dotfiles/bootstrap.sh"
alias https='http --default-scheme=https'

alias dc="docker-compose"

alias hosts="sudo vim /etc/hosts"
alias reload-dns="sudo killall -HUP mDNSResponder"

alias create-venv="python3 -m venv --system-site-packages .venv && source .venv/bin/activate"
alias activate-venv="source .venv/bin/activate"
alias av='activate-venv'

alias dhi="cd ~/projects/dhi"
alias cfbarbero="cd ~/projects/cfbarbero"

alias bright="brightness 1"

# Influx
alias influxcloud='influx -host '\''marty-cd873146.influxcloud.net'\'' -ssl -precision rfc3339 -username cris.barbero -password $(security find-generic-password -w -s '\''marty-cd873146.influxcloud.net'\'' -a '\''cris.barbero'\'')'
alias kapacitorcloud='kapacitor -url "https://cris.barbero:$(security find-generic-password -w -s '\''marty-cd873146.influxcloud.net'\'' -a '\''cris.barbero'\'')@pinheads-cd873146.influxcloud.net:9092"'


alias gen-pwd-to-clipboard="pwgen -s 20 1 | tr -d '\n' | pbcopy"

alias dns-refresh="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
### Functions