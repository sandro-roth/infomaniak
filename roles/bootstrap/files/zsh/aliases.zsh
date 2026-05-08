# navigation
alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias back='cd "$OLDPWD"'
alias c='clear'
alias cd..='cd ..'

# editor
alias e='vim -O'
alias E='vim -o'
alias svim='sudo vim'

# history / jobs
alias h='history 1'
alias history='history 1'
alias j='jobs -l'

# network / misc
alias extip='curl -fsSL icanhazip.com'
alias weather='curl -fsSL wttr.in'
alias wget='wget -c'
alias ssha='eval "$(ssh-agent -s)" && ssh-add'
alias tn='tmux new -s'

# file operations
alias mkdir='mkdir -pv'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rmdir='rmdir -v'

# process helpers
alias mem5='ps aux | sort -nr -k 4 | head -5'
alias mem10='ps aux | sort -nr -k 4 | head -10'
alias cpu5='ps aux | sort -nr -k 3 | head -5'
alias cpu10='ps aux | sort -nr -k 3 | head -10'

# largest directories
alias dir5='du -cksh ./* 2>/dev/null | sort -hr | head -n 5'
alias dir10='du -cksh ./* 2>/dev/null | sort -hr | head -n 10'

# diff
if command -v colordiff > /dev/null 2>&1; then
  alias diff='colordiff -Nuar'
else
  alias diff='diff -Nuar'
fi

# grep color if supported
if grep --color=auto "" /dev/null >/dev/null 2>&1; then
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
fi

# ls variants, Linux vs macOS
if [ "$(uname)" = "Darwin" ]; then
  alias ls='ls -lhFG'
  alias l.='ls -lhFaG'
else
  alias ls='ls -lhF --color=auto --time-style=long-iso --classify'
  alias l.='ls -lhFa --color=auto --time-style=long-iso'
fi

alias ll='ls'

# df
if [ "$(uname)" = "Linux" ]; then
  alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
else
  alias df='df -h'
fi

# ports
if [ "$(uname)" = "Linux" ]; then
  alias ports='netstat -tulanp'
else
  alias ports='netstat -anv | grep LISTEN'
fi

# lsmount
alias lsmount='mount | column -t'

# speedtest
if command -v python3 >/dev/null 2>&1; then
  alias speedtest='curl -fsSL https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
elif command -v python >/dev/null 2>&1; then
  alias speedtest='curl -fsSL https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
fi

# watch if available
if command -v watch >/dev/null 2>&1; then
  alias watch='watch -d'
fi

# safety nets
if rm --help 2>/dev/null | grep -q -- '--preserve-root'; then
  alias rm='rm -I --preserve-root'
  alias chown='chown --preserve-root'
  alias chmod='chmod --preserve-root'
  alias chgrp='chgrp --preserve-root'
else
  alias rm='rm -I'
fi

# package management
if [ -x /usr/bin/apt ]; then
  alias update='sudo apt update'
  alias upgrade='sudo apt update && sudo apt dist-upgrade && sudo apt autoremove && sudo apt clean'
  alias install='sudo apt install'
fi

if [ -x /usr/bin/pacman ]; then
  alias update='sudo pacman -Syyy'
  alias upgrade='sudo pacman -Syu'
  alias install='sudo pacman -S'
fi

if command -v brew >/dev/null 2>&1; then
  alias update='brew update'
  alias upgrade='brew upgrade && brew cleanup'
  alias install='brew install'
fi