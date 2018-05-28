#!/bin/bash
#Derived From: killroy396@github.com/repo-maintance-scripts
echo '===================================================================='
# Confirm directory exists
mkdir -p /var/www/html/pub/centos
# move to that directory so that we copy files into the correct location
cd /var/www/html/pub/centos/
# echo working directory to provide feedback
echo 'updating '$(pwd)
# rsync the Centos 7.3.1611 directory
rsync -avh --progress --delete --exclude={"/2*","/3*","/4*","/5*","/6*","/7.0*","/7.1*","/7.2*","/7","build*","dostools*","graphics*"} rsync://mirror.internode.on.net/centos/ .
#rsync -avh --progress --delete --exclude={"/2*","/3*","/4*","/5*","/6","/6.0*","/6.1*","/6.2*/","/6.3*","/6.4*","/6.5*","/6.6*","/6.7*","/7.0*","/7.1*","7.2*","/7","build*","dostools*","graphics*"} rsync://ftp.iinet.net.au/centos/ .
# chcon
chcon -R -t httpd_sys_content_t /var/www/html/pub/centos/7.3.1611

echo '===================================================================='
