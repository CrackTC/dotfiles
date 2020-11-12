# vim:ft=sh
export EDITOR=nvim
alias vim nvim
set fish_greeting 'Talk is cheap. Show me the code.'
set -g -x RANGER_LOAD_DEFAULT_RC FALSE
export LC_ALL="zh_CN.UTF-8"

export FZF_DEFAULT_OPTS='--reverse --border'
export FZF_DEFAULT_COMMAND="ag -l --hidden --ignore .git . \$dir 2> /dev/null"
export FZF_CTRL_T_OPTS="--preview 'highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {} 2> /dev/null | head -200'"
