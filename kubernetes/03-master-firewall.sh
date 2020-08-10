#!/bin/bash

firewall-cmd --add-port 6443/tcp --permanent
firewall-cmd --add-port 2379-2380/tcp --permanent
firewall-cmd --add-port 10250/tcp --permanent
firewall-cmd --add-port 10251/tcp --permanent
firewall-cmd --add-port 10252/tcp --permanent
firewall-cmd --reload
