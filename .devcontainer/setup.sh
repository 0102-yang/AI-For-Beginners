export DEBIAN_FRONTEND=noninteractive

sudo cp .devcontainer/sources.list /etc/apt/sources.list
sudo cp .devcontainer/.condarc ~/.condarc

# Install nodejs
if [ -f "/usr/local/share/nvm/nvm.sh" ]; then
    . /usr/local/share/nvm/nvm.sh && nvm install lts/* 2>&1
else
    echo "Please install nvm"
fi

sudo apt-get update -y
sudo apt-get -y install libgl1 --no-install-recommends

pip config --global set global.index-url https://mirrors.aliyun.com/pypi/simple
sudo echo "export CONDARC=~/.condarc" >> ~/.bashrc
sudo source ~/.bashrc
conda update conda -y
conda env create -f .devcontainer/environment.yml -vv
