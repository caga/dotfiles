#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH=$HOME/.config/bspwn:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.bin/lemonbar:$PATH
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
source $HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh
export PROMPT_COMMAND='history -a; history -r'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
