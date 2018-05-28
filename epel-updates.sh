#!/bin/bash
#Derived From: killroy396@github.com/repo-maintance-scripts

echo '===================================================================='
# confirm directory exists
mkdir -p /var/www/html/pub/epel
# cd
cd /var/www/html/pub/epel
# echo working directory
echo 'updating '$(pwd)
# rsync nb: epel is not available from ftp.iinet but is on the internode mirror under "/epel"
rsync -avh --progress --delete --exclude={"/4*","/5*","/6*","testing*","7/SRPMS*","7/aarch*","7/ppc*","7/x86_64/debug*"} rsync://mirror.internode.on.net/epel/ .
# chcon
chcon -R -t httpd_sys_content_t /var/www/html/pub/epel

echo '===================================================================='
