source ~/.sh/aliases.sh
source ~/.sh/plugins.sh
source ~/.sh/zsh_conf.sh
export EDITOR=nvim
pfp=~/.config/wallpapers/pngs/$(ls ~/.config/wallpapers/pngs |sort -R |tail -1)
fastfetch -l $pfp --logo-width 30 --logo-padding-left 2 --logo-padding-top 1
