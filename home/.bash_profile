#!/usr/bin/env bash

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"
