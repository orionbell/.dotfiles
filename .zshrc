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
alias tree='ls --tree level'
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
fastfetch -l $pfp --logo-width 30 --logo-padding-left 2 --logo-padding-top 1
days_left1=$(echo $(date -d "2024-09-23" +%s) $(date +%s) | awk '{print int((($1 - $2) / 86400) + 1)}')
echo "$days_left1 days left until database managment and design exam !"
days_left=$(echo $(date -d "2024-10-08" +%s) $(date +%s) | awk '{print int((($1 - $2) / 86400) + 1)}')
echo "$days_left days left until computer architecture and design exam !"
[ -f ~/.fzf.bash ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"



# ------------------------------------------------------------------------------------------------------------------------------------------------------------------#


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-.]=** r:|=**'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=5
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/tom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# Key bindings
# Print current key bindings: bindkey
# List available key bindings: bindkey -l
# Interactively show pressed key when pressing any keys
bindkey "^[[H" beginning-of-line # HOME
bindkey "^[[F" end-of-line # END
bindkey "^[[3~" delete-char # DEL
bindkey "^[[3;5~" delete-word # CTRL+DEL - delete a whole word after cursor
bindkey "^H" backward-delete-word # CTRL+BACKSPACE - delete a whole word before cursor
bindkey "^[[1;5C" forward-word # CTRL+ARROW_RIGHT - move cursor forward one word
bindkey "^[[1;5D" backward-word # CTRL+ARROW_LEFT - move cursor backward one word
bindkey "^Z" undo # CTRL+Z
bindkey "^Y" redo # CTRL+Y

# Env Exports
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-match_002dwords_002dby_002dstyle
# Define how to match "words"; default mode is "normal" (alphanumerical + WORDCHARS)
# Default WORDCHARS are *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
# Set the default editor for sudoedit or sudo -e
export VISUAL=nano
export EDITOR="$VISUAL"

# https://github.com/mgunyho/tere
tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

# If the internal history needs to be trimmed to add the current command line, setting this
# option will cause the oldest history event that has a duplicate to be lost before losing a
# unique event from the list. You should be sure to set the value of HISTSIZE to a larger
# number than SAVEHIST in order to give you some room for the duplicated events, otherwise
# this option will behave just like HIST_IGNORE_ALL_DUPS once the history fills up with unique
# events.
setopt HIST_EXPIRE_DUPS_FIRST
# When searching for history entries in the line editor, do not display duplicates of a line
# previously found, even if the duplicates are not contiguous.
setopt HIST_FIND_NO_DUPS
# If a new command line being added to the history list duplicates an older one, the older
# command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS
# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS
# Remove command lines from the history list when the first character on the line is a space,
# or when one of the expanded aliases contains a leading space. Only normal aliases (not
# global or suffix aliases) have this behaviour. Note that the command lingers in the internal
# history until the next command is entered before it vanishes, allowing you to briefly reuse
# or edit the line. If you want to make it vanish right away without entering another command,
# type a space and press return.
setopt HIST_IGNORE_SPACE
# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS
# This option works like APPEND_HISTORY except that new history lines are added to the $HISTFILE
# incrementally (as soon as they are entered), rather than waiting until the shell exits.
setopt INC_APPEND_HISTORY

# CTRL+ARROW_RIGHT   - partially accept suggestion up to the point that the cursor moves to
# ARROW_RIGHT or END - accept suggestion and replace contents of the command line buffer with the suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# CTRL+T - paste the selected files and directories onto the command-line
# CTRL+R - paste the selected command from history onto the command-line
# ALT+C  - cd into the selected directory
source /usr/share/fzf/key-bindings.zsh
# Type ** and hit tab (eg. with the cd command; works with directories, files, process IDs, hostnames, environment variables)
source /usr/share/fzf/completion.zsh

# Sift through history for previous commands matching everything up to current cursor position.
# Moves the cursor to the end of line after each match.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # ARROW_UP
bindkey "^[[B" down-line-or-beginning-search # ARROW_DOWN
# -> This only works for prefixes. If you want to match any substring in the history
#    then https://github.com/zsh-users/zsh-history-substring-search might be interesting

# Must go last (see https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$HOME/.local/bin:$PATH
