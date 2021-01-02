# Backup storage directory 
backupfolder=/home/shahadat/backups

# Notification email address 
#recipient_email=<username@mail.com>

# MySQL user
user=testuser

# MySQL password
password=123456

#dbname
dbname=testdb

# exclude Directory
excludedir = $backupfolder'/New folder'

# Number of days to store the backup 
keep_day=3 

sqlfile=$backupfolder/$dbname-$(date +%d-%m-%Y_%H-%M-%S).sql
zipfile=$backupfolder/$dbname-$(date +%d-%m-%Y_%H-%M-%S).zip
tarfile=$backupfolder/$dbname-$(date +%d-%m-%Y_%H-%M-%S).tar.gz

# Create a backup 
#sudo mysqldump -u $user -p$password --all-databases > $sqlfile 
sudo mysqldump --no-tablespaces -u $user -p$password --databases $dbname > $sqlfile

if [ $? == 0 ]; then
  echo 'Sql dump created' 
else
#  echo 'mysqldump return non-zero code' | mailx -s 'No backup was created!' $recipient_email  
  exit 
fi 

# Compress backup 
zip $zipfile $sqlfile
# $backupfolder --exclude=$backupfolder'/New folder'
tar -czvf $tarfile $sqlfile

if [ $? == 0 ]; then
  echo 'The backup was successfully compressed' 
else
#  echo 'Error compressing backup' | mailx -s 'Backup was not created!' $recipient_email 
  exit 
fi 
rm $sqlfile 
#echo $zipfile | mailx -s 'Backup was successfully created' $recipient_email 

# Delete old backups 
find $backupfolder -mtime +$keep_day -delete

HOST='192.168.13.11'
USER='shahadat'
PASS='123456'
TARGETFOLDER='/sqlBackup'
SOURCEFOLDER=$backupfolder

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