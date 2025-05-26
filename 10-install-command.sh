#!/bin/bash
# Shebang to tell the system this script should be run using the Bash shell.

USERID=$(id -u)
# Get the User ID of the person executing the script and store it in the variable USERID.

if [ $USERID -ne 0 ]
# Check if the User ID is NOT equal to 0 (0 means root user).
then
    echo "ERROR:: Please run this script with root access"
    # If not root, print error message.
    exit 1
    # Exit the script with a non-zero status (1 = general error).
else
    echo "You are running with root access"
    # If root user, continue and notify.
fi

dnf list installed mysql
# Check if MySQL is already installed using dnf (used in RHEL/CentOS/Fedora).
# This will list the installed package if it's found.

# Check the exit status of the previous command using `$?`.
# 0 means MySQL is already installed, non-zero means it's not installed.
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    # Inform user that MySQL is not installed and will now be installed.
    
    dnf install mysql -y
    # Attempt to install MySQL package. `-y` automatically answers 'yes' to prompts.

    if [ $? -eq 0 ]
    # Check if the installation was successful (exit status 0).
    then
        echo "Installing MySQL is ... SUCCESS"
        # Notify user that installation was successful.
    else
        echo "Installing MySQL is ... FAILURE"
        # Notify user of installation failure.
        exit 1
        # Exit the script with error status.
    fi
else
    echo "MySQL is already installed...Nothing to do"
    # If MySQL is already present, no further action is needed.
fi

# ------------------------------------------
# Commented-out redundant block below:

# dnf install mysql -y
# This was a previously used installation command, now not needed due to logic above.

# if [ $? -eq 0 ]
# then
#     echo "Installing MySQL is ... SUCCESS"
# else
#     echo "Installing MySQL is ... FAILURE"
#     exit 1
# fi
# This duplicate block handled success/failure of MySQL installation but is now unnecessary
# since that logic is already implemented in the main `if` condition above.
