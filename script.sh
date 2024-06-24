#!/bin/bash

# Update package lists
sudo apt-get update -y

# Install required packages
sudo apt-get install -y build-essential curl file git

# Install Homebrew
yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Configure Homebrew environment
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.profile

# Install Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install -y docker-ce

# Add current user to the docker group
sudo usermod -aG docker ${USER}

# Install UDS, Zarf K3d, and Kubectl using Homebrew
brew install defenseunicorns/tap/uds
brew tap defenseunicorns/tap && brew install zarf
brew install k3d
brew install kubectl

# Deploy UDS Core
uds deploy k3d-core-demo:0.22.2 --confirm
