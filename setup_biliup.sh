#!/bin/bash
apt update
apt install vsftpd
apt install ffmpeg
apt install nethogs
apt install nginx
apt install python3-venv
apt-get install gnupg
apt install wget
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
python3 -m venv .venv
source ./.venv/bin/activate
pip3 install ./biliup-0.4.31.tar.gz
biliup start
chmod +x BiliupAutoRestart
nohup ./BiliupAutoRestart >> AutoRestart.log 2>&1 &