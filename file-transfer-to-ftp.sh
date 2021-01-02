#!/bin/bash
HOST='192.168.13.11'
USER='shahadat'
PASS='123456'
TARGETFOLDER='/backups'
SOURCEFOLDER='/home/shahadat/Laravel-Test'

lftp -f "
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
bye
"

# crontab –e
# * * * * * /home/user/lftp.sh
#https://opensource.com/article/17/11/how-use-cron-linux