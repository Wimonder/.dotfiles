# __      __
# \ \    / / Wim's bashrc file
#  \ \/\/ /  Some basic configuration
#   \    /
#    \/\/ 

### Exports
export EDITOR="nvim" # nvim is cool
export TERM="xterm-256color" # Colors
export HISTCONTROL=ignoredups:erasedups # No dupl entries
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\"" # Sets vim as manpager

# If not interactive, skip
[[ $- != *i* ]] && return

### Prompt
PS1='[\u@\h \W]\$ '

### Path stuffs
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### Change the window title of X terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### Shopt stuff
# If set, a command name that is the name of a directory is executed as if it were the argument to the cd command.
shopt -s autocd
# If set, minor errors in the spelling of a directory component in a cd command will be corrected. The errors checked for are transposed characters, a missing character, and a character too many. If a correction is found, the corrected path is printed, and the command proceeds.
shopt -s cdspell
# If set, Bash attempts to save all lines of a multiple-line command in the same history entry. This allows easy re-editing of multi-line commands.
shopt -s cmdhist
# If set, Bash includes filenames beginning with a ‘.’ in the results of filename expansion. The filenames ‘.’ and ‘..’ must always be matched explicitly, even if dotglob is set.
shopt -s dotglob
# If set, the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend
# If set, aliases are expanded as described below under aliases.
shopt -s expand_aliases 
# If set, Bash checks the window size after each external (non-builtin) command and, if necessary, updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### Aliases
# Root stuff
alias doas="doas --"
# Vim stuff
alias vim="nvim"
# Package management
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
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
