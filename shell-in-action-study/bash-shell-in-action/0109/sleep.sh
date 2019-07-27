#!/bin/bash
#File: sleep.sh

count=0
while true
  do
    if [ $count -lt 10 ] 
    then
      let count++
      echo "now count is $count, wait 1 second"
      sleep 1
    else
      echo "exit now"
      exit 0
    fi
  done