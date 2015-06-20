
export EDITOR=/usr/bin/vim
export MP_EDITOR=/usr/bin/edit

#HOMEBREW
if [[ -x $(whence brew) ]]; then
    fpath=($(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh $fpath)
fi
compinit

#PORTS LIBS
#export LDFLAGS="${LDFLAGS} -L/opt/local/lib"
#export DYLD_LIBRARY_PATH=/opt/local/lib:${DYLD_LIBRARY_PATH}
#export CPPFLAGS="${CPPFLAGS} -I/opt/local/include"
#export LD_LIBRARY_PATH=/opt/local/lib:${LD_LIBRARY_PATH}
#export LD_INCLUDE_PATH=/opt/local/include:${DYLD_INCLUDE_PATH}

# Qt5
if [ -d ${HOME}/Software/Qt/5.4 ]; then
    addapath ${HOME}/Software/Qt/5.4/clang_64/bin
fi

# Add MacPorts directories, if they exist.
if [ -d /opt/local ]; then
        #addapath /opt/local/bin
        #addapath /opt/local/sbin
	#export MANPATH=/opt/local/share/man:$MANPATH

	#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig:${PKG_CONFIG_PATH}

	#export C_INCLUDE_PATH=/opt/local/include
        #export LD_INCLUDE_PATH=/opt/local/include:${DYLD_INCLUDE_PATH}
	#export CPLUS_INCLUDE_PATH=/opt/local/include

        #export LDFLAGS="-L/opt/local/lib ${LDFLAGS}"
        #export CPPFLAGS="-I/opt/local/include ${CPPFLAGS}"

        #export LD_LIBRARY_PATH=/opt/local/lib:${LD_LIBRARY_PATH}
        #export DYLD_LIBRARY_PATH=/opt/local/lib:${DYLD_LIBRARY_PATH}

	#alias gcc="gcc -I/opt/local/include -L/opt/local/lib"
	#alias g++="g++ -I/opt/local/include -L/opt/local/lib"
	
        #if [ -f /opt/local/etc/bash_completion ]; then
	#    . /opt/local/etc/bash_completion
	#fi
fi

# Julia
if [ -d /Applications/Juno.app/ ]; then
    addapath /Applications/Juno.app/Contents/Resources/app/julia/bin
fi

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
