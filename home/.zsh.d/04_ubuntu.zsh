

# Qt
if [ -d ${SOFT_PATH}/Qt ];
then
    export QT_PATH=${SOFT_PATH}/Qt
    addapath ${SOFT_PATH}/Qt/5.5/gcc_64/bin
    export MOC=${SOFT_PATH}/Qt/5.5/gcc_64/bin/moc
fi
