############################################################
# SOURCE
############################################################
. "$HOME"/.secret
. "$ZDOTDIR"/.plugins
. "$ZDOTDIR"/.opts
. "$ZDOTDIR"/.aliases
. "$ZDOTDIR"/.functions

############################################################
# PATH
############################################################
path_prepend /usr/local/bin
path_prepend /usr/local/sbin
path_prepend "$HOME"/code/sh/bin
path_prepend "$HOME"/code/python/bin

############################################################
# PROMPT
############################################################
PROMPT="
%U%~%u
> "

############################################################
# DOCKER
############################################################
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/jacob/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

############################################################
# NVM
############################################################
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

############################################################
# FZF
############################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim: ft=zsh
