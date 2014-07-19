#!/usr/bin/env bash

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
_byobu_sourced=1 
. /usr/bin/byobu-launch
