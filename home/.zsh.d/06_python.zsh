#!/usr/bin/env zsh

if ( isinpath pipenv && isinpath pyenv ); then
   PIPENV_PYTHON=$(pyenv root)/shims/python
fi

if ( isinpath pipenv ); then
  export LC_ALL=en_US.utf-8
  export LANG=en_US.utf-8
  eval "$(pipenv --completion)"
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
   export PYENV_ROOT="$HOME/.pyenv"
   addapath $PYENV_ROOT/bin

   pyenv global 3.7.1

   pyenv-reboot () {
       pyenv deactivate; pyenv virtualenv-delete ${1}; pyenv virtualenv ${2} ${1}; pyenv activate ${1};
   }
fi

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
