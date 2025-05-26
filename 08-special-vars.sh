#! /bin/bash

echo "All variables passed to the script: $@"

echo "Number of variable: $#"

echo "Script name: $0"

echo "Current Working Directory: $USER"

echo "Home directory of user: $HOME"

echo "PID of the script: $$"

sleep 10 &

echo "PID of last command in background: $!"


