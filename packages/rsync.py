import os, sys

class Rsync():
	def __init__(self): 
		self.cmd = []
		self.cmd.append('rsync')
	def option(self, opt):
		self.cmd.append(opt)
	def delete(self):
		self.cmd.append('--delete')
	def backup(self, dir):
		self.cmd.append('--backup --backup-dir='+dir)
	def logfile(self, log):
		self.cmd.append('--log-file='+log)
	def exclude(self,exc):
		if exc.find('/') or exc.find('.'):
			self.cmd.append('--exclude-from='+exc)
		else:
			self.cmd.append('--exclude='+exc)
	def include(self,exc):
		if exc.find('/') or exc.find('.'):
			self.cmd.append('--include-from='+exc)
		else:
			self.cmd.append('--include='+exc)
	def password(self, file):
		self.cmd.append('--password-file='+file)	
	def source(self,src):
		self.cmd.append(src)
	def destination(self,dest):
		self.cmd.append(dest)
	def execute(self):
		os.system(' '.join(self.cmd))
	def string(self):
		return(' '.join(self.cmd))
	def debug(self):
		print(' '.join(self.cmd))

""" 
rsync = Rsync()
rsync.option('auzvP')
rsync.source('/etc/')
rsync.destination('/tmp')
rsync.execute()
"""