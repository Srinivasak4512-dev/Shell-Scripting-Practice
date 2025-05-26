#!/bin/bash
# 👆 Shebang: This tells the OS to use the Bash shell to interpret this script.

NUMBER=$1
# 👈 Captures the **first argument** passed to the script.
# Example: If you run `./script.sh 5`, then NUMBER=5

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal
# 👆 These are **arithmetic comparison operators** used in conditional expressions.

if [ $NUMBER -lt 10 ]
then
    echo "Given number $NUMBER is less than 10"
    # 👈 This prints a message if the number is less than 10
else
    echo "Given number $NUMBER is not less than 10"a
    # ❌ Typo: There’s an extra `a` at the end of this line. Should be:
    # echo "Given number $NUMBER is not less than 10"
fi
