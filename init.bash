#!/bin/bash

# error check, exits upon errors
set -e

# error input check
if [ $# -eq 0 ]; then
	echo -ne "\033[31m"
	echo "USAGE ERROR:"
	echo "input the github username hosting the repo that you want to check"
	echo -ne "\033[30m"
	echo "Initialize the checker like this:"
	echo "$ ./init.bash [GITHUB_USERNAME]"
	exit 1
fi

# pulls github repo with argv1
git clone https://github.com/$1/monty.git

# runs gcc with Warning flags
gcc -Wall -Werror -Wextra -pedantic ./monty/*.c -o temp

# remove cloned monty repo
rm -rf monty

# change name of compiled executable
mv temp monty

echo -ne "\033[32m"
echo "***********************"
echo "**** SWEET SUCCESS ****"
echo "***********************"
echo -ne "\033[30m"
echo "Now start the checker!!"
echo "$ ./check_monty.bash"
