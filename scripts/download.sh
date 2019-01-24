#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# cur_dir="$(dirname "${BASH_SOURCE[0]}")"

mkdir -p "/tmp/downloads"
#curl -L -o "downloads/go1.8.5.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.8.5.linux-amd64.tar.gz
#curl -L -o "downloads/go1.9.2.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz
curl -L -o "/tmp/downloads/go1.11.5.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.11.5.linux-amd64.tar.gz
