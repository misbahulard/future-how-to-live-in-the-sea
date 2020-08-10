#!/bin/bash

cat <<EOF | sudo tee -a /etc/haproxy/haproxy.cfg

frontend ingress
    bind 172.24.56.240:80
    default_backend ingress-backend

backend ingress-backend
    balance roundrobin
    server ingress-1 172.24.56.238:30520 check
    server ingress-2 172.24.56.239:30520 check
EOF

service haproxy restart
