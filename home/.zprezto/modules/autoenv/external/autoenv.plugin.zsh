#!/usr/bin/env zsh


if [[ -z $AUTOENV_AUTH_FILE ]]; then
    AUTOENV_AUTH_FILE=~/.autoenv_authorized
fi

if [[ -z $COLORS ]]; then
    COLORS=true
fi

if [[ -z $AUTOENV_IN_FILE ]]; then
  AUTOENV_IN_FILE=".env"
fi

if [[ -z $AUTOENV_OUT_FILE ]]; then
  AUTOENV_OUT_FILE=".out"
fi

check_and_run(){
    if [[ $COLORS == true ]]
    then
        echo -e "$fg_no_bold[green]> $fg_no_bold[red]WARNING$reset_color"
        echo -e "$fg_no_bold[green]> $fg_no_bold[blue]This is the first time you are about to source $fg_no_bold[yellow]\"$fg_bold[red]$1$fg_no_bold[yellow]\"$reset_color"
        echo
        echo -e "$fg_no_bold[green]----------------$reset_color"
        if hash pygmentize 2>/dev/null
        then
            echo
            `whence pygmentize` -f 256 -l shell -g "$1"
        else
            echo -e "$fg_no_bold[green]"
            cat $1
        fi
        echo
        echo -e "$fg_no_bold[green]----------------$reset_color"
        echo
        echo -ne "$fg_no_bold[blue]Are you sure you want to allow this? $fg[cyan]($fg_no_bold[green]y$fg[cyan]/$fg_no_bold[red]N$fg[cyan]) $reset_color"
    else
        echo "> WARNING"
        echo "> This is the first time you are about to source \"$1\""
        echo
        echo "----------------"
        echo
        cat $1
        echo
        echo "----------------"
        echo
        echo -n "Are you sure you want to allow this? (y/N)"
    fi
    read answer
    if [[ "$answer" == "y" ]] || [[ "$answer" == "Y" ]]
    then
        echo "$1:$2" >> $AUTOENV_AUTH_FILE
        envfile=$1
        shift
        source $envfile
    fi
}

check_and_exec(){
    if which shasum &> /dev/null
    then
        hash=$(shasum "$1" | cut -d' ' -f 1)
    else
        hash=$(sha1sum "$1" | cut -d' ' -f 1)
    fi
    if grep --quiet "$1:$hash" "$AUTOENV_AUTH_FILE"
    then
        envfile=$1
        shift
        source $envfile
    else
        check_and_run $1 $hash
    fi
}

autoenv_init(){
    _AUTOENV_OLDPATH="$OLDPWD"
    _AUTOENV_NEWPATH="$(pwd)"

    while [[ ! "$_AUTOENV_NEWPATH" == "$_AUTOENV_OLDPATH"* ]]
    do
        if [[ -f "$_AUTOENV_OLDPATH/$AUTOENV_OUT_FILE" ]]
        then
            check_and_exec "$_AUTOENV_OLDPATH/$AUTOENV_OUT_FILE"
        fi
        _AUTOENV_OLDPATH="$(dirname $_AUTOENV_OLDPATH)"
    done

    if [[ $_AUTOENV_OLDPATH == '/' ]]; then
        _AUTOENV_OLDPATH=''
    fi

    while [[ ! "$_AUTOENV_OLDPATH" == "$_AUTOENV_NEWPATH"  ]]
    do
        _AUTOENV_OLDPATH="$_AUTOENV_OLDPATH$(echo -n '/'; echo ${_AUTOENV_NEWPATH#${_AUTOENV_OLDPATH}} | tr \/ "\n" | sed -n '2p' )"
        if [[ -f "$_AUTOENV_OLDPATH/$AUTOENV_IN_FILE" ]]
        then
            check_and_exec "$_AUTOENV_OLDPATH/$AUTOENV_IN_FILE"
        fi
    done

}

if [[ -f "./$AUTOENV_IN_FILE" ]]
then
    check_and_exec "./$AUTOENV_IN_FILE"
fi

() {
    local OLDPWD='/'
    autoenv_init
}
chpwd_functions+=( autoenv_init )
