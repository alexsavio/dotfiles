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
   eval "$(pyenv init -)"
   pyenv-reboot () {
       pyenv deactivate; pyenv virtualenv-delete ${1}; pyenv virtualenv ${2} ${1}; pyenv activate ${1};
   }
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
