# Stuff to install for linux se
# typeset -g POWERLEVEL9K_TIME_BACKGROUND=160
# typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=7
# typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=55

# TODO: add movement of .zshhrc and .p10k.zsh into home from repo
mv setup_stuuff/.zshrc .zshrc
mv setup_stuff.p10k.zsh .p10k.zsh 
mv setup_stuff/.envrc .envrc
direnv allow .envrc
source "$HOME"/.p10k.zsh 

# git clone --depth=1 https://github.com/romkatv/nerd-fonts.git
mkdir .fonts
cp "$HOME"/setup-stuff/Meslo*.ttf "$HOME"/.fonts
sudo fc-cache -vf ~/.local/share/fonts


# LSD Install
curl -s https://api.github.com/repos/Peltoche/lsd/releases/latest | grep -E 'browser_download_url' | grep linux_amd64 | cut -d '"' -f 4 | wget -qi -
sudo dpkg -i lsd_0.21.0_amd64.deb

# LS_COLORS Install
git clone https://github.com/trapd00r/LS_COLORS.git

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
cd "$HOME"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd src/gogh/themes

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

