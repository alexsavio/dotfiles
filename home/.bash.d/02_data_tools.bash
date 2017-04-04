if [ -d ~/bin ];
then
    PATH=${PATH}:~/bin
fi

#RUBY
if [ -d ~/.rvm ];
then
    source ~/.rvm/scripts/rvm
fi

