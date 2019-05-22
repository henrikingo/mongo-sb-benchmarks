#!/bin/bash

# Install pre-requisites to execute scripts in this repo.
# This file for AMZN2 and Centos7.
# Note that this doesn't install MongoDB server, as it is expected to run on a separate host (in my world)

sudo yum -y groupinstall "Development tools"

# sysbench repo
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | sudo bash

# EPEL repo (luarocks)
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install sysbench lua lua-devel luarocks
sudo yum -y install libbson mongo-c-driver libbson-devel mongo-c-driver-devel mongo-c-driver-libs cyrus-sasl-lib libdb
echo
echo
echo

#luarocks install --local mongorover
rm -rf mongorover || true
git clone https://github.com/mongodb-labs/mongorover.git
cd mongorover
luarocks make --local mongorover*.rockspec
cd ..

luarocks install --local https://raw.githubusercontent.com/jiyinyiyong/json-lua/master/json-lua-0.1-3.rockspec
luarocks install --local penlight
