#!/bin/bash

# Exit script on error
set -e

# Function to uninstall Docker
uninstall_docker() {
  echo "Uninstalling Docker..."
  sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
  sudo apt-get autoremove -y --purge
  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd
  echo "Docker uninstalled successfully!"
}

# Function to uninstall Docker Compose
uninstall_docker_compose() {
  echo "Uninstalling Docker Compose..."
  sudo rm -f /usr/local/bin/docker-compose
  echo "Docker Compose uninstalled successfully!"
}

# Function to uninstall Nginx
uninstall_nginx() {
  echo "Uninstalling Nginx..."
  sudo apt-get purge -y nginx nginx-common
  sudo apt-get autoremove -y --purge
  sudo rm -rf /var/lib/nginx
  sudo rm -rf /etc/nginx
  echo "Nginx uninstalled successfully!"
}

# Function to uninstall GitHub CLI
uninstall_github_cli() {
  echo "Uninstalling GitHub CLI..."
  sudo apt-get purge -y gh
  sudo apt-get autoremove -y --purge
  sudo rm -f /usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo rm -f /etc/apt/sources.list.d/github-cli.list
  echo "GitHub CLI uninstalled successfully!"
}

# Function to uninstall Jenkins
uninstall_jenkins() {
  echo "Uninstalling Jenkins..."
  sudo apt-get purge -y jenkins
  sudo apt-get autoremove -y --purge
  sudo rm -rf /var/lib/jenkins
  sudo rm -f /usr/share/keyrings/jenkins-keyring.asc
  sudo rm -f /etc/apt/sources.list.d/jenkins.list
  echo "Jenkins uninstalled successfully!"
}

# Function to uninstall Ansible
uninstall_ansible() {
  echo "Uninstalling Ansible..."
  sudo apt-get purge -y ansible
  sudo apt-get autoremove -y --purge
  echo "Ansible uninstalled successfully!"
}
