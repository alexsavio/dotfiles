#!/usr/bin/env zsh

#RUBY
if [ -d ~/.rvm ];
then
    source ~/.rvm/scripts/rvm
fi

# VTK
if [ -d ${SOFT_PATH}/vtk ];
then
    export VTK_DATA_ROOT=${SOFT_PATH}/vtk/VTKData
    export VTK_LARGE_DATA_ROOT=${SOFT_PATH}/vtk/VTKLargeData
    export VTK_ROOT=${SOFT_PATH}/vtk/VTK
    export VTK_DIR=${SOFT_PATH}/vtk/build

    alias vtk='${VTK_DIR}/bin/vtk'

    ## For VTK Python programs.
    alias vtkpython='${VTK_DIR}/bin/vtkpython'
    #export PYTHONPATH=$PYTHONPATH:${VTK_DIR}/Wrapping/Python:${VTK_DIR}/lib

    addlibpath /usr/local/vtk/lib
fi

# CLING C++ Interpreter
if [ -d ${SOFT_PATH}/cling ];
then
    addapath ${SOFT_PATH}/cling/bin/bin
    addlibpath ${SOFT_PATH}/cling/bin/lib
fi

# Qt5
if [ -d ${SOFT_PATH}/Qt ];
then
    export QT_PATH=${SOFT_PATH}/Qt

    export QT_VERSION=`python -c "import os,re; print(list(filter(lambda x: re.match(re.compile(r'\d\.\d', re.UNICODE), x), os.listdir(os.environ['QT_PATH'])))[0])"`

    export QT_ARCH=`python -c "import os,re; print([x for x in ('gcc_64', 'clang_64') if os.path.exists(os.path.join(os.environ['QT_PATH'], os.environ['QT_VERSION'], x))][0])"`

    export QT_ARCH_PATH=${QT_PATH}/${QT_VERSION}/${QT_ARCH}

    export MOC=${QT_ARCH_PATH}/bin/moc

    addapath ${QT_ARCH_PATH}/bin
    addlibpath ${QT_ARCH_PATH}/lib
fi
