#!/bin/bash

# Set timezone
sudo timedatectl list-timezones | grep Asia/Shanghai
sudo timedatectl set-timezone Asia/Shanghai

# Disable Firewall
sudo systemctl status firewalld
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# install required packages & softwares
sudo yum install -y epel-release
sudo yum groupinstall -y "Development Tools"
sudo yum install -y wget vim net-tools telnet

sudo yum update -y
