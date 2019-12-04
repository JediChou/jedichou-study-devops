# coding: utf-8
import os, fnmatch

def all_files(root, patterns='*', single_level=False, yield_folders=False):
	# 将模式从字符串中取出放入列表中
	patterns = patterns.split(';')
	for path, subdirs, files in os.walk(root):
		if yield_folders:
			files.extend(subdirs)
		files.sort()
		for name in files:
			for pattern in patterns:
				if fnmatch.fnmatch(name, pattern):
					yield os.path.join(path, name)
					break;
		if single_level:
			break;

if __name__ == "__main__":
	thefiles = list(all_files('/d/temp/mygit', '*.py;*.htm;'))
	for thefile in thefiles:
		print thefile

# TODO need a test
