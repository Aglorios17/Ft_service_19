#!/bin/sh
telegraf &
php -S 0.0.0.0:5050 -t /www/
