#!/bin/bash

cat /etc/redhat-release

# Set timezone
sudo timedatectl list-timezones | grep Asia/Shanghai
sudo timedatectl set-timezone Asia/Shanghai

# Disable Firewall
sudo systemctl status firewalld
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# update yum sources
sudo mkdir /etc/yum.repos.d/backup

sudo mv /etc/yum.repos.d/CentOS* /etc/yum.repos.d/backup/
sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo

sudo cp /etc/yum.repos.d/epel* /etc/yum.repos.d/backup/
sudo sed -i 's|^baseurl=https://download.example/pub|baseurl=https://mirrors.aliyun.com|' /etc/yum.repos.d/epel*
sudo sed -i 's|^metalink|#metalink|' /etc/yum.repos.d/epel*

sudo yum clean all
sudo yum makecache
sudo yum repolist


# install required packages & softwares
sudo yum groupinstall -y "Development Tools"
sudo yum install -y wget vim net-tools telnet
