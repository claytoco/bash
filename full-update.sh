#!/bin/bash
# A combination script of the many rsync scripts derived from killroy396@github.com/repo-maintance-scripts
echo '====================================================================='
echo '                          MAIN REPO'
echo '====================================================================='
# Confirm directory exists
mkdir -p /var/www/html/pub/centos
# move to that directory so that we copy files into the correct location
cd /var/www/html/pub/centos/
# echo working directory to provide feedback
echo 'updating '$(pwd)
# rsync the Centos 7.3.1611 directory
rsync -avh --progress --delete --exclude={"/2*","/3*","/4*","/5*","/6*","/7.0*","/7.1*","/7.2*","7.3*","7.4*","/7","build*","dostools*","graphics*"} rsync://mirror.internode.on.net/centos/ .
#rsync -avh --progress --delete --exclude={"/2*","/3*","/4*","/5*","/6","/6.0*","/6.1*","/6.2*/","/6.3*","/6.4*","/6.5*","/6.6*","/6.7*","/7.0*","/7.1*","7.2*","7.3*","7.4*","/7","build*","dostools*","graphics*"} rsync://ftp.iinet.net.au/centos/ .
# chcon
chcon -R -t httpd_sys_content_t /var/www/html/pub/centos/7.3.1611

echo '===================================================================='

echo '====================================================================='
echo '                             EPEL'
echo '====================================================================='
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

echo '====================================================================='
echo '                            FEDORA CURRENT'
echo '====================================================================='
echo ' '
echo '====================================================================='
echo '                             UPDATES'
echo '====================================================================='
mkdir -p /var/www/html/pub/fedora/linux/updates/27/x86_64/
cd /var/www/html/pub/fedora/linux/updates/27/x86_64/
echo ' '$(pwd)
rsync -avh --progress --delete --exclude=debug* rsync://mirror.internode.on.net/fedora/linux/updates/27/x86_64/ .
#rsync -avh --progress --delete --exclude=debug* rsync://ftp.iinet.net.au//pub/fedora/linux/updates/27/x86_64/ .
#rsync -avh --progress --delete --exclude=debug* rsync://ftp.iinet.net.au/redhat-fedora/updates/27/x86_64/ .
chcon -R -t httpd_sys_content_t /var/www/html/pub/fedora/linux/updates

#echo '====================================================================='
#echo ' =                          WORKSTATION'
#echo '====================================================================='
#mkdir -p /var/www/html/pub/fedora/linux/releases/27/Workstation/x86_64/
#cd /var/www/html/pub/fedora/linux/releases/27/Workstation/x86_64
#echo 'updating '$(pwd)
#rsync -avh --progress --delete --exclude=debug* rsync://mirror.internode.on.net/fedora/linux/releases/27/Workstation/x86_64/ .
#rsync -avh --progress --delete --exclude=debug* rsync://ftp.iinet.net.au//pub/fedora/linux/releases/27/Workstation/x86_64/ .
#rsync -avh --progress --delete --exclude=debug* rsync://ftp.iinet.net.au/redhat-fedora/releases/27/Workstation/x86_64/ .
#chcon -R -t httpd_sys_content_t /var/www/html/pub/fedora/linux/releases/27/Workstation


#echo '====================================================================='
#echo '                              SERVER'
#echo '====================================================================='
#mkdir -p /var/www/html/pub/fedora/linux/releases/27/Server/x86_64/
#cd /var/www/html/pub/fedora/linux/releases/27/Server/x86_64
#echo 'updating '$(pwd)
#rsync -avh --progress --delete --exclude=debug* rsync://mirror.internet.on.net/fedora/linux/releases/27/Server/x86_64/ .
#rsync -avh --progress --delete --exclude=debug* rsync://ftp.iinet.net.au//pub/fedora/linux/releases/27/Server/x86_64/ .
#rsync -avh --progress --delete --exclude=debug* rsync://ftp.iinet.net.au/redhat-fedora/releases/27/Server/x86_64/ .
#chcon -R -t httpd_sys_content_t /var/www/html/pub/fedora/linux/releases/27/Server


echo '====================================================================='
echo '                            EVERYTHING'
echo '====================================================================='
mkdir -p /var/www/html/pub/fedora/linux/releases/27/Everything/x86_64/
cd /var/www/html/pub/fedora/linux/releases/27/Everything/x86_64
echo 'updating '$(pwd)
rsync -avh --progress --delete --exclude=debug* rsync://mirror.internode.on.net/fedora/linux/releases/27/Everything/x86_64/ .
#rsync -avh --progress --delete --exclude=debug* rsync://ftp.iinet.net.au/redhat-fedora/releases/27/Everything/x86_64/ .
chcon -R -t httpd_sys_content_t /var/www/html/pub/fedora/linux/releases/27/Everything


echo '====================================================================='
echo '                          END OF UPDATES'
echo '====================================================================='
