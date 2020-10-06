#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"

cd "${HOME}"

echo "CLOING: YAY"
git clone "https://aur.archlinux.org/yay.git"


PKGS=(
ac-fonts
ac-grid-icon-theme
ac-grub2-theme-slaze
ac-grub2-theme-stylish
ac-grub2-theme-tela
ac-grub2-theme-vimix
ac-gtk-themepack
ac-hybrid-icon-theme
ac-lxdm-theme
ac-lxdm-theme-circuit
ac-lxdm-theme-gears
ac-pixmaps
ac-wallpapers
betterlockscreen
cava
colorpicker
compton-tryone-git
downgrade
grub-silent
ksuperkey
networkmanager-dmenu-git
obmenu-generator
perl-linux-desktopfiles
plymouth
polybar
pygtk
pyroom
rofi-git
toilet
tty-clock
unimatrix-git
authy
b43-firmware-classic
backintime
backintime-cli
bash-zsh-insulter
betterdiscord-git
calcurse-git
dmenu-git
docbook-to-man
find-the-command
font-manager
google-chrome
gtk3-classic
hfsprogs
lzfse
micro
nerd-fonts-fira-code
nerd-fonts-inconsolata
papirus-icon-theme-git
pfetch-git
plymouth-theme-colorful-loop-git
polybar-fcitx-scripts
python-colored
python2-twodict-git
rxvt-unicode-cvs-patched-wideglyphs
skippy-xd-git
skypeforlinux-stable-bin
ttf-material-design-icons-git
urxvt-clipboard
urxvt-resize-font-git
vizex
wallpaper-reddit-git
youtube-dl-gui-git
)
cd ${HOME}/yay
makepkg -si

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

echo -e "\nDone!\n"
