#!/bin/bash

kubectl apply -f spring-deployment.yaml
kubectl apply -f spring-service.yaml

kubectl apply -f busybox-deployment.yaml
