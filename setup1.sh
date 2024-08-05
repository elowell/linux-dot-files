# Stuff to install for linux setup:
# Most packages
cd "$HOME"
sudo apt-get update
sudo apt-get install git libssl-dev libffi-dev libsqlite3-dev libbz2-dev cmake liblzma-dev libreadline-dev
sudo apt-get install gnome-shell chrome-gnome-shell xclip ca-certificates curl gnupg lsb-release direnv
sudo apt-get update
sudo apt install nodejs npm
sudo apt install git-lfs
git-lfs install

# Docker Install 
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io
# sudo groupadd docker

## docker installlllllllll
# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# sudo usermod -aG docker $USER
# newgrp docker 
# docker run hello-world

# Docker Compose Install
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# System Monitor Extension install
sudo apt-get -y install gnome-shell-extension-system-monitor
killall -SIGQUIT gnome-shell  # restarts gnome

# Zsh, OhMyZsh, & P10k Install
sudo apt install zsh
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# typeset -g POWERLEVEL9K_TIME_BACKGROUND=160
# typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=7
# typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=55

# TODO: add movement of .zshhrc and .p10k.zsh into home from repo
cp setup-stuff/.zshrc .zshrc
cp setup-stuff/.p10k.zsh .p10k.zsh 
cp setup-stuff/.envrc .envrc
direnv allow .envrc
source "$HOME"/.p10k.zsh 

# git clone --depth=1 https://github.com/romkatv/nerd-fonts.git
mkdir .fonts
sudo cp "$HOME"/setup-stuff/fonts/Meslo*.ttf "$HOME"/.fonts
sudo fc-cache -vf ~/.local/share/fonts


# LSD Install
# curl -s https://api.github.com/repos/Peltoche/lsd/releases/latest | grep -E 'browser_download_url' | grep linux_amd64 | cut -d '"' -f 4 | wget -qi -
# sudo dpkg -i lsd__amd64.deb

# Pyenv Install
curl https://pyenv.run | bash
exec "$SHELL"
pyenv install 3.9.7
pyenv install 3.7.10
exec "$SHELL"
pip install --upgrade pip
pip install Ipython pre-commit pylint

# AWS Setup
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Terminal ctrl+tab shortcuts in Gnome
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'

# clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd src/gogh/installs

# necessary on ubuntu
export TERMINAL=gnome-terminal

# install themes
./atom.sh
./dehydration.sh
./dracula.sh
./gooey.sh
./google-dark.sh
./palenight.sh
./snazzy.sh
./wombat.sh

mkdir "$HOME/.local/extensions"
cp -r "$HOME/setup-stuff/extensions/" "$HOME/.local/extensions"
killall -3 gnome-shell

