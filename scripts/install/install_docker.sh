#!/bin/bash

# Exit script on error
set -e

# Function to check if Docker is installed
check_docker() {
  if command -v docker &> /dev/null; then
    echo "Docker is already installed on your system."
    echo "What would you like to do?"
    echo "1. Cancel"
    echo "2. Reinstall Docker"
    echo "3. Update Docker"
    read -p "Enter your choice (1/2/3): " choice

    case $choice in
      1)
        echo "Canceling the operation. Exiting."
        exit 0
        ;;
      2)
        echo "Reinstalling Docker..."
        uninstall_docker
        install_docker
        ;;
      3)
        echo "Updating Docker..."
        update_docker
        ;;
      *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
    esac
  else
    echo "Docker is not installed. Proceeding with installation..."
    install_docker
  fi
}

# Function to install Docker
install_docker() {
  echo "Installing Docker..."
  sudo apt update -y
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update -y
  sudo apt install -y docker-ce docker-ce-cli containerd.io
  sudo systemctl start docker
  sudo systemctl enable docker
  docker --version
  echo "Docker installed successfully!"
}

# Function to update Docker
update_docker() {
  echo "Updating Docker..."
  sudo apt update -y
  sudo apt upgrade -y docker-ce docker-ce-cli containerd.io
  docker --version
  echo "Docker updated successfully!"
}

# Function to uninstall Docker
uninstall_docker() {
  echo "Uninstalling Docker..."
  sudo apt remove --purge -y docker-ce docker-ce-cli containerd.io
  sudo apt autoremove -y
  sudo apt autoclean
  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd
  sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg
  sudo rm -f /etc/apt/sources.list.d/docker.list
  echo "Docker uninstalled successfully!"
}

# Main script execution
check_docker
