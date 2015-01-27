
addapath() {
  if [ -e $1 ]; then
    export PATH=$PATH:$1
  fi
}

addapath ${HOME}/Software/myrepos
addapath /opt/local/bin
addapath ~/bin

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
addapath /usr/local/cuda/bin

#AFNI
addapath ~/abin

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

#virtualenvwrapper
if [ -f ${PYTHON3_PATH}/bin/virtualenvwrapper.sh ]
then
    export WORKON_HOME=~/envs
    source ${PYTHON3_PATH}/bin/virtualenvwrapper.sh
#    export PIP_REQUIRE_VIRTUALENV=true
fi

#miniconda3
addapath ~/miniconda3/bin

#autoenv
#Python
#git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
#source ~/.autoenv/activate.sh

#python-jedi
#export PYTHONSTARTUP=~/.pythonrc.py

#Intel C++ Studio
if [ -d /opt/intel ];
then
    export INTEL_HOME=/opt/intel
    export PATH=${PATH}:${INTEL_HOME}/bin
    export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:/opt/intel/lib/intel64:${LD_LIBRARY_PATH}
fi
