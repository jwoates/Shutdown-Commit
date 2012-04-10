# Shutdown Hook
This script is called when you initiate the shutdown or restart command

# Set Up
place init.sh in /etc/init.d
edit init.sh to use your username and point to shutdownHook.sh

    /bin/su - username -c /path/to/shutdownHook.sh start

in /etc/rc0.d and /etc/rc6.d create an alias to init.sh

    ln -s ../init.d/init.sh S01shutdownhook.sh

NOTE: the alias must be follow the S00name convention, the S tells the runlevel change to start the script and the number, 01 gives it a run order.