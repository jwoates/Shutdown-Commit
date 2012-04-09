#!/bin/bash
####################################
#
# This hook runs at shutdown
####################################

echo "Shutdown script initiated" >> /home/allibubba/Tasks/Shutdown-Test/task.log;

echo "Are you sure you want to shut down? (y/n)";
read answer;
case $answer in
  "y") echo "Shutting down..."; notify-send "shutting down";;
  "n") echo "Canceling Shutdown"; notify-send "canceling shutdown";;
  *) echo "Please enter y or n";;
esac

sleep 3
exit 0
