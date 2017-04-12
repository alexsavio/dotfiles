#!/usr/bin/env zsh

# ROOT
if [ -d ${SOFT_PATH}/root/build ];
then
    export ROOTSYS=${SOFT_PATH}/root/build
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
if [ -d ${SOFT_PATH}/cvip ];
then
    export CVIPHOME=${SOFT_PATH}/cvip
    export CVIP_IMGPATH=./
    export CVIP_DISPLAY=picture
    export TCL_LIBRARY=${CVIPHOME}/CVIPTCL/lib/tcl8.0
    export TK_LIBRARY=${CVIPHOME}/cvip/CVIPTCL/lib/tk8.0
    export XF_LOAD_PATH=${CVIPHOME}/CVIPTCL/GUI_SCRIPTS

    addlibpath ${CVIPHOME}/lib
    addlibpath ${CVIPHOME}/CVIPTCL/lib
    addapath ${CVIPHOME}/cvip/CVIPTCL
    addapath ${CVIPHOME}/cvip/bin
fi

#MRTRIX3
if [ -d ${SOFT_PATH}/mrtrix3 ];
then
    export MRTRIXPATH=${SOFT_PATH}/mrtrix3/bin
    addapath $MRTRIXPATH
fi

#ANTS
if [ -d ${SOFT_PATH}/ants ];
then
    export ANTSPATH=${SOFT_PATH}/ants/build/bin
    addapath $ANTSPATH
fi

#ITKSNAP
if [ -d ${SOFT_PATH}/itksnap-bin ];
then
    export ITKSNAP_PATH=${SOFT_PATH}/itksnap-bin/bin
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

if [ -d ${SOFT_PATH}/c3d ];
then
    export C3D_PATH=${SOFT_PATH}/c3d/bin
    addapath $C3D_PATH
fi

# Camino
if [ -d ${SOFT_PATH}/camino ];
then
   export MANPATH=${SOFT_PATH}/camino/man:$MANPATH
   addapath ${SOFT_PATH}/camino/bin
fi

# SPM MCR
if [ -d ${SOFT_PATH}/spm_mcr ];
then
    export MCR_DIR=${SOFT_PATH}/spm_mcr/mcr/v91
    export SPM_DIR=${SOFT_PATH}/spm_mcr/spm12
    export SPMMCRCMD="$SPM_DIR/run_spm12.sh $MCR_DIR script"
    export FORCE_SPMMCR=1

    addapath ${MCR_DIR}/bin
    if [[ "$(uname -s)" == 'Darwin' ]]
    then
        export SPM_ARCH=maci64
    else
        export SPM_ARCH=glnx64
    fi
    addlibpath ${MCR_DIR}/runtime/$SPM_ARCH
    #addlibpath ${MCR_DIR}/bin/$SPM_ARCH
    addlibpath ${MCR_DIR}/sys/os/$SPM_ARCH
fi
