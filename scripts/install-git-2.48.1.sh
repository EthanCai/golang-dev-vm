#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

sudo dnf -y remove git
sudo dnf -y remove git*


# Install Git from source, you need to have the following libraries that Git
# depends on: autotools, curl, zlib, openssl, expat, and libiconv
sudo dnf update -y
sudo dnf install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel gcc autoconf libcurl-devel expat-devel


cd /home/vagrant
rm -f git-2.48.1.tar.gz
curl https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.48.1.tar.gz -o git-2.48.1.tar.gz


tar -zxf git-2.48.1.tar.gz
cd git-2.48.1
make prefix=/usr/local all
sudo make prefix=/usr/local install

