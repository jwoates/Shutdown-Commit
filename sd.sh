#!/bin/bash
####################################
#
# This hook runs at shutdown, should run as user allibubba
####################################

# change and run as allibubba
echo -e '*************************\n'
echo -e 'running script\n'
echo -e '*************************\n'
/bin/su - allibubba -c /etc/init.d/ssd.sh start

