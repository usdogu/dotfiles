set -gx PATH ~/.cargo/bin /usr/local/sbin /usr/local/bin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl ~/bin ~/.local/bin ~/go/bin ~/.dotnet/tools ~/.nimble/bin
set -U fish_greeting
set -gx EDITOR nvim

alias cls=clear
alias s=doas
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
alias tmux=zellij
alias paru="paru --sudo doas"
alias htop="bpytop"

function cd
 builtin cd $argv && ls;
end

function sv
 sudo -e $argv
end
starship init fish | source
zoxide init --cmd cd fish | source

