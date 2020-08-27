# .dotfiles for [i3 + i3-gaps + i3blocks + fish + neofetch + neovim + termite + dunst + rofi]
## Still a wip!
A repository containing my dotfiles.
------
## Details
- CLI
  - Fish
    - Oh My Fish
  - Bash
  - Neovim
    - vim-airline
    - Minimalist theme
    - Many plugins
  - FiraCode Nerd Font Mono
- GUI
  - i3
  - i3blocks
  - i3lock-fancy
  - termite
  - dunst
  - picom
  - rofi
  - FiraCode Nerd Font Mono
## Installation
Use the script below to deploy my dotfiles to your home directory.
``` bash
git clone --bare https://github.com/Wimonder/.dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} sh -c 'mkdir -p "./.config-backup/$(dirname {})"; mv {} .config-backup/{}'
fi;
config checkout
config config status.showUntrackedFiles no
chmod u+r+x $HOME/install.sh
$HOME/install.sh
```
