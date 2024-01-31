# Starship
eval "$(starship init zsh)"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"

# TGENV
export PATH="$HOME/.tgenv/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

## Homebrew
export PATH="/usr/local/sbin:$PATH"
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export AWS_SDK_LOAD_CONFIG=1

## iterm shell integration
source ~/.iterm2_shell_integration.zsh

## PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

autoload bashcompinit && bashcompinit

# pyenv virtual env auto-acitvate/deactivate
eval "$(pyenv virtualenv-init -)"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

#Pipx
eval "$(register-python-argcomplete pipx)"
export PATH=$PATH:$HOME/.local/bin

# Poetry
export PATH=$PATH:$HOME/.poetry/bin

### GOLANG
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# RUBY Path
export PATH=$PATH:"$HOME/.gem/ruby/2.6.0/bin"

### Aliases
alias prod-bastion="ssh -A  cbarbero@bastion.prod.stridehealth.com"
alias dev-bastion="ssh -A  cbarbero@bastion.stridehealth.io"
alias ll="ls -l"
alias lal="ls -al"
alias profile="code ~/.bash_profile"
alias rp="source ~/.zshrc"
alias reload-profile="source ~/.zshrc"
alias dotfiles="code ~/projects/cfbarbero/dotfiles"
alias update-dotfiles="source ~/projects/cfbarbero/dotfiles/bootstrap.sh"
alias https='http --default-scheme=https'

alias dc="docker-compose"

alias hosts="sudo vim /etc/hosts"
alias reload-dns="sudo killall -HUP mDNSResponder"
alias reset-network=" sudo ifconfig en0 down && sudo ifconfig en0 up"

alias create-venv="python3 -m venv --system-site-packages .venv && source .venv/bin/activate"
alias activate-venv="source .venv/bin/activate"
alias av='activate-venv'

alias cfbarbero="cd ~/projects/cfbarbero"

alias bright="brightness 1"

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
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

### terraform aliases
tf-setenv() {
  export TF_ENV=$1 && terraform workspace select $TF_ENV
}
alias tf-dev='export TF_ENV=dev && terraform workspace select $TF_ENV'
alias tf-prod='export TF_ENV=prod && terraform workspace select $TF_ENV'
alias tf-staging='export TF_ENV=staging && terraform workspace select $TF_ENV'
alias tf='terraform'
alias tf-pec='terraform plan -var-file=$TF_ENV.tfvars -no-color | grep -E "(^.*[#~+-] .*|^[[:punct:]]|Plan)"' # terraform plan env concise
alias tf-ae='terraform apply -var-file=$TF_ENV.tfvars'
alias tf-pe='terraform plan -var-file=$TF_ENV.tfvars'
tf-we() {export TF_ENV=$1 && terraform workspace select $TF_ENV }

### Functions

alias stride='cd ~/projects/stride'

alias redshift='PGPASSWORD=$(lpass show --password "[stride-redshift-bi]stride_master") psql -h stride-redshift-bi.chtiuoaujeat.us-west-2.redshift.amazonaws.com -d dev -U stride_master -p 5439'
alias sqlworkbenchj='java -jar /Applications/SQLWorkbenchJ.app/Contents/Java/sqlworkbench.jar </dev/null &>/dev/null &'
alias redshift-clip-pwd='lpass show --password "[stride-redshift-bi]stride_master" -c'
alias prod-data-stage='PGPASSWORD=$(lpass show --password "[prod-data-stage]stride") psql -h prod-data-stage.cgv2wqpzi494.us-west-2.rds.amazonaws.com -d postgres -U stride'
alias prod-scala-tax='PGPASSWORD=$(lpass show --password "[prod-scala-tax]stride") psql -h prod-scala-tax.cgv2wqpzi494.us-west-2.rds.amazonaws.com -d postgres -U stride'
alias dev-user-db='PGPASSWORD=$(lpass show --password "[dev-user-db]stridedb") psql postgresql://stridedb@dev-user-db.cqdlf9mhh8yg.us-west-1.rds.amazonaws.com:5432/stride'

pgdb() {
  PGPASSWORD=$(lpass show --password "[prod-scala-tax]stride")
}

dnslookup() {
  dscacheutil -q host -a name $1
}

alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

### AWS AutoComplete
complete -C '/usr/local/bin/aws_completer' aws

