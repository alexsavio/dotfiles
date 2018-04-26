#!/usr/bin/env zsh

#HOMEBREW
if ( isinpath brew ); then
    fpath=($(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh $fpath)
fi
compinit

# llvm-config
if [ -d /usr/local/opt/llvm/ ]; then
    export LLVM_CONFIG=/usr/local/opt/llvm/bin/llvm-config
fi

export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"
