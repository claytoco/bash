#!/bin/bash
#depo.internal.local update process for ALL files

rsync -avh --delete --progress corey@192.168.1.20:/var/www/html /var/www
chcon -R -t httpd_sys_content_t /var/www/html/