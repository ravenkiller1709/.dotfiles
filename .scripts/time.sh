#!/bin/sh

#24 hour format
# CURRENTDATEONLY=`date +"%a %B %d %H:%M:%S"`
#12 hour format
CURRENTDATEONLY=`date +"%a %B %d %I:%M:%S %p"`

echo ${CURRENTDATEONLY}
