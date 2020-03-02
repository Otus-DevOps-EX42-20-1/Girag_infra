#!/bin/bash
set -e

# Install MongoDB
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com D68FA50FEA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt update
apt install -y mongodb-org
systemctl enable mongod
