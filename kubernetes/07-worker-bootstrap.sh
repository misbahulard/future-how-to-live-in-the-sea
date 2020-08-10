#!/bin/bash

kubeadm join 172.24.56.240:6443 --token TOKEN \
    --discovery-token-ca-cert-hash HASH
