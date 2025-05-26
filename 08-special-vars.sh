#!/bin/bash                           # Shebang: Use the bash shell to interpret this script.

echo "All variables passed to the script: $@"     
# $@ gives all the arguments passed to the script as a list, e.g., ./script.sh one two → "one two"

echo "Number of variable: $#"
# $# shows how many arguments were passed to the script. For example, if you run:
# ./script.sh one two three → this will output "3"

echo "Script name: $0"
# $0 gives the name of the script itself. If your file is script.sh, this will output "script.sh"

echo "Current Working Directory: $USER"
# $USER shows the currently logged-in username who is running the script.

echo "Home directory of user: $HOME"
# $HOME gives the home directory path of the current user, e.g., /home/username

echo "PID of the script: $$"
# $$ gives the current Process ID (PID) of the running script itself.
# Useful for debugging or creating temporary files using the script's PID.

sleep 10 &
# This runs the 'sleep 10' command in the background, allowing the script to continue without waiting.

echo "PID of last command in background: $!"
# $! returns the Process ID of the most recent background command (in this case, 'sleep 10')
