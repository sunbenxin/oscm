#!/bin/bash
###################################
# $Id: backup 379 2012-04-02 08:43:42Z netkiller $
# Author: netkiller@msn.com
# Home:	http://netkiller.github.com
###################################
# SELECT `user`, `host`, `password` FROM `mysql`.`user`;
# CREATE USER 'backup'@'localhost' IDENTIFIED BY 'SaJePoM6BAPOmOFOd7Xo3e1A52vEPE';
# GRANT SELECT, LOCK TABLES  ON *.* TO 'backup'@'localhost';
# FLUSH PRIVILEGES;
# SHOW GRANTS FOR 'backup'@'localhost';
###################################
BACKUP_HOST="localhost"
BACKUP_USER="root"
BACKUP_PASS="PA3nScWWdqC3Ww4KPu"
BACKUP_DIR=/opt/backup
BACKUP_DBNAME="dbname"
#Number of copies
COPIES=30
####################################
MYSQLDUMP="/usr/bin/mysqldump"
TIMEPOINT=$(date -u +%Y-%m-%d)
MYSQLDUMP_OPTS="-h $BACKUP_HOST -u$BACKUP_USER -p$BACKUP_PASS"
####################################
test ! -w $BACKUP_DIR && echo "Error: $BACKUP_DIR is un-writeable." && exit 0

umask 0077

for dbname in $BACKUP_DBNAME
do
	test ! -d "$BACKUP_DIR/$dbname" && mkdir -p "$BACKUP_DIR/$dbname"

	$MYSQLDUMP $MYSQLDUMP_OPTS $dbname | gzip > $BACKUP_DIR/$dbname/$dbname.$TIMEPOINT.sql.gz
done
find $BACKUP_DIR -type f -mtime +$COPIES -delete
