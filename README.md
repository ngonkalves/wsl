# windows wsl 2


## configure dns servers
echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf ; \
    echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-prompt-$USER-for-sudo-password ; \
    sudo apt update ; \
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        unzip ; \
    wget --no-check-certificate  https://github.com/ngonkalves/wsl/archive/refs/heads/main.zip ; \
    sudo unzip -o main.zip ; \
    cd wsl-main ; \
    sudo chmod +x configure.sh ; \
    sudo ./configure.sh


# installing docker
sudo apt update ; \
    sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release ; \
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg ; \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ; \
    sudo apt update ; \
    sudo apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io


source: https://docs.docker.com/engine/install/debian/


## installing wsl debian distro
wsl --install -d Debian


## remove wsl debian distro
wsl --unregister Debian


## set default distro
wsl --set-default Debian


## list distros
wsl --list
wsl --list --running


## terminate/shutdown distro
wsl --terminate Debian 
wsl --shutdown


## update wsl (run as administrator)
wsl --update


## start docker service
sudo service docker start


## test docker
sudo docker run hello-world


## check all services status
sudo service --status-all