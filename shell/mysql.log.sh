#!/bin/bash
USER=backup
PASS=SaJePoM6BAPOmOFOd7Xo3e1A52vEPE
LOGDIR=/backup/dblog
DATADIR=/var/lib/mysql
LOG=mysql.log
LOG_ERROR=mysql_error.log
LOG_SLOW_QUERIES=slow.log
SOCKET="/var/lib/mysql/mysql.sock"
#Number of copies
COPIES=365
SHARDING=$(date -d "yesterday" +"%Y-%m-%d.%H:%M:%S")

mkdir -p ${LOGDIR}/${SHARDING}

while read logfile age
do
    mv ${DATADIR}/$logfile ${LOGDIR}/${SHARDING}
done << EOF
${LOG}
${LOG_ERROR}
${LOG_SLOW_QUERIES}
EOF

mysqladmin -u${USER} -p${PASS} --socket=${SOCKET} flush-logs

gzip ${LOGDIR}/${SHARDING}/*.log

find $LOGDIR -type f -ctime +$COPIES -delete
