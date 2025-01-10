#!/bin/bash

# Exit script on error
set -e

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
  echo "Docker installed successfully!"
}

# Function to install Docker Compose
install_docker_compose() {
  echo "Installing Docker Compose..."
  local DOCKER_COMPOSE_VERSION
  DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
  sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "Docker Compose installed successfully!"
}

# Function to install Nginx
install_nginx() {
  echo "Installing Nginx..."
  sudo apt update -y
  sudo apt install -y nginx
  sudo systemctl start nginx
  sudo systemctl enable nginx
  echo "Nginx installed successfully!"
}

# Function to install GitHub CLI
install_github_cli() {
  echo "Installing GitHub CLI..."
  sudo apt update -y
  sudo apt install -y curl
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update -y
  sudo apt install -y gh
  echo "GitHub CLI installed successfully!"
}

# Function to install Jenkins
install_jenkins() {
  echo "Installing Jenkins..."
  sudo apt update -y
  sudo apt install -y openjdk-17-jdk
  curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt update -y
  sudo apt install -y jenkins
  sudo systemctl start jenkins
  sudo systemctl enable jenkins
  echo "Jenkins installed successfully!"
}

# Function to install Ansible
install_ansible() {
  echo "Installing Ansible..."
  sudo apt update -y
  sudo apt install -y software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install -y ansible
  echo "Ansible installed successfully!"
}
