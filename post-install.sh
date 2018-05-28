#!/bin/bash
#Post-Install script for repo.internal.gov (not a actual US Gov site but was personally made to limit the use of ".local" for DNS)
# Scitpt Made By: Corey John Clayton
# Original Scitpt Purpose: To establish the baseine configuration for a simple local repository.
# Created On: 20180101
#
#### Assumptions ###
#
# The CENTOS Software package is set to web server.
# It is unable to be kickstarted as it is a new server.
# The mirror is internode.on.net. But the mirror can be commented out.
# Firewalld is aleady installed, and the regular security profile is set. 
#
#### ENDE ###
## localisation changes
sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/CentOS-Base.repo
sed -i s/^mirror/#mirror/g /etc/yum.repos.d/CentOS-Base.repo
sed -i s_mirror.centos.org_mirror.internode.on.net/pub_g /etc/yum.repos.d/CentOS-Base.repo
## PATCH
yum clean all
sudo yum update -y
## ENABLE
systemctl enable httpd.service
firewall-cmd --permanent --add-service=http
## Change
cp /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.orig
sed -i s/^/#/g /etc/httpd/conf.d/welcome.conf
cp /etc/httpd/conf.d/autoindex.conf /etc/httpd/conf.d/autoindex.conf.orig
sed -i s/^IndexOptions.*$/IndexOptions\ FancyIndexing\ HTMLTable\ VersionSort\ NameWidth=*\ DescriptionWidth=*\ IgnoreCase\ +SuppressHTMLPreamble/g /etc/httpd/conf.d/autoindex.conf
systemctl restart httpd.service
systemctl reload firewalld.service
chcon -R -t httpd_sys_content_t /var/www/html/
## ENDE
