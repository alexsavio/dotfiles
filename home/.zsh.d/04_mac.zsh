
export EDITOR=/usr/bin/vim
export MP_EDITOR=/usr/bin/edit

#HOMEBREW
if [[ -x $(whence brew) ]]; then
    fpath=($(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh $fpath)
fi
compinit

# Julia
if [ -d /Applications/Juno.app/ ]; then
    addapath /Applications/Juno.app/Contents/Resources/app/julia/bin
fi

# Matlab
if [ -d /Applications/MATLAB_R2015b.app/ ]; then
    addapath /Applications/MATLAB_R2015b.app/bin
fi

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
