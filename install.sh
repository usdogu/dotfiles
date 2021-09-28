#!/usr/bin/bash

sudo pacman -Syyyu && sudo pacman -S git emacs ripgrep fd neovim nerd-fonts-jetbrains-mono libx11 libxinerama libxft libxext libxrender ttf-hack ttf-joypixels llvm
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# create necessary dirs
mkdir -p ~/Derleme && cd ~/Derleme
mkdir -p ~/bin

#install required things for dwm
git clone https://github.com/siduck76/st.git
cd st
sudo make install
cd .. && rm -rf st

git clone https://www.gitlab.com/dwt1/dmenu-distrotube.git
cd dmenu-distrotube
sudo make install
cd .. && rm -rf dmenu-distrotube

git clone https://github.com/usdogu/rootblocks.git
cd rootblocks
cargo build --release
cp target/release/rootblocks ~/bin/rootblocks
cd .. && rm -rf rootblocks

echo "Finished installing required packages for dwm."

# clone dots

git clone --recurse-submodules https://github.com/usdogu/dotfiles.git
cd dotfiles

#install other required things
echo "Installing Doom Emacs..."
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
echo "Doom Emacs installed."

cp -r .doom.d ~/.doom.d
cp .xinitrc ~
cp .Xresources ~

cd .config
cp starship.toml ~/.config/
cp -r sxhkd ~/.config/sxhkd
cp fish/config.fish ~/.config/fish/config.fish

cd dwm-dots
sudo make install

cd ~
~/.emacs.d/bin/doom sync
echo "Done."
cd ~
