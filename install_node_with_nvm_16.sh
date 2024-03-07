#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or using sudo."
  exit 1
fi

# Update package lists
apt update

# Install essential packages
apt install -y curl build-essential

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Reload bash to start using NVM
source ~/.bashrc

# Install Node.js 16 using NVM
nvm install 16.14.2

# Set Node.js 16.14.2 as the default version
nvm alias default 16.14.2
nvm use default

# Install development tools
apt install -y gcc g++ make

# Install Yarn
apt install -y gnupg2
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update
apt install -y yarn

# Check Node.js, npm, and Yarn versions
echo "Node.js version:"
node -v
echo "npm version:"
npm -v
echo "Yarn version:"
yarn -v

echo "Node.js 16.14.2, npm, Yarn, and development tools installation completed successfully."
