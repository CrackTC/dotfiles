export EDITOR='nvim'
export fish_greeting=''
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
# -1 indicates using default color of terminal
export FZF_DEFAULT_OPTS='--ansi --color=fg:#e5e9f0,bg:-1,hl:#81a1c1 --color=fg+:#e5e9f0,bg+:-1,hl+:#81a1c1 --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
export BAT_THEME='Nord'

bash -c 'if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec Hyprland
fi'

alias nnn 'nmap -T4 -A -v -Pn'

# vim:ft=sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/miniconda/bin/conda
#     eval /opt/miniconda/bin/conda "shell.fish" "hook" $argv | source
# end
# <<< conda initialize <<<

