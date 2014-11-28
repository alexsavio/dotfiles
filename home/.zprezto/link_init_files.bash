#!/bin/bash

#setopt EXTENDED_GLOB
for rcfile in `ls ~/.zprezto/runcoms/z*`; do
  baserc=`basename $rcfile`
  ln -fs "$rcfile" "~/.${baserc}"
done
