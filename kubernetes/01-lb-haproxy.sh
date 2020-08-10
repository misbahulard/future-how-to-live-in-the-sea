#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

printf "Open firewall\n"

firewall-cmd --add-port 6443/tcp --permanent
firewall-cmd --reload

printf "Install haproxy"

yum -y install haproxy

cat <<EOF | sudo tee /etc/haproxy/haproxy.cfg 
frontend kubernetes
    bind 192.168.0.110:6443
    option tcplog
    mode tcp
    default_backend kubernetes-master-nodes

backend kubernetes-master-nodes
    mode tcp
    balance roundrobin
    option tcp-check
    server master-1 192.168.0.111:6443 check fall 3 rise 2
EOF

setsebool -P haproxy_connect_any=1

printf "Restart"
service haproxy restart
