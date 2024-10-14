#!/bin/bash
# set -xe
DISK_LIST=$(df -hT | grep -vE 'tmp|File' | cut -d % -f1)
DISC_NAME=$(echo DISK_LIST | awk '{print$1}')
DISK_USAGE=$(DISK_LIST | awk '{print$6}')
echo -e "current disc data $DISK_LIST"
echo -e "current disc name  $DISC_NAME"
echo -e "current disc usage $DISK_USAGE"



