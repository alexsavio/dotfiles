#!/usr/bin/env zsh

( isinpath direnv ) &&  eval "$(direnv hook zsh)"
( isinpath starship ) &&  eval "$(starship init zsh)"
( isinpath zoxide ) &&  eval "$(zoxide init zsh)"


# addpathsuffix $HOME/.pulumi/bin
# addpathsuffix $HOME/.tfenv/bin
# addpathsuffix $HOME/software/balena-cli

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}