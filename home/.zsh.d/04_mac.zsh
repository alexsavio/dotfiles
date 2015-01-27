
#PYTHON
addapath ${PYTHON2_PATH}/bin
addapath ${PYTHON3_PATH}/bin

#PORTS
addapath /opt/local/bin
addapath /opt/local/sbin

export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=/usr/bin/vim
export MP_EDITOR=/usr/bin/edit

#PORTS LIBS
export LDFLAGS="${LDFLAGS} -L/opt/local/lib"
#export DYLD_LIBRARY_PATH=/opt/local/lib:${DYLD_LIBRARY_PATH}
export CPPFLAGS="${CPPFLAGS} -I/opt/local/include"
#export LD_LIBRARY_PATH=/opt/local/lib:${LD_LIBRARY_PATH}
export LD_INCLUDE_PATH=/opt/local/include:${DYLD_INCLUDE_PATH}

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
