#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

printf "\n${YELLOW}** Update systems *****************************************************************${NC}\n"
yum update -y
yum -y install epel-release
yum -y install git yum-utils

printf "\n${YELLOW}** Install docker *****************************************************************${NC}\n"
if [ ! -f /etc/yum.repos.d/docker-ce.repo ]; then
    printf "Add docker repo\n"
    yum-config-manager --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo
fi

yum -y install docker-ce docker-ce-cli containerd.io

systemctl enable docker
systemctl restart docker

printf "\n${YELLOW}** Install Compose *****************************************************************${NC}\n"
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod 755 /usr/local/bin/docker-compose

printf "\n${YELLOW}** Open firewall for swarm later ***************************************************${NC}\n"
firewall-cmd --permanent --add-port=2376/tcp
firewall-cmd --permanent --add-port=2377/tcp
firewall-cmd --permanent --add-port=7946/tcp
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=7946/udp
firewall-cmd --permanent --add-port=4789/udp
firewall-cmd --reload
