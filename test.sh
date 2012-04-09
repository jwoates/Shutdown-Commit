#!/bin/bash
####################################
#
# This hook runs at shutdown
####################################

gnome-terminal --window-with-profile executeScript -e $HOME/Tasks/Shutdown-Test/shutdownHook.sh &