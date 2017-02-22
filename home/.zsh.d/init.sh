#!/usr/bin/zsh

echo '00_general_vars.zsh'
echo '01_aliases.zsh'
echo '02_data_tools.zsh'
echo '03_neuro.zsh'
echo '03_others.zsh'

if [ "$(uname)" = "Darwin" ]; then
    # Do something under Mac OS X platform
    echo '04_mac.zsh'
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # Do something under GNU/Linux platform
    echo '04_ubuntu.zsh'
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
fi

if [ "$(hostname)" = "corsair" ]; then
    echo '04_xmodmap.zsh'
fi
