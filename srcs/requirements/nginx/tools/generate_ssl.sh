#!/bin/sh

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/tjehaes.key \
  -out /etc/nginx/ssl/tjehaes.crt \
  -subj "/C=LU/ST=Luxembourg/L=Luxembourg/O=42/OU=42/CN=${DOMAIN_NAME}"

