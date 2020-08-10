#!/bin/bash

kubeadm init --control-plane-endpoint "192.168.0.110:6443" --upload-certs --pod-network-cidr=192.168.0.0/16

mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
