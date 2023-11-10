#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# cur_dir="$(dirname "${BASH_SOURCE[0]}")"

# Download golang
echo "======Begin download golang======"
mkdir -p "/tmp/downloads"
[[ -f "/tmp/downloads/go1.11.5.linux-amd64.tar.gz" ]] || curl -L -o "/tmp/downloads/go1.11.5.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.11.5.linux-amd64.tar.gz
echo "======Finish download golang======"

# Install golang
echo "======Begin install golang======"
sudo tar zxf /tmp/downloads/go*.*.*.linux-amd64.tar.gz -C /usr/local
sudo mkdir -p /home/vagrant/go
cat <<END > /home/vagrant/golang.sh
export GOROOT=/usr/local/go
export PATH=\$GOROOT/bin:\$PATH
export GOPATH=/home/vagrant/go/
export PATH=\$GOPATH/bin:\$PATH
END
sudo mv /home/vagrant/golang.sh /etc/profile.d/golang.sh
sudo chmod 755 /etc/profile.d/golang.sh
echo "======Finish install golang======"

echo "please execute command:  source /etc/profile.d/golang.sh"
