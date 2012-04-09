#!/bin/bash
####################################
#
# Nightly project commit
# Recursively loop through directory and commit any project changes
# To enable desktop notifications, not really needed, but they're fucking cool
# $ sudo apt-get install libnotify-bin
# TODO: Add ability to pass in project directory in via cron task
####################################
# display user's ID
# echo $(id -u)

# check if your keys can be found, run this in CL and comare output to command in this script
#ssh -vT git@github.com


SCRIPT=`readlink -f $0`
SCRIPTPATH=`dirname $SCRIPT`
HOME=/home/allibubba
SSH_AUTH_SOCK=/tmp/keyring-FFC4KQ/ssh
PROJECTPATH=/home/allibubba/Projects
PROJECTS=( $(find $PROJECTPATH -maxdepth 1 -type d -printf '%P\n') )

# if [ "$(id -u)" == "1000" ]; 
#   then
#     echo "ok"
# fi


runCommit () {
  cd /home/allibubba/Projects/$1
  git add -A
  git commit -m"restart commit: "$1
  git push
  sleep 3
  echo "pushed: "$1 >> /home/allibubba/Tasks/Nightly-Commit/access.log
  # notify-send $1
}

for proj in ${PROJECTS[@]}
do
  DIR=/home/allibubba/Projects/$proj
  cd /home/allibubba/Projects/$proj
  if [ -d /home/allibubba/Projects/$proj/.git ] && [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]
    then
      runCommit $proj
  fi
done

echo "Finished running projectPush at `date`" >> /home/allibubba/Tasks/Nightly-Commit/access.log

sleep 2

cd /etc/init.d
