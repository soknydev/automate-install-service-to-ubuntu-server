#!/bin/bash

# Exit script on error
set -e

# Function to check if Docker Compose is installed
check_docker_compose() {
  if command -v docker-compose &> /dev/null; then
    echo "Docker Compose is already installed on your system."
    echo "What would you like to do?"
    echo "1. Cancel"
    echo "2. Reinstall Docker Compose"
    echo "3. Update Docker Compose"
    read -p "Enter your choice (1/2/3): " choice

    case $choice in
      1)
        echo "Canceling the operation. Exiting."
        exit 0
        ;;
      2)
        echo "Reinstalling Docker Compose..."
        uninstall_docker_compose
        install_docker_compose
        ;;
      3)
        echo "Updating Docker Compose..."
        update_docker_compose
        ;;
      *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
    esac
  else
    echo "Docker Compose is not installed. Proceeding with installation..."
    install_docker_compose
  fi
}

# Function to install Docker Compose
install_docker_compose() {
  echo "Installing Docker Compose..."
  local DOCKER_COMPOSE_VERSION
  DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
  sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  echo "Docker Compose installed successfully!"
}

# Function to update Docker Compose
update_docker_compose() {
  echo "Updating Docker Compose..."
  local DOCKER_COMPOSE_VERSION
  DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
  sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  echo "Docker Compose updated successfully!"
}

# Function to uninstall Docker Compose
uninstall_docker_compose() {
  echo "Uninstalling Docker Compose..."
  sudo rm -f /usr/local/bin/docker-compose
  echo "Docker Compose uninstalled successfully!"
}

# Main script execution
check_docker_compose
