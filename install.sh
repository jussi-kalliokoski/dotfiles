#!/usr/bin/env sh

OS=`uname`
if [ "${OS}" == "darwin" ]; then
    OS="osx"
else
    OS="linux"
fi

if [ ! -d ~/.dotfiles ]; then
    git clone --recursive https://github.com/jussi-kalliokoski/dotfiles ~/.dotfiles
fi

OLD_PWD=`pwd`
cd ~/.dotfiles

if [ "$PREFIX" == "" ]; then
    PREFIX="/usr/local"
fi

# link, confirm if directory
link(){
    ln -s $1 $2
}

# link, prompt if needs to overwrite
link_prompt(){
    if [ -L $2 ]; then
        echo "WARN: $2 is already linked, ignoring."
    elif [ -f $2 ] || [ -d $2 ]; then
        echo "ERROR: $2 already exists. Do you wish to overwrite?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) rm -rf $2; link $1 $2; break;;
                No ) break;;
            esac
        done
    else
        link $1 $2
    fi
}

add(){
    for p in "$@"; do
        link_prompt ~/.dotfiles/$p ~/$p
    done
}

add .vimrc .vim
add .inputrc
add .Xdefaults
add .tmux.conf
mkdir -p ~/.config
add .config/fish/*.fish
add .config/xcolors/thayer

for executable in platform_bin/$OS/*; do
    link_prompt ~/.dotfiles/$executable $PREFIX/bin/${executable##*/}
done
for executable in platform_bin/all/*; do
    link_prompt ~/.dotfiles/$executable $PREFIX/bin/${executable##*/}
done

cd $OLD_PWD

vim "+BundleInstall" "+qall"
