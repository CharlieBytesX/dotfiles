set fish_greeting

source (/usr/local/bin/starship init fish --print-full-init | psub)
# fastfetch
# bun
alias fd fdfind
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function f
    set selected (fd --type d | fzf ) # Select directories
    if test -n "$selected"
        cd $selected # Change to the first selected directory
    end
end
function n
    fd | fzf -m | xargs -r nvim

end

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export RUSTC_WRAPPER sccache
zoxide init fish | source

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# adds alias for "kubectl" to "kubecolor" with completions
function kubectl --wraps kubectl
  command kubecolor $argv
end

# adds alias for "k" to "kubecolor" with completions
function k --wraps kubectl
  command kubecolor $argv
end
# reuse "kubectl" completions on "kubecolor"
function kubecolor --wraps kubectl
  command kubecolor $argv
end

function kctx
  command kubectl config use-context $argv
end

status --is-interactive; and source ("/home/linuxbrew/.linuxbrew/bin/brew" shellenv | psub)

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
