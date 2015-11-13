
addapath() {
  if [ -e $1 ]; then
    export PATH=$PATH:$1
  fi
}


# MYREPOS
if [ -d ${HOME}/Software/root/build ];
then
    export ROOTSYS=${HOME}/Software/root/build
    cd ${ROOTSYS}
    source bin/thisroot.sh
    cd
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

#FREESURFER
if [ -d /opt/freesurfer ];
then
    export FREESURFER_HOME=/opt/freesurfer
    source $FREESURFER_HOME/SetUpFreeSurfer.sh
fi

if [ -d /Applications/freesurfer ];
then
    export FREESURFER_HOME=/Applications/freesurfer
    source ${FREESURFER_HOME}/SetUpFreeSurfer.sh
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

#MRTRIX3
if [ -d ~/Software/mrtrix3 ];
then
    export MRTRIXPATH=~/Software/mrtrix3/bin
    addapath $MRTRIXPATH
fi

#ANTS
if [ -d ~/Software/ants ];
then
    export ANTSPATH=~/Software/ants/build/bin
    addapath $ANTSPATH
fi

#ITKSNAP
if [ -d ~/Software/itksnap-bin ];
then
    export ITKSNAP_PATH=~/Software/itksnap-bin/bin
    addapath $ITKSNAP_PATH
    alias snap=itksnap
fi

#C3D
#CONVERT3D
if [ -d /Applications/Convert3DGUI.app ];
then
    export C3D_PATH=/Applications/Convert3DGUI.app/Contents/bin
    addapath $C3D_PATH
fi

if [ -d ~/Software/c3d ];
then
    export C3D_PATH=~/Software/c3d/bin
    addapath $C3D_PATH
fi
