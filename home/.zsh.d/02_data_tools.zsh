#FSL
if [ -d /etc/fsl/5.0 ]
then
    . /etc/fsl/5.0/fsl.sh
    export FSLPARALLEL=condor
fi

if [ -d ~/bin ];
then
    PATH=${PATH}:~/bin
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
if [ -d /opt/Komodo-Edit ];
then
    export PATH="/opt/Komodo-Edit/bin:$PATH"
fi

#CUDA
if [ -d /usr/local/cuda/bin ]; 
then
    export PATH=/usr/local/cuda/bin:${PATH}
fi

#AFNI
if [ -d ~/abin ]; 
then
    export PATH=~/abin:${PATH}
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

#virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
    export WORKON_HOME=~/envs
    source /usr/local/bin/virtualenvwrapper.sh
#    export PIP_REQUIRE_VIRTUALENV=true
fi

#miniconda3
if [ -d ~/miniconda3 ]
then
    export PATH=~/miniconda3/bin:$PATH
fi


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

