set -U fish_greeting
set -gx EDITOR nvim

alias cls=clear
alias s=sudo
alias cc="cargo check"
alias cr="cargo run"
alias ls=lsd
alias ll="lsd -l"
alias la="lsd -A"
alias l="lsd -Al"
alias saat="date '+%H:%M'"
alias cat=bat
alias rm=rip
alias v=nvim
alias vd="nvim -d"

function cd
 builtin cd $argv && ls;
end

function sv
 sudo -e $argv
end
starship init fish | source
