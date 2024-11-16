#!/bin/sh

ping -c 1 google.com >/dev/null 2>&1
internet_status=$(
    echo "$?"
)

if [ "$internet_status" -eq 0 ]; then
    echo "󰖈"
else
    echo "󱘖"
fi
