#!/usr/bin/env zsh

# Python3 version
if ( isinpath python3 ); then
    addapath 
fi

# Pipenv
#if ( isinpath pipenv ); then
#  eval "$(pipenv --completion)"
#fi

# Pip configuration
if ( isinpath pip );
then
  # PIP
  export PIP_CONFIG_FILE=~/.pip/pip.conf
  # pip zsh completion start
  function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
               COMP_CWORD=$(( cword-1 )) \
               PIP_AUTO_COMPLETE=1 $words[1] ) )
  }
  compctl -K _pip_completion pip
# pip zsh completion end
fi

export GIT_PYTHON_TRACE=full

# AnaConda
if [ -d $HOME/anaconda3 ];
then
    addapath $HOME/anaconda3/bin
fi

#Intel C++ Studio
if [ -d /opt/intel ];
then
    export INTEL_HOME=/opt/intel
    addapath ${INTEL_HOME}/bin
    addlibpath /opt/intel/mkl/lib/intel64
    addlibpath /opt/intel/lib/intel64
fi

export BETTER_EXCEPTIONS=1

