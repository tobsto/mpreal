#!/usr/bin/python
#
# Tobias Stollenwerk, 2012

import subprocess
from sys import *
import os

install_dir=''
if (len(argv))>1:
	install_dir=argv[1]
else:
	print "Call with install directory. Break"
	exit(1)

# read in makefile
mfile=open("makefile", 'r')
mfileContent=mfile.readlines()
mfile.close()
# write installation directories into the makefile
mfile=open("makefile", 'w')
mfile.write("INSTALL_DIR=%s\n" % install_dir)
mfile.write("INCLUDE_DIR=$(INSTALL_DIR)/include\n")
mfile.write("LIB_DIR=$(INSTALL_DIR)/lib\n")
mfile.write("CC=g++ -I $(INCLUDE_DIR) -L $(LIB_DIR)\n")

for l in mfileContent:
	if not (l.startswith('INSTALL_DIR') or l.startswith('INCLUDE_DIR') or l.startswith('LIB_DIR') ):
		mfile.write("%s" % l)
mfile.close()
