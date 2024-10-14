#!/bin/bash
# set -xe
DISK_LIST=$(df -hT | grep -vE 'tmp|File' | cut -d % -f1)
DISC_NAME=$(echo $DISK_LIST | awk '{print$1}')
 # DISC_NAME=$(DISK_LIST | awk '{print$1}') is wrong because you are not reading variable you need to echo to get output
# DISC_NAME=$(echo DISK_LIST | awk '{print$1}') is wrong because you are not reading value of variable

DISK_USAGE=$(echo $DISK_LIST | awk '{print$6}')
echo -e "current disc data $DISK_LIST"
echo -e "current disc name  $DISC_NAME"
echo -e "current disc usage $DISK_USAGE"
while IFS= read line
do

  echo -e "$line -------------"



done <<< "$DISK_LIST"



