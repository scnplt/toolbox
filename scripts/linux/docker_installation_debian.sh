#!/bin/bash

# Defaults
add_docker_group=true
install_portainer=false

read -p "Do you want to add $USER to the docker group after installation? (Y/n): " user_input
if [[ "$user_input" =~ ^[Nn]$ ]]; then
        add_docker_group=false
fi

read -p "Do you want to run portainer after installation? (y/N): " user_input
if [[ "$user_input" =~ ^[Yy]$ ]]; then
        install_portainer=true
fi

# Update & Upgrade
sudo apt update -y && sudo apt upgrade -y

# Uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt remove $pkg; done

# Add Docker's official GPG key
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y

# Install the Docker packages
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# After installation
if $install_portainer; then
        sudo docker volume create portainer_data
        sudo docker run -d \
                --name portainer \
                -p 9443:9443 \
                --restart always \
                -v /var/run/docker.sock:/var/run/docker.sock \
                -v portainer_data:/data \
                portainer/portainer-ce:2.21.4
        echo "> Portainer: https://localhost:9443"
fi

if $add_docker_group; then
        echo "> Adding $USER to docker group"
        sudo usermod -aG docker $USER
        echo "> Please log out and log back in for group changes to take effect."
        echo "> Alternatively, you can run 'newgrp docker' in a new terminal session."
fi