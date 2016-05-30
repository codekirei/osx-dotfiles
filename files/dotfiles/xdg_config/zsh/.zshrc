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

############################################################
# PROMPT
############################################################
PROMPT="
%U%~%u
> "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim: ft=zsh
