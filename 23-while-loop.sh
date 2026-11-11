#!/bin/bash

while IFS= read -r line;
do
  echo $line
  done > 04-conversation-arg.sh