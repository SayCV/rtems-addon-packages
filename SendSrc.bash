#!/usr/local/bin/bash

set -ex

DATE=`date | gawk '{print $3 $2 $6}'`
DISTNAME="rtems_packages.$DATE.tgz"

tar cf - . | gzip >~/$DISTNAME
