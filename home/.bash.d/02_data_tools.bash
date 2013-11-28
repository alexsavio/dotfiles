#FSL
. /etc/fsl/5.0/fsl.sh
export FSLPARALLEL=condor


#FREESURFER
export FREESURFER_HOME=/opt/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

#CUDA
export PATH=/usr/local/cuda/bin:$PATH

#AFNI
export PATH=~/abin:$PATH

#CVIP
CVIPHOME=/home/alexandre/Software/cvip 
CVIP_IMGPATH=./
CVIP_DISPLAY=picture
TCL_LIBRARY=/home/alexandre/Software/cvip/CVIPTCL/lib/tcl8.0
TK_LIBRARY=/home/alexandre/Software/cvip/CVIPTCL/lib/tk8.0
XF_LOAD_PATH=/home/alexandre/Software/cvip/CVIPTCL/GUI_SCRIPTS
LD_LIBRARY_PATH=/usr/lib/fsl/5.0:/usr/lib/fsl/5.0:/home/alexandre/Software/cvip/lib:/home/alexandre/Software/cvip/CVIPTCL/lib
PATH=${PATH}:/home/alexandre/Software/cvip/CVIPTCL:/home/alexandre/Software/cvip/bin
export CVIPHOME
export CVIP_IMGPATH
export CVIP_DISPLAY
export TCL_LIBRARY
export TK_LIBRARY
export XF_LOAD_PATH
export LD_LIBRARY_PATH
export PATH

#virtualenvwrapper
export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true

#autoenv
#Python
#git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
source ~/.autoenv/activate.sh

