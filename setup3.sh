# clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh

cd src/gogh

# necessary on ubuntu
export TERMINAL=gnome-terminal

cd installs

# install themes
./atom.sh
./dehydration.sh
./dracula.sh
./gooey.sh
./nord.sh
./google-dark.sh
./palenight.sh
./snazzy.sh
./wombat.sh

# bash -c "$(wget -qO- https://git.io/vQgMr)"
# 11 171 272 55 59 90 182 222

