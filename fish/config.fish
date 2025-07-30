set fish_greeting

source (/usr/local/bin/starship init fish --print-full-init | psub)
# fastfetch
# bun alias fd fdfind
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


# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

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

# --- Cargo/Rust setup ---
# Source Cargo environment if the file exists

if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end
# --- Homebrew/Linuxbrew setup ---
# Check if 'brew' command is available in the PATH
if type -q brew
    # Source brew shellenv if in an interactive session
    status --is-interactive; and source (brew shellenv | psub)
end


# --- Kiro integration ---
# Check if 'kiro' command is available in the PATH


if type -q mise
    mise activate fish | source
end
# File system
alias ls 'eza -lh --group-directories-first --icons=auto'
alias lsa 'ls -a'
alias lt 'eza --tree --level=2 --long --icons --git'
alias lta 'lt -a'
alias ff 'fzf --preview \"bat --style=numbers --color=always {}\"'
