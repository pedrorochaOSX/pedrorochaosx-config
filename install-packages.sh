echo "1/2 - Installing Flatpak";
sudo apt install -y flatpak &&
sudo apt install -y gnome-software-plugin-flatpak &&
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo;
echo "2/2 - Installing packages";
sudo apt install -y git zsh wget gnome-tweaks neovim python3-neovim transmission file-roller vlc htop audacious cheese;
