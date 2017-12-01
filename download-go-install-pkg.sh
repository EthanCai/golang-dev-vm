#!/bin/bash

set -e

mkdir -p downloads
curl -L -o "downloads/go1.8.5.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.8.5.linux-amd64.tar.gz
curl -L -o "downloads/go1.9.2.linux-amd64.tar.gz" https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz
