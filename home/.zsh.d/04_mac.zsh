
#PYTHON
addapath ${PYTHON2_PATH}/bin
addapath ${PYTHON3_PATH}/bin

export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=/usr/bin/vim
export MP_EDITOR=/usr/bin/edit

#PORTS LIBS
#export LDFLAGS="${LDFLAGS} -L/opt/local/lib"
#export DYLD_LIBRARY_PATH=/opt/local/lib:${DYLD_LIBRARY_PATH}
#export CPPFLAGS="${CPPFLAGS} -I/opt/local/include"
#export LD_LIBRARY_PATH=/opt/local/lib:${LD_LIBRARY_PATH}
#export LD_INCLUDE_PATH=/opt/local/include:${DYLD_INCLUDE_PATH}

# Add MacPorts directories, if they exist.
if [ -d /opt/local ]; then
        addapath /opt/local/bin
        addapath /opt/local/sbin
	export MANPATH=/opt/local/share/man:$MANPATH
	export C_INCLUDE_PATH=/opt/local/include
	export CPLUS_INCLUDE_PATH=/opt/local/include
	alias gcc="gcc -I/opt/local/include -L/opt/local/lib"
	alias g++="g++ -I/opt/local/include -L/opt/local/lib"
	if [ -f /opt/local/etc/bash_completion ]; then
	    . /opt/local/etc/bash_completion
	fi
fi


export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
