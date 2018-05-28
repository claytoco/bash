#!/bin/bash
# This Script was built to allow easy patching between thor.internal.local and repo.lab.internal.local and has no great vaule.
rsync -avh --delete --progress --exclude={"index.html","HEADER.html","README.html","configs","pub/centos/6.8","pub/centos/7.2.1511","pub/epel/7/x86_64/debug","pub/fedora","dandelion/Microsoft Images/","share","kickstart"} corey@192.168.1.199:/var/www/html /var/www
chcon -R -t httpd_sys_content_t /var/www/html/
