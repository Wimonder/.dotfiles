#!/usr/bin/env bash
# Install script for all the required packages

# Refresh pacman
sudo pacman -Syy

# Install yay
sudo pacman -S yay --noconfirm --needed

# Packages variable
packages=( 'node' 'yarn' 'noto-fonts-emoji' 'i3lock-color' 'fish' 'exa' 'neovim' 'nerd-fonts-fira-code' 'i3blocks' 'i3lock-fancy-git' 'termite' 'dunst' 'picom' 'rofi' 'neofetch' )

# Install packages
yay -S ${packages[@]} --noconfirm --needed

# Install oh my fish
# curl -L https://get.oh-my.fish | fish
curl -L https://get.oh-my.fish > install
chmod u+r+x ./install
./install --noninteractive --path=~/.local/share/omf --config=~/.config/omf
rm -f ./install
# Neovim setup
# Install neovim python module
pip3 install --user neovim
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Setup vim-plug plugins
nvim +'PlugInstall --sync' +qa

# Configure and provision i3blocks
[ ! -d "$HOME/.config/i3blocks" ] && mkdir -p "$HOME/.config/i3blocks"

if [ ! -d "$HOME/.config/i3blocks/.git" ]; then
  pushd "$HOME/.config/i3blocks"
  git init
  git remote add origin https://github.com/vivien/i3blocks-contrib
  git fetch origin
  git checkout -b master --track origin/master
  popd
fi

# Extra fish configuration
sudo pip install wakatime

echo -e "Installation succesful!\nYou now have a working setup with my dotfiles."
exit 0
