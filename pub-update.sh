#!/bin/bash
#depo.internal.local update process for pub files

rsync -avh --delete --progress corey@192.168.1.199:/var/www/html/pub /var/www/html
chcon -R -t httpd_sys_content_t /var/www/html/