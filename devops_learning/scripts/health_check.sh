#!/bin/bash

LOG_FILE="system_health.log"
TIMESTAMP=$(date "+%y-%m-%d %H:%M:%S")

#get disk usage 
DISK_USAGE=$(df -h / | grep / | awk '{print $5}')
DISK_NUM=${DISK_USAGE%?}
#check ram
FREE_RAM=$(free -m | grep Mem | awk '{print $7}')
#save to log
echo "[$TIMESTAMP] Disk: $DISK_USAGE | free RAM: ${FREE_RAM}MB" >> $LOG_FILE
# IF the disk usage is greater than 90, print warnig
if [ $DISK_NUM -gt 90 ]; then
echo "DANGER: disk is getting full! usage is at ${DISK_USAGE}"
else
echo "system is healthy. Disk usage is normal."
fi

