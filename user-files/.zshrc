# Starship
eval "$(starship init zsh)"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"

# TGENV
export PATH="$HOME/.tgenv/bin:$PATH"

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


## iterm shell integration
source ~/.iterm2_shell_integration.zsh



## PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

autoload bashcompinit && bashcompinit

# pyenv virtual env auto-acitvate/deactivate
eval "$(pyenv virtualenv-init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

#Pipx
eval "$(register-python-argcomplete pipx)"

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
alias reload_profile="source ~/.zshrc"
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

### terraform aliases
alias tf-dev='export TF_ENV=dev && terraform workspace select $TF_ENV'
alias tf-prod='export TF_ENV=prod && terraform workspace select $TF_ENV'
alias tf='terraform'
alias tf-pe='terraform plan -var-file=$TF_ENV.tfvars' # terraform plan env
alias tf-pec='terraform plan -var-file=$TF_ENV.tfvars -no-color | grep -E "(^.*[#~+-] .*|^[[:punct:]]|Plan)"' # terraform plan env concise
alias tf-ae='terraform apply -var-file=$TF_ENV.tfvars'
alias tf-we='terraform workspace select $TF_ENV'
### Functions

alias stride='cd ~/projects/stride'

alias redshift='PGPASSWORD=$(lpass show --password "[stride-redshift-bi]stride_master") psql -h stride-redshift-bi.chtiuoaujeat.us-west-2.redshift.amazonaws.com -d dev -U stride_master -p 5439'
alias sqlworkbenchj='java -jar /Applications/SQLWorkbenchJ.app/Contents/Java/sqlworkbench.jar </dev/null &>/dev/null &'
alias redshift_clip_pwd='lpass show --password "[stride-redshift-bi]stride_master" -c'
alias prod-data-stage='PGPASSWORD=$(lpass show --password "[prod-data-stage]stride") psql -h prod-data-stage.cgv2wqpzi494.us-west-2.rds.amazonaws.com -d postgres -U stride'
alias prod-scala-tax='PGPASSWORD=$(lpass show --password "[prod-scala-tax]stride") psql -h prod-scala-tax.cgv2wqpzi494.us-west-2.rds.amazonaws.com -d postgres -U stride'


### AWS AutoComplete
complete -C '/usr/local/bin/aws_completer' aws