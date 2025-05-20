# pedrorochaosx-config
Install packages:
```bash
echo "1/2 - Installing Flatpak";
sudo apt install -y flatpak &&
sudo apt install -y gnome-software-plugin-flatpak &&
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo;
echo "2/2 - Installing packages";
sudo apt install -y curl git zsh wget zip gnome-tweaks neovim python3-neovim transmission file-roller vlc htop audacious cheese;
```
Load Gnome settings:
```bash
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/gnome-settings.sh" | bash
```
Zsh config:
```bash
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/zsh-config.sh" | bash
```
Update .gitconfig:
```bash
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/update_git_config.sh" | bash
```
Neovim config:
```bash
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/neovim-config.sh" | bash
```
Run all the scripts:
```bash
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/install-packages.sh" | bash;
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/gnome-settings.sh" | bash;
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/zsh-config.sh" | bash;
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/update_git_config.sh" | bash
curl -sL "https://raw.githubusercontent.com/pedrorochaOSX/pedrorochaosx-config/refs/heads/main/neovim-config.sh" | bash;
```
