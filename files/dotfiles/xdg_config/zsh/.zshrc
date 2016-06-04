############################################################
# SOURCE
############################################################
. "$HOME"/.secret
. "$ZDOTDIR"/.aliases
. "$ZDOTDIR"/.functions
. "$ZDOTDIR"/.opts

############################################################
# PATH
############################################################
path_prepend /usr/local/bin
path_prepend /usr/local/sbin

############################################################
# PROMPT
############################################################
PROMPT="
%U%~%u
> "

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/jacob/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim: ft=zsh
