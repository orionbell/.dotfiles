

# installed packages (with pacman)
sudo pacman -Sy --needed git base-devel fastfetch neovim swww hyprpaper hypridle hyprlock yazi openssh bat eza zoxide btop fzf stow devtools gcc rust nodejs python3 cronie plymouth mpv ripgrep  bluez bluez-utils blanket entr ttf-firacode-nerd zsh zsh-completions zsh-autosuggestions fzf zsh-syntax-highlighting tere man-db tldr starship
sudo pacman -Sy --needed keepassxc syncthing obsidian
# yay setup
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# installed packages (with yay)
yay -Sy aylurs-gtk-shell brillo ani-cli librewolf bibata-cursor-theme 
# Gnome customization
# yay -Sy gnome-shell-extension-dash-to-dock gnome-shell-extension-blur-my-shell gnome-shell-extension-vitals  whitesur-icon-theme whitesur-gtk-theme gnome-shell-extension-appindicator bibata-cursor-theme

# services
sudo systemctl enable cronie.service --now

# Cursor theme link
# https://www.gnome-look.org/p/1914825
# for more themes look at the /usr/share/icons
hyprctl setcursor Bibata-Modern-Classic 20
