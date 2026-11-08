#!/bin/bash

set -e

echo "Starting project environment setup..."

sudo apt-get update

echo "Installing basic tools..."
sudo apt-get install -y \
  curl \
  wget \
  gnupg \
  git \
  unzip \
  ca-certificates \
  lsb-release

echo "Installing Terraform..."

wget -O- https://apt.releases.hashicorp.com/gpg \
  | sudo gpg --dearmor \
  -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(. /etc/os-release && ech
  | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update
sudo apt-get install -y terraform

echo "Installing Azure CLI..."

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "Installing GitHub CLI..."

sudo apt-get install -y gh

echo "Checking installations..."

terraform version
az version
git --version
gh --version

echo "All tools installed successfully!"
