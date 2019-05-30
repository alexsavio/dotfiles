#!/usr/bin/env zsh

#HOMEBREW
#if ( isinpath brew ); then
#    fpath=($(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh $fpath)
#fi

# llvm-config
if [ -d /usr/local/opt/llvm/ ]; then
    export LLVM_CONFIG=/usr/local/opt/llvm/bin/llvm-config
fi

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"
