#!/usr/bin/env zsh

#Python
if [[ "$(uname -s)" == 'Darwin' ]]
then
   #export PYTHON2_PATH=/Library/Frameworks/Python.framework/Versions/2.7
   #export PYTHON3_PATH=/Library/Frameworks/Python.framework/Versions/3.4
   export PYTHON2_PATH=/usr/local/lib/python2.7
   export PYTHON3_PATH=/usr/local/lib/python3.5
else
   export PYTHON2_PATH=/usr/local/lib/python2.7
   export PYTHON3_PATH=/usr/local/lib/python3.5
fi


# VIRTUALENVWRAPPER
if [ -d /usr/share/virtualenvwrapper/ ];
then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
    export WORKON_HOME=~/envs
    export PIP_REQUIRE_VIRTUALENV=false
fi

if ( isinpath virtualenvwrapper.sh );
then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    export WORKON_HOME=~/envs
    source virtualenvwrapper.sh
    export PIP_REQUIRE_VIRTUALENV=false
fi

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

# Load pyenv automatically by adding
#if [ -d $HOME/.pyenv ];
#then
#  export PATH="$HOME/.pyenv/bin:$PATH"
#  eval "$(pyenv init -)"
#  eval "$(pyenv virtualenv-init -)"
#fi


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
