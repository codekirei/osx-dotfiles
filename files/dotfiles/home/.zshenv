############################################################
# GENERAL
############################################################
export EDITOR="nvim"
export PAGER="less"

############################################################
# XDG
############################################################
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.data
export XDG_RUNTIME_HOME="$HOME"/.temp

############################################################
# ZSH
############################################################
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

############################################################
# LANGS
############################################################

# GO
export GOPATH="$HOME"/code/go

# LUA
export LUAROCKS_CONFIG="$XDG_CONFIG_HOME"/luarocks/config.lua

# NODE
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_LOGLEVEL="error"
export NPM_CONFIG_PREFIX="$HOME"/code/node/npm
export NPM_CONFIG_PROGRESS="false"
export NPM_CONFIG_SAVE_EXACT="true"

# PYTHON
# RUBY
# RUST

############################################################
# APPS
############################################################

# ANSIBLE
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME"/ansible/ansible.cfg

# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# LESS
export LESS="-R"
export LESSHISTFILE=-
