Auditlog
======


Help
----
	$ auditlog
	Options:
	  -h, --help            show this help message and exit
	  -l LOGFILE, --logfile=LOGFILE
							log file
	  -r REGULAR, --regular=REGULAR
							regular
	  -d, --daemon          run as daemon
	  --debug               Print debug information

	  Homepage: http://netkiller.github.com
	  Author: Neo <netkiller@msn.com>

Search keyword by regular
--------------
	$ python3 auditlog -l /var/log/syslog -r "\/etc\/cron.hourly\)$"
	Feb 24 07:17:01 ubuntu CRON[28905]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 08:17:01 ubuntu CRON[29888]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 09:17:01 ubuntu CRON[31136]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 10:17:01 ubuntu CRON[32231]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 11:17:01 ubuntu CRON[841]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 12:17:01 ubuntu CRON[1977]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 13:17:01 ubuntu CRON[3059]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 14:17:01 ubuntu CRON[4263]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 15:17:01 ubuntu CRON[5335]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	Feb 24 16:17:01 ubuntu CRON[6573]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
	
	$ python3 auditlog -l /var/log/syslog -r "^Feb"
	Feb 24 06:48:30 ubuntu rsyslogd: [origin software="rsyslogd" swVersion="5.8.11" x-pid="829" x-info="http://www.rsyslog.com"] rsyslogd was HUPed
	Feb 24 06:48:30 ubuntu CRON[27658]: (CRON) info (No MTA installed, discarding output)
	Feb 24 07:09:01 ubuntu CRON[28764]: (root) CMD (  [ -x /usr/lib/php5/maxlifetime ] && [ -x /usr/lib/php5/sessionclean ] && [ -d /var/lib/php5 ] && /usr/lib/php5/sessionclean /var/lib/php5 $(/usr/lib/php5/maxlifetime))
	Feb 24 07:17:01 ubuntu CRON[28905]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)

Configure
---------

### auditlog.ini 
	$ cat etc/auditlog.ini 
	[syslog]
	logfile=/var/log/syslog
	regular=syslog.reg

	[dmesg]
	logfile=/var/log/dmesg
	regular=dmesg.reg

	[dpkg]
	logfile=/var/log/dpkg.log
	regular=dpkg.reg

	[redis]
	logfile=/var/log/redis/redis-server.log
	regular=redis.reg

### regular
	$ cat syslog.reg
	^Feb
	:09:	
	
Daemon
------
	$ python3 auditlog -d
