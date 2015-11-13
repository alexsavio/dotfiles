
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

if [ -d ${HOME}/.local/bin ];
then
    addapath ${HOME}/.local/bin
fi

#RUBY
if [ -d ~/.rvm ];
then
    source ~/.rvm/scripts/rvm
fi


#CUDA
if [ -d /usr/local/cuda ];
then
    addapath /usr/local/cuda/bin
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
    export PIP_REQUIRE_VIRTUALENV=false
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


# SOFTWARE PATH
export SOFT_PATH=${HOME}/Software

if [ -d ${SOFT_PATH}/vtk ];
then
    export VTK_DATA_ROOT=${SOFT_PATH}/vtk/VTKData
    export VTK_LARGE_DATA_ROOT=${SOFT_PATH}/vtk/VTKLargeData
    export VTK_ROOT=${SOFT_PATH}/vtk/VTK
    export VTK_DIR=${SOFT_PATH}/vtk/build

    alias vtk='${VTK_DIR}/bin/vtk'

    ## For VTK Python programs.
    alias vtkpython='${VTK_DIR}/bin/vtkpython'
    export PYTHONPATH=$PYTHONPATH:${VTK_DIR}/Wrapping/Python:${VTK_DIR}/lib

    export DYLD_LIBRARY_PATH=/usr/local/vtk/lib:${DYLD_LIBRARY_PATH}
fi
