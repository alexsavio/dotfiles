#!/usr/bin/env zsh

export EDITOR=/usr/bin/vim
export MP_EDITOR=/usr/bin/edit

#HOMEBREW
if ( isinpath brew ); then
    fpath=($(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh $fpath)
fi
compinit

# Julia
addapath /Applications/Juno.app/Contents/Resources/app/julia/bin

# Matlab
addapath /Applications/MATLAB_R2015b.app/bin

# llvm-config
if [ -d /usr/local/opt/llvm/ ]; then
    export LLVM_CONFIG=/usr/local/opt/llvm/bin/llvm-config
fi

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# iterm2_shell_integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"
