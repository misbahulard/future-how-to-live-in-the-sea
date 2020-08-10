#!/bin/bash
# args $1 = nama domain anda, contohnya misbah.com bisa juga sekalian dengan sub domain menjadi *.misbah.com
openssl req -new -newkey rsa:4096 -nodes -keyout domain.key -out domain.csr -subj "/C=ID/ST=Jakarta/L=JakartaPusat/O=JKT/CN=$1"
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=ID/ST=Jakarta/L=JakartaPusat/O=JKT/CN=$1" -keyout domain.key -out domain.crt
