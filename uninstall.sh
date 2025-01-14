#!/bin/bash

# Exit script on error
set -e

# Source the uninstallation script
source ./scripts/uninstall/script.sh

# Function to display the menu
display_menu() {
  echo "========== Uninstallation Menu =========="
  echo "1. Docker"
  echo "2. Docker Compose"
  echo "3. Nginx"
  echo "4. GitHub CLI"
  echo "5. Jenkins"
  echo "6. Ansible"
  echo "7. Exit"
  echo "========================================="
}

# Infinite loop for menu handling
while true; do
  display_menu
  read -p "Please choose an option: " choice

  case $choice in
    1) uninstall_docker ;;
    2) uninstall_docker_compose ;;
    3) uninstall_nginx ;;
    4) uninstall_github_cli ;;
    5) uninstall_jenkins ;;
    6) uninstall_ansible ;;
    7) echo "Exiting..."; break ;;
    *)
      echo "Invalid option. Please choose again."
      continue
      ;;
  esac
done
