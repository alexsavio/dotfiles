

# Open new tab in current directory
if [[ -f /etc/profile.d/vte-2.91.sh ]]
then
    . /etc/profile.d/vte-2.91.sh
fi

#if [ -f /usr/bin/byobu ]; then
#    _byobu_sourced=1
#    . /usr/bin/byobu-launch
#fi
#

#ntfy
if ( isinpath ntfy ); then
    eval "$(ntfy shell-integration)"
    export AUTO_NTFY_DONE_IGNORE="vim screen meld tig git"
fi
