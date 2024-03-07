#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or using sudo."
  exit 1
fi

# List of npm packages to install
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

# Install npm packages
for package in "${packages[@]}"; do
  npm install "$package"
done

echo "NPM packages installation completed successfully."
