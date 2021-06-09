#!/usr/bin/env zsh

( isinpath pipenv && isinpath pyenv ) && PIPENV_PYTHON=$(pyenv root)/shims/python

if ( isinpath pipenv ); then
  export LC_ALL=en_US.utf-8
  export LANG=en_US.utf-8
  eval "$(pipenv --completion)"
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
   export PYENV_ROOT="$HOME/.pyenv"
   addpathsuffix $PYENV_ROOT/bin

   eval "$(pyenv init --path)"
   eval "$(pyenv init -)"
   eval "$(pyenv virtualenv-init -)"
   #pyenv global 3.7.3

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
