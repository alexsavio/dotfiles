#!/usr/bin/env zsh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIPENV_PYTHON=$(pyenv root)/shims/python

# Created by `pipx` on 2021-11-09 16:04:08
export PIPX_DEFAULT_PYTHON=/Library/Frameworks/Python.framework/Versions/Current/bin/python3
