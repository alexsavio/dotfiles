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

#AFNI
if [ -d ~/abin ]
then
    export AFNI_PATH=~/abin
    addapath $AFNI_PATH
    export DYLD_FALLBACK_LIBRARY_PATH=$AFNI_PATH
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

    # for openssl version reasons,
    # this is fucking my DYLD_LIBRARY_PATH
    # enable this only where you need it:
    #addlibpath ${MCR_DIR}/sys/os/$SPM_ARCH
    #addlibpath ${MCR_DIR}/bin/$SPM_ARCH
fi
