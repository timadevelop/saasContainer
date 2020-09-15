#!/bin/bash

echo "Starting nginx service....\n"

envsubst "`env | awk -F = '{printf \" \\\\$%s\", $1}'`" < /etc/nginx/template.nginx.conf > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'