#!/usr/bin/env sh

OS=`uname`
if [ "${OS}" == "Darwin" ]; then
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
    if [ OS == "osx" ]; then
        PREFIX="/usr/local"
    else
        PREFIX=~
    fi
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

if [ "$OS" == "linux" ] && command -v apt-get >/dev/null 2>&1; then
    sudo apt-get install -y tmux fish vim git
fi

add .vimrc .vim
add .gitconfig .gitignore_global
add .inputrc
add .Xdefaults
add .tmux.conf
mkdir -p ~/.config/fish
add .config/fish/*.fish
mkdir -p ~/.config/xcolors
add .config/xcolors/thayer
mkdir -p ~/.config/alacritty
add .config/alacritty/alacritty.yml
add .phoenix.js

for executable in platform_bin/$OS/*; do
    link_prompt ~/.dotfiles/$executable $PREFIX/bin/${executable##*/}
done
for executable in platform_bin/all/*; do
    link_prompt ~/.dotfiles/$executable $PREFIX/bin/${executable##*/}
done

if ! test -e ~/.tmux/plugins/tpm; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

vim "+PlugInstall" "+qall"

# GNOME 3
if command -v gsettings >/dev/null 2>&1; then
    for config_file in ~/.dotfiles/.config/gnome3-extra/*.conf; do
        gsettings-import.js $config_file
    done
fi

cd $OLD_PWD
