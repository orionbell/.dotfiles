alias ls='exa --icons --git'
alias ll='exa --long --icons -A --git --header'
alias lr='exa --long --icons -A --git --recurse --header'
alias dmenu='wofi --demnu'

alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -p'
alias df='df -h'
alias r='ranger && clear'
alias vim='nvim'
alias nv='nvim'
alias vi='nvim'
alias history='history | cut -c 8- | fzf --height=~300'
alias y='yazi'
alias cat='bat'
alias cl='calcurse'
alias tree='ls --tree level'
alias zel='zellij'

alias openu='( librewolf opal.openu.ac.il & )'
alias pico='( librewolf picoctf.org & )'
alias gye='( librewolf guardyoureyes.com & )'
alias yt='mov-cli -s youtube'


alias ytvideo='yt-dlp --embed-metadata -i'
alias ytaudio='yt-dlp -x -f bestaudio/best'

alias habits='~/Documents/Bin/Python/habiTracker/habits'

function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

alias extr='extract '

