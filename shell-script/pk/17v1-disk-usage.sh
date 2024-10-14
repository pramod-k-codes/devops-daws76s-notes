#!/bin/bash
 set -xe
DISK_DATA=$(df -hT | grep -vE 'tmp|File' | cut -d % -f1)
#DISC_NAME=$(echo "$DISK_DATA" | awk '{print$1}')
 # DISC_NAME=$(DISK_DATA | awk '{print$1}') is wrong because you are not reading variable you need to echo to get output
# DISC_NAME=$(echo DISK_DATA | awk '{print$1}') is wrong because you are not reading value of variable

#DISK_USAGE=$(echo "$DISK_DATA" | awk '{print$6}')
echo -e "current disc data $DISK_DATA"
echo -e "current disc name  $DISC_NAME"
echo -e "current disc usage $DISK_USAGE"
#while IFS=read line # no spaces correct assignment such as ELEVEN="11" but this statement fails to read lines
#while IFS = read line #This is syntax error because assignment should not have spaces around = in bash which makes assignment 'IFS = read line'
#while IFS =read line #Also invalid statement because of space before assignment symbol = which makes assignment 'IFS ='
# the following line is correctly working not sure why, because this has a space after = making it 'IFS= ' in statement which should not work because this is as signing space to IFS as per my knowledge
while IFS= read line ;do
  DISC_NAME=$(echo "$line" | awk '{print$1}') #{print$1F}  is wrong $1F is not a valid field specifier in awk. The F at the end doesn't have any special meaning in this context. As a result, this command will likely produce an error or unexpected output.
   # DISC_NAME=$(DISK_DATA | awk '{print$1}') is wrong because you are not reading variable you need to echo to get output
   # DISC_NAME=$(echo DISK_DATA | awk '{print$1}') is wrong because you are not reading value of variable
  DISK_USAGE=$(echo "$line" | awk '{print$6}')
#  echo -e "current disc data $DISK_DATA"
#  echo -e "current disc name  $DISC_NAME"
#  echo -e "current disc usage $DISK_USAGE"
  if [ "$DISK_USAGE" -ge 1 ]; then
      echo -e "## Disk usage of Disk $DISC_NAME is $DISK_USAGE which is greater than the threshold ##"
  fi
done <<< "$DISK_DATA"



