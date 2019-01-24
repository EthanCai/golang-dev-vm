#!/bin/bash

set -e

# Install Go
sudo echo "======Begin install golang======"
sudo tar zxf /vargrant_data/downloads/go*.*.*.linux-amd64.tar.gz -C /usr/local
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
