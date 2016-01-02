# Use vi mode in bash, remap 'jk' to switch to vi normal mode, and use Ctrl-L to
# clear the screen in both normal and insert modes
bind -m vi-insert '"jk" "\e"'
bind -m vi-insert "\C-l":clear-screen
bind -m vi-move "\C-l":clear-screen
set -o vi

# Set the prompt to include the hostname and directory
export PS1="\h: \W\$ "

# For OSX, colorize ls output and use human-readable file sizes
[[ "$OSTYPE" = darwin* ]] && alias ls='ls -Gh'

# For Ubuntu, colorize ls output and use human-readable file sizes
[[ "$OSTYPE" = linux* ]] && alias ls='ls --color -h'

# Colorize grep output
alias grep='grep --color'

# Git shortcuts
alias gs='git status'
alias gl='git log --oneline -10'

# For OSX, create a command line shortcut for Sublime Text 3
[[ "$OSTYPE" = darwin* ]] && alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# If a .bashrc.local exists, source it. This should include bash configuration
# specific to the current machine.
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
