#!/usr/bin/env zsh

export GOENV_ROOT="$HOME/.goenv"
addpathprefix $GOENV_ROOT/bin

eval "$(goenv init -)"

addpathprefix $GOROOT/bin
addpathsuffix $GOPATH/bin
