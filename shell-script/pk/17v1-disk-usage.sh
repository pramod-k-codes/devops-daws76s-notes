#!/bin/bash
set -x
DISK_LIST=$(df -hT | grep -vE 'tmp|File')

echo -e "current disc usage data is $DISK_LIST"