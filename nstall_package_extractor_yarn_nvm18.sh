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

# Install Node.js 18.19.0 using NVM
nvm install 18.19.0

# Set Node.js 18.19.0 as the default version
nvm alias default 18.19.0
nvm use default

# Install development tools
apt install -y gcc g++ make

# Install Yarn
apt install -y gnupg2
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update
apt install -y yarn

# Install Java (OpenJDK 11)
apt install -y openjdk-11-jdk

# Set Java 11 as the default version
update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java
update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac

# Check Node.js, npm, Yarn, and Java versions
echo "Node.js version:"
node -v
echo "npm version:"
npm -v
echo "Yarn version:"
yarn -v
echo "Java version:"
java -version

# Install Node.js packages using Yarn
packages=(
  "body-parser@1.20.2"
  "dayjs@1.11.10"
  "express@4.18.2"
  "fs@0.0.1-security"
  "https@1.0.0"
  "lodash@4.17.21"
  "moment-timezone@0.5.43"
  "moment@2.30.1"
  "mongodb@6.3.0"
  "mysql@2.18.1"
  "nodemon@3.0.2"
  "path@0.12.7"
  "pdf-lib@1.17.1"
  "pdf-page-counter@1.0.3"
  "pg@8.11.3"
  "shelljs@0.8.5"
  "url@0.11.3"
)

for package in "${packages[@]}"
do
  yarn add $package
done

# Check installed Node.js packages
echo "Installed Node.js packages:"
yarn list --depth=0
