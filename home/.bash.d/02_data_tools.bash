#FSL
. /etc/fsl/5.0/fsl.sh
export FSLPARALLEL=condor


#FREESURFER
if [ -d /opt/freesurfer ]; 
then
	export FREESURFER_HOME=/opt/freesurfer
	source $FREESURFER_HOME/SetUpFreeSurfer.sh
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
if [ -d /home/alexandre/Software/cvip ]; 
then
	export CVIPHOME=/home/alexandre/Software/cvip 
	export CVIP_IMGPATH=./
	export CVIP_DISPLAY=picture
	export TCL_LIBRARY=/home/alexandre/Software/cvip/CVIPTCL/lib/tcl8.0
	export TK_LIBRARY=/home/alexandre/Software/cvip/CVIPTCL/lib/tk8.0
	export XF_LOAD_PATH=/home/alexandre/Software/cvip/CVIPTCL/GUI_SCRIPTS
	export LD_LIBRARY_PATH=/usr/lib/fsl/5.0:/home/alexandre/Software/cvip/lib:/home/alexandre/Software/cvip/CVIPTCL/lib:${LD_LIBRARY_PATH}
	export PATH=${PATH}:/home/alexandre/Software/cvip/CVIPTCL:/home/alexandre/Software/cvip/bin
fi

#virtualenvwrapper
export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true

#autoenv
#Python
#git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
source ~/.autoenv/activate.sh

#Intel C++ Studio
if [ -d /opt/intel ]; 
then
	export INTEL_HOME=/opt/intel
	export PATH=${PATH}:${INTEL_HOME}/bin
	export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:/opt/intel/lib/intel64:${LD_LIBRARY_PATH}
fi

