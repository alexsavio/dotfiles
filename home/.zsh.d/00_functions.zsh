#!/usr/bin/env zsh

addapath() {
    if [ -e $1 ]; then
        export PATH=$1:$PATH
    fi
}

addlibpath() {
    if [ -e $1 ]; then
        if [[ "$(uname -s)" == 'Darwin' ]]
        then
            export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:$1
        else
            export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
        fi
    fi
}

isinpath() {
    (( $+commands[$1] ))
}

dotenv_if_exists() {
    local path=${1:-}
    if [[ -z $path ]]; then
        path=$PWD/.env
    elif [[ -d $path ]]; then
        path=$path/.env
    fi
    watch_file "$path"
    if ! [[ -f $path ]]; then
        return
    fi
    eval "$("$direnv" dotenv bash "$@")"
}