
addapath() {
  if [ -e $1 ]; then
    export PATH=$PATH:$1
  fi
}


addapath ~/bin

# MYREPOS
if [ -d ${HOME}/Software/myrepos ];
then
    addapath ${HOME}/Software/myrepos
fi


#FSL
if [ -d /etc/fsl/5.0 ]
then
    . /etc/fsl/5.0/fsl.sh
    export FSLPARALLEL=condor
fi

if [[ "$(uname -s)" == 'Darwin' ]]
then
   export FSLDIR=/usr/local/fsl
   source ${FSLDIR}/etc/fslconf/fsl.sh
   addapath ${FSLDIR}/bin
   export FSLPARALLEL=condor
fi

#RUBY
if [ -d ~/.rvm ];
then
    source ~/.rvm/scripts/rvm
fi

#FREESURFER
if [ -d /opt/freesurfer ];
then
    export FREESURFER_HOME=/opt/freesurfer
    source $FREESURFER_HOME/SetUpFreeSurfer.sh
fi

#Komodo-Edit
addapath /opt/Komodo-Edit/bin

#CUDA
if [ -d /usr/local/cuda ];
then
    addapath /usr/local/cuda/bin
fi

#AFNI
if [ -d ~/abin ]
then
    export AFNI_PATH=~/abin
    addapath $AFNI_PATH
    export DYLD_FALLBACK_LIBRARY_PATH=$AFNI_PATH
fi

#CVIP
if [ -d ~/Software/cvip ];
then
    export CVIPHOME=~/Software/cvip
    export CVIP_IMGPATH=./
    export CVIP_DISPLAY=picture
    export TCL_LIBRARY=~/Software/cvip/CVIPTCL/lib/tcl8.0
    export TK_LIBRARY=~/Software/cvip/CVIPTCL/lib/tk8.0
    export XF_LOAD_PATH=~/cvip/CVIPTCL/GUI_SCRIPTS
    export LD_LIBRARY_PATH=/usr/lib/fsl/5.0:~/Software/cvip/lib:~/cvip/CVIPTCL/lib:${LD_LIBRARY_PATH}
    export PATH=${PATH}:~/Software/cvip/CVIPTCL:~/Software/cvip/bin
fi

#ANTS
if [ -d ~/Software/ants ];
then
    export ANTSPATH=~/Software/ants/build/bin
    addapath $ANTSPATH
fi

#C3D
if [ -d ~/Software/c3d ];
then
    export C3D_PATH=~/Software/c3d/bin
    addapath $C3D_PATH
fi

#Python
if [[ "$(uname -s)" == 'Darwin' ]]
then
   #export PYTHON2_PATH=/Library/Frameworks/Python.framework/Versions/2.7
   #export PYTHON3_PATH=/Library/Frameworks/Python.framework/Versions/3.4
   export PYTHON2_PATH=/usr/local/lib/python2.7
   export PYTHON3_PATH=/usr/local/lib/python3.4
else
   export PYTHON2_PATH=/usr/local/lib/python2.7
   export PYTHON3_PATH=/usr/local/lib/python3.4
fi


# VIRTUALENVWRAPPER
if (( $+commands[virtualenvwrapper.sh] )) ;
then
    export WORKON_HOME=~/envs
    source virtualenvwrapper.sh
#    export PIP_REQUIRE_VIRTUALENV=true
fi

# PIP
export PIP_CONFIG_FILE=~/.pip/pip.conf
# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end


#Intel C++ Studio
if [ -d /opt/intel ];
then
    export INTEL_HOME=/opt/intel
    export PATH=${PATH}:${INTEL_HOME}/bin
    export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:/opt/intel/lib/intel64:${LD_LIBRARY_PATH}
fi
