#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

sudo yum -y remove git
sudo yum -y remove git*


# Install Git from source, you need to have the following libraries that Git
# depends on: autotools, curl, zlib, openssl, expat, and libiconv
sudo yum install -y dh-autoreconf curl-devel expat-devel gettext-devel openssl-devel perl-devel zlib-devel
sudo yum install -y asciidoc xmlto docbook2X
sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

cd /home/vagrant
rm -f git-2.42.1.tar.gz
curl https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.42.1.tar.gz -o git-2.42.1.tar.gz


tar -zxf git-2.42.1.tar.gz
cd git-2.42.1
make configure
./configure --prefix=/usr
make all doc info
sudo make install install-doc install-html install-info

