#!/bin/bash

START_TIME=$(date +%s)
echo "script execution time at: $START_TIME"

sleep 10

END_TIME=$(date +%s)
echo "script complete time at: $END_TIME"

TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "script run time is: $TOTAL_TIME"