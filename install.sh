#!/bin/bash

# Exit script on error
set -e

# Source the installation script
source ./scripts/install/script.sh
source ./scripts/install/install.docker.sh

# Function to display the menu
display_menu() {
  echo "========== Installation Menu =========="
  echo "1. Docker"
  echo "2. Docker Compose"
  echo "3. Nginx"
  echo "4. GitHub CLI"
  echo "5. Jenkins"
  echo "6. Ansible"
  echo "7. Exit"
  echo "======================================="
}

# Infinite loop for menu handling
while true; do
  display_menu
  read -p "Please choose an option: " choice

  case $choice in
    1) check_docker ;;
    2) install_docker_compose ;;
    3) install_nginx ;;
    4) install_github_cli ;;
    5) install_jenkins ;;
    6) install_ansible ;;
    7) echo "Exiting..."; break ;;
    *)
      echo "Invalid option. Please choose again."
      continue
      ;;
  esac
done
