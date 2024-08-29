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
export EDITOR=nvim

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
pfp=~/.config/wallpapers/pngs/$(ls ~/.config/wallpapers/pngs |sort -R |tail -1)
# PS1="\n\`if [ \$? = 0 ]; then echo \[\e[36m\]   \[\e[m\]; else echo \[\e[31m\] \[\e[0m\]; fi\` \[\e[38;5;27;1m\][\[\e[38;5;33m\] \u\[\e[38;5;27m\]]-[\[\e[38;5;33m\]  \h\[\e[38;5;27m\]]-[\[\e[38;5;33m\]  \@\[\e[38;5;27m\]]\[\e[0m\] \[\e[38;5;51;1m\] \w\n\[\e[38;5;27;1m\] 󱞪\[\e[0m\] "
fastfetch -l $pfp --logo-width 25

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(zoxide init --cmd cd bash)"
eval "$(starship init bash)"
