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
path_prepend "$HOME"/.local/bin
path_prepend /Applications/Firefox.app/Contents/MacOS
path_prepend "$XDG_CONFIG_HOME/git/subcommands"

############################################################
# NVM
############################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use default --silent

############################################################
# PYTHON
############################################################
path_prepend "$HOME"/.poetry/bin
path_prepend "$HOME"/.pyenv/shims
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
# . /usr/local/bin/virtualenvwrapper.sh
eval "$(pyenv init -)"
# eval "$(direnv hook zsh)"

############################################################
# POSTGRES
############################################################
export PSQLRC="$XDG_CONFIG_HOME/psql/.psqlrc"

############################################################
# FZF
############################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim: ft=zsh
