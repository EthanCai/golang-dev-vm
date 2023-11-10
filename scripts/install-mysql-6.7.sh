#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# 参考：
#   - 安装MySQL 6.7 GA，参考 https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/
#   - 修改默认的数据目录，参考 https://blog.csdn.net/liuchunming033/article/details/51851667


# 首先安装MySQL
cd /tmp
wget https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
sudo rpm -Uvh mysql80-community-release-el7-1.noarch.rpm

sudo yum-config-manager --disable mysql80-community && sudo yum-config-manager --enable mysql57-community
yum repolist enabled | grep mysql

sudo yum install -y mysql-community-server
sudo yum systemctl start mysqld


# 修改默认数据目录，修改MySQL charset 和 collation
sudo systemctl stop mysqld
sudo cp -rp /var/lib/mysql /data/
sudo ln -s /data/mysql/mysql.sock /var/lib/mysql/mysql.sock

sudo cp /etc/my.cnf /my.cnf.bak
sudo cat > /etc/my.cnf <<EOF
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html
[client]
default-character-set=utf8mb4

[mysql]
default-character-set=utf8mb4

[mysqld]
collation-server = utf8mb4_unicode_ci
init_connect='SET collation_connection = utf8mb4_unicode_ci;'
init-connect='SET NAMES utf8mb4'
character-set-server = utf8mb4

datadir=/data/mysql
socket=/data/mysql/mysql.sock

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
EOF

sudo systemctl start mysqld

# 最后按照下面的操作修改root账户密码
cat <<EOF
sudo grep 'temporary password' /var/log/mysqld.log

mysql -uroot -p
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY '{New_Root_Password}';
mysql> flush privileges;
EOF
