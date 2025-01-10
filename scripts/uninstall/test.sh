#!/bin/bash

# Exit script on error
set -e

# Function to remove Docker
remove_docker() {
  echo "Removing Docker..."
  sudo apt purge -y docker-ce docker-ce-cli containerd.io
  sudo apt autoremove -y
  sudo rm -rf /var/lib/docker /etc/docker
  sudo rm -rf /var/run/docker.sock
  echo "Docker removed successfully!"
}

# Function to remove Docker Compose
remove_docker_compose() {
  echo "Removing Docker Compose..."
  sudo rm -f /usr/local/bin/docker-compose
  echo "Docker Compose removed successfully!"
}

# Function to remove Nginx
remove_nginx() {
  echo "Removing Nginx..."
  sudo apt purge -y nginx
  sudo apt autoremove -y
  sudo rm -rf /etc/nginx /var/log/nginx /var/www/html
  echo "Nginx removed successfully!"
}

# Function to remove GitHub CLI
remove_github_cli() {
  echo "Removing GitHub CLI..."
  sudo apt purge -y gh
  sudo rm -f /etc/apt/sources.list.d/github-cli.list
  sudo apt autoremove -y
  echo "GitHub CLI removed successfully!"
}

# Function to remove Jenkins
remove_jenkins() {
  echo "Removing Jenkins..."
  sudo apt purge -y jenkins
  sudo apt autoremove -y
  sudo rm -rf /var/lib/jenkins /etc/jenkins
  echo "Jenkins removed successfully!"
}

# Function to remove Ansible
remove_ansible() {
  echo "Removing Ansible..."
  sudo apt purge -y ansible
  sudo apt autoremove -y
  sudo rm -f /etc/apt/sources.list.d/ansible-*.list
  echo "Ansible removed successfully!"
}

# Display menu
while true; do
  echo "========== Removal Menu =========="
  echo "1. Docker"
  echo "2. Docker Compose"
  echo "3. Nginx"
  echo "4. GitHub CLI"
  echo "5. Jenkins"
  echo "6. Ansible"
  echo "7. Exit"
  echo "=================================="
  read -p "Please choose an option: " choice

  case $choice in
    1) remove_docker ;;
    2) remove_docker_compose ;;
    3) remove_nginx ;;
    4) remove_github_cli ;;
    5) remove_jenkins ;;
    6) remove_ansible ;;
    7) echo "Exiting..."; break ;;
    *) echo "Invalid option. Please choose again." ;;
  esac
done
