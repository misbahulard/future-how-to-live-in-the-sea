#!/bin/bash

cat <<EOF | sudo tee /etc/sysctl.d/00-system.conf
net.ipv4.ip_forward = 1
EOF

modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system
