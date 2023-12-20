#!/bin/bash
apt update
apt install vsftpd
apt install ffmpeg
apt install nethogs
apt install nginx
apt install python3-venv
apt-get install gnupg
apt install wget
timedatectl set-timezone Asia/Shanghai
systemctl restart systemd-timesyncd
wget https://raw.githubusercontent.com/boxie123/Cloud/main/biliup_backup.tar.gz.gpg
gpg biliup_backup.tar.gz.gpg
tar -xzvf biliup_backup.tar.gz
cd ./config
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
cp nginx.conf /etc/nginx/nginx.conf
cp medalspider.conf /etc/nginx/sites-enabled/medalspider.conf
cp biliup.conf /etc/nginx/sites-enabled/biliup.conf
nginx -s reload
cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
cp vsftpd.conf /etc/vsftpd.conf
/etc/init.d/vsftpd restart
cd ../biliup
chmod +x start_biliup.sh
./start_biliup.sh