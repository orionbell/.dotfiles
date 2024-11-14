#PS1="\n\`if [ \$? = 0 ]; then echo \[\e[36m\]   \[\e[m\]; else echo \[\e[31m\] \[\e[0m\]; fi\` \[\e[38;5;27;1m\][\[\e[38;5;33m\] \u\[\e[38;5;27m\]]-[\[\e[38;5;33m\]  \h\[\e[38;5;27m\]]-[\[\e[38;5;33m\]  \@\[\e[38;5;27m\]]\[\e[0m\] \[\e[38;5;51;1m\] \w\n\[\e[38;5;27;1m\] 󱞪\[\e[0m\] "
[ -f ~/.fzf.bash ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"


