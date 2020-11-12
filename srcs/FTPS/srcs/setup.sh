#!/bin/sh
telegraf &
echo -e "Password!\nPassword!\n" | adduser -h ftp/admin -s /sbin/nologin admin
mkdir -p ftp/admin
chown admin:admin ftp/admin

exec /usr/sbin/vsftpd -opasv_address=192.168.99.232 /etc/vsftpd/vsftpd.conf
