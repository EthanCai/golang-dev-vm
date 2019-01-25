#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# install nginx
yum install nginx
systemctl enable nginx
systemctl start nginx
