#!/bin/sh
telegraf &
pure-ftpd -p 21000:21004 -P 192.168.99.232
