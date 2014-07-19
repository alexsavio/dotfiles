#!/usr/bin/env bash

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f /usr/bin/byobu ]; then
    _byobu_sourced=1 
    . /usr/bin/byobu-launch
fi
