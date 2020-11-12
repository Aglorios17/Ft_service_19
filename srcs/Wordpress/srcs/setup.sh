#!/bin/sh
telegraf &
php-fpm7&
nginx -g 'pid /tmp/nginx.pid; daemon off;'
