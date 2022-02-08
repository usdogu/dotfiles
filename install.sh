#!/usr/bin/bash


sudo pacman -Syyyu && sudo pacman -S git emacs ripgrep fd neovim libx11 libxinerama libxft libxext libxrender ttf-hack ttf-joypixels llvm lsd clang fish sxhkd zoxide zellij doas

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
curl https://nim-lang.org/choosenim/init.sh -sSf | sh

# create necessary dirs
mkdir -p ~/Derleme && cd ~/Derleme
mkdir -p ~/bin

#install required things for dwm
echo "Installing DWM"
git clone https://github.com/siduck/st.git
cd st
sudo make install
cd .. && rm -rf st

git clone https://www.gitlab.com/dwt1/dmenu-distrotube.git
cd dmenu-distrotube
sudo make install
cd .. && rm -rf dmenu-distrotube

git clone https://github.com/usdogu/nimblocks.git
cd nimblocks
nimble build -d:release -d:danger
cp nimblocks ~/bin/nimblocks
cd .. && rm -rf nimblocks

git clone https://github.com/usdogu/dwm-dots.git
cd dwm-dots
sudo make install
cd .. && rm -rf dwm-dots

# clone dots
git clone --recurse-submodules https://github.com/usdogu/dotfiles.git
cd dotfiles

#install other required things
echo "Cloning Font..."
git clone https://aur.archlinux.org/nerd-fonts-jetbrains-mono.git
cd nerd-fonts-jetbrains-mono
makepkg -si
cd ..
rm -rf nerd-fonts-jetbrains-mono
echo "Cloned Font."

echo "Installing Doom Emacs..."
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo "Copying Config Files.."
cp -r .doom.d ~/
cp .xinitrc ~
cp .Xresources ~

cd .config
cp starship.toml ~/.config/
cp -r sxhkd ~/.config/sxhkd
cp fish/config.fish ~/.config/fish/config.fish

cd ~
~/.emacs.d/bin/doom sync
echo "Done."
cd ~
