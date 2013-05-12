# Set the prompt to include the hostname and directory
export PS1="\h: \W\$ "

# Colorize ls output and use human-readable file sizes
alias ls='ls -Gh'

# Colorize grep output
alias grep='grep --color'

# Git shortcuts
alias gs='git status'
alias gl='git log --oneline'

# If a .bashrc.local exists, source it. This should include bash configuration
# specific to the current machine.
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
