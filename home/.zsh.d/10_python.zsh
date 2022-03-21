#!/usr/bin/env zsh

eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
export PIPENV_PYTHON=$(pyenv root)/shims/python
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 

export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.9.7/bin/python"
