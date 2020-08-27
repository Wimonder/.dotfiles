set -Ux EDITOR nvim
set -Ux MANPAGER "/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

### Aliases
# Root stuff
alias doas="doas --"
# Vim stuff
alias vim="nvim"
# Package management
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages
# Use exa instead of ls
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
# Grep with colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# Require confirmation
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
# Adding extra flags to some commands
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
# More equals less
alias more=less
# Top memory and cpu using processes
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# Shutdown and reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"
# Error messages from journalctl
alias jctl="journalctl -p 3 -xb"
# Different shells
alias gobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias gozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias gofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"
# Bare git repo alias for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user no
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user your_normal_user
set -g theme_color_scheme terminal2-dark-black
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
