#!/bin/bash

set -e

# Install PostgreSQL 9.5.3
sudo rpm -ivh https://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-3.noarch.rpm
sudo yum install -y postgresql95 postgresql95-server
sudo /usr/pgsql-9.5/bin/postgresql95-setup initdb

## Modify the HBA configuration
sudo cp /var/lib/pgsql/9.5/data/pg_hba.conf /var/lib/pgsql/9.5/data/pg_hba.conf.bak
sudo sed -i "s/127.0.0.1\/32\(\s\+\)ident/0.0.0.0\/0\1md5/g" /var/lib/pgsql/9.5/data/pg_hba.conf
sudo sed -i "s/\:\:1\/128\(\s\+\)ident/\:\:1\/128\1md5/g" /var/lib/pgsql/9.5/data/pg_hba.conf

sudo cp /var/lib/pgsql/9.5/data/postgresql.conf /var/lib/pgsql/9.5/data/postgresql.conf.bak
sudo sed -i "s/#listen_addresses \= 'localhost'/listen_addresses \= \'\*\'/g" /var/lib/pgsql/9.5/data/postgresql.conf

sudo systemctl restart postgresql-9.5
sudo systemctl enable postgresql-9.5
sudo systemctl status postgresql-9.5

## Create sample db and user
sudo su - postgres
sudo su - postgres -c "psql -d postgres -c \"create user ethan with password 'p@ssw0rd'\";"
sudo su - postgres -c "psql -d postgres -c \"create database sampledb\";"
sudo su - postgres -c "psql -d postgres -c \"GRANT ALL PRIVILEGES ON DATABASE sampledb to ethan;\""
