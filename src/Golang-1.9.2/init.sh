#!/bin/bash

# Set timezone
sudo timedatectl list-timezones | grep Asia/Shanghai
sudo timedatectl set-timezone Asia/Shanghai

# install required packages & softwares
sudo yum install -y epel-release
sudo yum update -y
sudo yum groupinstall -y "Development Tools"
sudo yum install -y wget vim net-tools telnet

# Disable Firewall
sudo systemctl status firewalld
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Install Go
sudo echo "======Begin install golang======"
sudo tar zxf /downloads/go1.9.2.linux-amd64.tar.gz -C /usr/local
sudo mkdir -p /home/vagrant/go
sudo bash -c 'cat <<END > /etc/profile.d/golang.sh
export GOROOT=/usr/local/go
export PATH=\$GOROOT/bin:\$PATH
export GOPATH=/home/vagrant/go/
export PATH=\$GOPATH/bin:\$PATH
END'
sudo chmod 755 /etc/profile.d/golang.sh
source /etc/profile.d/golang.sh
sudo echo "======Finish install golang======"
