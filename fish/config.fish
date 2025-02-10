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
zoxide init fish | source
