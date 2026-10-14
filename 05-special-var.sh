#!/bin/bash

##special-variables##

echo "All args passed to the script: $@"
echo "no of args passed to the script: $#"
echo "First Variable Passed: $1"
echo "script name: $0"
echo "Realpath: $(realpath $0)"
echo "who is running current script: $USER"
echo "Directory of the current script: $PWD"
echo "Home Directory of the current script: $HOME"
echo "PID of the current script: $$"
sleep 10 &
echo "PID of the command running in background now: $!" 
Wait $! #script wait untill #! command complete
echo "Line number: $LINENO"
echo "Previous command exit status: $?"
echo "Total time taken for Executed for this script: $SECONDS"