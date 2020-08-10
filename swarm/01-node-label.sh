#!/bin/bash

# $1 is node ID
docker node update --label-add role=traefik $1
