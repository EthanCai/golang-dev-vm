#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# cur_dir="$(dirname "${BASH_SOURCE[0]}")"

# Download golang
mkdir -p "/tmp/downloads"
#curl -L -o "downloads/go1.8.5.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.8.5.linux-amd64.tar.gz
#curl -L -o "downloads/go1.9.2.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz
curl -L -o "/tmp/downloads/go1.11.5.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.11.5.linux-amd64.tar.gz


# Install Go
echo "======Begin install golang======"
tar zxf /tmp/downloads/go*.*.*.linux-amd64.tar.gz -C /usr/local
mkdir -p /home/vagrant/go
cat <<END > /etc/profile.d/golang.sh
export GOROOT=/usr/local/go
export PATH=\$GOROOT/bin:\$PATH
export GOPATH=/home/vagrant/go/
export PATH=\$GOPATH/bin:\$PATH
END
chmod 755 /etc/profile.d/golang.sh
echo "======Finish install golang======"
echo "please execute command:  source /etc/profile.d/golang.sh"
