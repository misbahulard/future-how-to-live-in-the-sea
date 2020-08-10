#!/bin/bash

# spring app
kubectl create deployment --image misbahulard/spring-example:0.1.0 spring -o yaml --dry-run=client > spring-deployment.yaml
kubectl create service clusterip spring --tcp=80:8080 -o yaml --dry-run=client > spring-service.yaml

# busybox buat debugging
kubectl create deployment --image praqma/network-multitool busybox -o yaml --dry-run=client > busybox-deployment.yaml
