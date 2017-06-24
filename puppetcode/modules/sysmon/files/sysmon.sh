#!/bin/bash

# This file is managed via Puppet. Any manual changes to this file would not survive the next puppet 
# run and would be overwritten by the puppet version.
# Please contact DevOps team if you wish to make changes in this file.

OUTDIR=/var/log/sysmon/`date +%d-%b-%Y`
mkdir -p $OUTDIR

top -b -c -n 1 > $OUTDIR/`date +%H-%M`.top
ps fauxww > $OUTDIR/`date +%H-%M`.ps
cat /proc/meminfo > $OUTDIR/`date +%H-%M`.meminfo
