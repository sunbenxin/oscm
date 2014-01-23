oscm
====

OS Software Configure Managment

Install
-------
	cd packages/
	$ python3 setup.py sdist
	$ python3 setup.py install
Help
----
	$ bin/deployment 
	Usage: deployment [options] stage project <other>

	Options:
	  -h, --help            show this help message and exit
	  -r, --revert          revert to revision
	  --backup=BACKUP       backup remote to local
	  --clean               

	  stage:
		development | testing | production

	  project:
		<host>.<domain>

	  Branch:
		branch management

		-c master|trunk, --checkout=master|trunk
							checkout branch
		-n branch, --new=branch
							Create new branch
		-d branch, --delete=branch
							delete branch
		--release=RELEASE   release version exampe:2014-01-23

	  Example: 
		deployment testing www.example.com
		deployment production www.example.com --clean
		deployment testing bbs.example.com --backup=/tmp/backup

	  Homepage: http://netkiller.github.com	Author: Neo <netkiller@msn.com>

Configure
---------
	$ cat config/testing/example.com.ini 
	[www]
	;repository=git@192.168.2.1:example.com/www.example.com
	repository=https://github.com/oscm/shell.git
	source=/tmp/repo
	option=--delete --password-file=confure/production/example.com/passwd
	exclude=config/testing/www.example.com.lst
	logfile=/tmp/www.example.com
	remote=www@192.168.2.15
	destination=example.com/www.example.com

	[bbs]
	repository=https://github.com/oscm/shell.git
	branch=master
	remote=www@192.168.2.15
	destination=example.com/bbs.example.com

Deploy Project
--------------
	$ bin/deployment testing bbs.example.com
	receiving incremental file list

	sent 82 bytes  received 3228 bytes  601.82 bytes/sec
	total size is 243879  speedup is 73.68

Revert
------
	$ python3 bin/deployment testing www.example.com -r master	
	$ python3 bin/deployment testing www.example.com -r b1f13fade4c069ff077ce5f26fc3cb1e3c6df902	
	
	$ python3 bin/deployment testing www.example.com -r 838cba5
	HEAD is now at 838cba5... Merge branch 'master' of https://github.com/oscm/linux
	* (detached from 838cba5)
	  master
	sending incremental file list
	.git/
	.git/index
			7344 100%    6.34MB/s    0:00:00 (xfer#1, to-check=117/157)

	sent 3230 bytes  received 148 bytes  519.69 bytes/sec
	total size is 234676  speedup is 69.47
	
Branch management
-----------------
### Show current branch
	$ bin/deployment branch testing bbs.example.com 
	* master
### Create branch
	$ bin/deployment branch testing bbs.example.com -n development
	Switched to a new branch 'development'
	$ bin/deployment branch testing bbs.example.com -n testing
	Switched to a new branch 'testing'
	$ bin/deployment branch testing bbs.example.com -n production
	Switched to a new branch 'production'
	
	$ bin/deployment branch testing bbs.example.com 
	  development
	  master
	* production
	  testing
### Checkout branch
	$ bin/deployment branch testing bbs.example.com -c master
	HEAD is now at f9ed461 Update 5.5.8.sh
	Switched to branch 'master'
	
	$ bin/deployment branch testing bbs.example.com 
	  development
	* master
	  production
	  testing	
###	Delete branch
	$ bin/deployment branch testing bbs.example.com -d beat
	error: Cannot delete the branch 'beat' which you are currently on.
	
	$ bin/deployment branch testing bbs.example.com --delete=beat
	error: Cannot delete the branch 'beat' which you are currently on.
	
	$ bin/deployment branch testing bbs.example.com -c master
	HEAD is now at f9ed461 Update 5.5.8.sh
	Switched to branch 'master'
	
	$ bin/deployment branch testing bbs.example.com --delete=beat
	Deleted branch beat (was f9ed461).
	
	$ bin/deployment branch testing bbs.example.com 
	* master	  
### Release version
	$ bin/deployment branch testing bbs.example.com --release=10.0-RELEASE
	$ git tag 
	10.0-RELEASE

Backup
------
	$ bin/deployment testing bbs.example.com --backup=/tmp/backup
	
Rest 
----
	$ bin/deployment testing bbs.example.com --clean