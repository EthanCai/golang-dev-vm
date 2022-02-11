#!/bin/bash

set -euo pipefail
IFS=$'\n\t'


cd /tmp
wget https://nodejs.org/download/release/v10.15.0/node-v10.15.0-linux-x64.tar.gz
mkdir -p /usr/local/node
tar -xzvf node-v10.11.0-linux-x64.tar.gz -C /usr/local/

# 编辑/etc/profile添加下面内容
export NODE_HOME=/usr/local/node
export PATH=$NODE_HOME/bin:/usr/local/bin:$PATH

# 验证
node --version
