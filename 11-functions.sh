#!/bin/bash
# Shebang to specify that this script should be run in the bash shell.

USERID=$(id -u)
# Stores the user ID of the person running the script.
# 'id -u' returns 0 for root, any other number for regular users.

if [ $USERID -ne 0 ]
# Checks if the current user is NOT root (user ID not equal to 0).
then
    echo "ERROR:: Please run this script with root access"
    # Displays error message to inform the user that root access is required.
    exit 1 #give other than 0 upto 127
    # Exits the script with a non-zero status to indicate failure.
else
    echo "You are running with root access"
    # If the user is root, this message is shown and the script continues.
fi

# Function to validate the exit status of the previous command.
# Takes two parameters: $1 = exit status, $2 = name of the software/component.
VALIDATE(){
    if [ $1 -eq 0 ]
    # If the exit status is 0 (success),
    then
        echo "Installing $2 is ... SUCCESS"
        # Print success message for the package being installed.
    else
        echo "Installing $2 is ... FAILURE"
        # Print failure message.
        exit 1
        # Exit the script immediately on failure.
    fi
}

# ------------------- MySQL Installation -------------------
dnf list installed mysql
# Checks whether MySQL is already installed using dnf.
# If installed, the command will return 0, otherwise non-zero.

if [ $? -ne 0 ]
# If the previous command's exit code is NOT 0 (i.e., MySQL is not installed),
then
    echo "MySQL is not installed... going to install it"
    # Inform the user that installation will begin.
    
    dnf install mysql -y
    # Install MySQL using dnf. '-y' auto-approves installation prompts.
    
    VALIDATE $? "MySQL"
    # Call the validation function to check if the installation succeeded.
else
    echo "MySQL is already installed...Nothing to do"
    # If MySQL is already installed, notify and skip installation.
fi

# ------------------- Python3 Installation -------------------
dnf list installed python3
# Check if python3 is already installed.

if [ $? -ne 0 ]
# If python3 is NOT installed,
then
    echo "python3 is not installed... going to install it"
    # Notify that python3 installation is starting.
    
    dnf install python3 -y
    # Install python3 with auto-approval.
    
    VALIDATE $? "python3"
    # Validate the success of python3 installation.
else
    echo "python3 is already installed...Nothing to do"
    # Notify that python3 is already present.
fi

# ------------------- Nginx Installation -------------------
dnf list installed nginx
# Check if nginx is already installed.

if [ $? -ne 0 ]
# If nginx is NOT installed,
then
    echo "nginx is not installed... going to install it"
    # Notify that nginx installation is starting.
    
    dnf install nginx -y
    # Install nginx using dnf.
    
    VALIDATE $? "nginx"
    # Validate the success of nginx installation.
else
    echo "nginx is already installed...Nothing to do"
    # Notify that nginx is already present.
fi
