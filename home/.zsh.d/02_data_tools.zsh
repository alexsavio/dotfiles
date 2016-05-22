

addapath ~/bin

# SOFTWARE PATH
export SOFT_PATH=${HOME}/Software

# MYREPOS
if [ -d ${SOFT_PATH}/myrepos ];
then
    addapath ${SOFT_PATH}/myrepos
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
if [ -d /usr/share/virtualenvwrapper/ ];
then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
    export WORKON_HOME=~/envs
    export PIP_REQUIRE_VIRTUALENV=false
fi

if [ $+commands[virtualenvwrapper.sh] ];
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


# Load pyenv automatically by adding
#if [ -d $HOME/.pyenv ];
#then
#  export PATH="$HOME/.pyenv/bin:$PATH"
#  eval "$(pyenv init -)"
#  eval "$(pyenv virtualenv-init -)"
#fi


#Intel C++ Studio
if [ -d /opt/intel ];
then
    export INTEL_HOME=/opt/intel
    addapath ${INTEL_HOME}/bin
    addlibpath /opt/intel/mkl/lib/intel64
    addlibpath /opt/intel/lib/intel64
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
