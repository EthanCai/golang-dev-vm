#!/bin/bash

set -e

mkdir downloads
curl -L -o "downloads/go1.9.linux-amd64.tar.gz" https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
