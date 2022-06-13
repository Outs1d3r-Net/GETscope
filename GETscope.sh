#!/bin/bash

# GET MASK
#route -n| grep -i vpn | awk -F " " '{print $3}'| sort | uniq

# GET RANGES
for m in $(route -n| grep -i vpn | awk -F " " '{print $3}'| sort | uniq);do
    for i in $(route -n| grep -i vpn | grep $m|cut -d " " -f 1);do
        ipcalc $i $m | grep "Network:" | cut -d " " -f 4;done;done
;done

