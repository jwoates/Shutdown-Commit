#!/bin/bash
####################################
#
# This file is run on shutdown or restart, it simply runs shutdownHook.sh as you
# place this file in /etc/init.d, add a symlink to this file in /etc/rc0.d AND /etc/rc6.d
####################################

# change and run as allibubba, add your user name here
/bin/su - allibubba -c /home/allibubba/Tasks/Shutdown-Commit/shutdownHook.sh start

