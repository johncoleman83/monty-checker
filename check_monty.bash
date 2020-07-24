#!/bin/bash
#
# Performing checks on a software development program "simple shell" project

#######################################
# Print KO, in red, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_ko()
{
    echo -e "  >>>>>>>>>>>>>  [\033[31mFAIL\033[37m]"
}

#######################################
# Print OK in green, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_ok()
{
    echo -e "  >>>>>>>>>>>>>  [\033[32mPASS\033[37m]"
}

#######################################
# Prints error messages if any
# Globals:
#   ERROROUTPUTFILE
#   ERROREXPECTED
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_error()
{
	if [[ -s $ERROROUTPUTFILE || -s $ERROREXPECTED ]]; then
		echo "------------error outputs test--------------"
		echo "--------------------------------------------"
		if [ -s $ERROROUTPUTFILE ]; then
			echo "<     your error: "
			echo "--------------------------------------------"
			cat $ERROROUTPUTFILE
		else
			echo -ne "\033[31m"
			echo "** monty has nothing written to stdout **"
			echo "**  when there is an expected output  **"
		fi
		if [ -s $ERROREXPECTED ]; then
			echo ">     expected error: "
			echo "--------------------------------------------"
			cat $ERROREXPECTED
		else
			echo -ne "\033[31m"
			echo "**   there is no expected error,   **"
			echo "** but monty writes to stderr **"
		fi
	fi
	echo -ne "\033[37m"
}

#######################################
# Checks differences
# Globals:
#   DIFF
#   OUTPUTFILE
#   EXPECTED
# Arguments:
#   None
# Returns:
#   None
#######################################
function check_diff()
{
	diff $OUTPUTFILE $EXPECTED > $DIFF
	if [ -s $DIFF ]; then
		print_ko
		echo -ne "\033[30m"
		echo "--------------------!outputs differ!---------------------"
		echo "          your monty '<' -- expected output '>'"
		echo "---------------------------------------------------------"
		echo -ne "\033[31m"
		cat $DIFF
		echo -ne "\033[37m"
	else
		print_ok
	fi
}

#######################################
# Kill the monty in a clean way and remove temporary files
# Globals:
#   MONTY
#   OUTPUTFILE
#   EXPECTED
#   DIFF
#   ERROROUTPUTFILE
#   ERROREXPECTED
#   LTRACEOUTPUTFILE
# Arguments:
#   None
# Returns:
#   None
#######################################
function stop_monty()
{
    if [ `pidof $SHELL | wc -l` -ne 0 ]; then
	   killall -9 $MONTY 2>&1 > /dev/null
    fi
	> $OUTPUTFILE && > $EXPECTED && > $DIFF && > $ERROROUTPUTFILE && > $ERROREXPECTED
}

# Load configuration
source config

# Introduction
echo -ne "\033[34m"
echo "     *************************************"
echo "     ***                               ***"
echo -n "     ***     "
echo -ne "\033[32m"
echo -n "Beginning Test Suite      "
echo -ne "\033[34m"
echo "***"
echo -n "     ***      "
echo -ne "\033[35m"
echo -n "Please be patient        "
echo -ne "\033[34m"
echo "***"
echo -n "     ***     "
echo -ne "\033[36m"
echo -n "...and know the code      "
echo -ne "\033[34m"
echo "***"
echo "     ***                               ***"
echo "     *************************************"
echo ""
echo -ne "\033[30m"
echo "contributors:"
cat AUTHORS | tail -n +2
echo ""

# Cleanup
echo -ne "\033[37m"
echo "--------------------------------------------"
echo "--------------------------------------------"
> $OUTPUTFILE && > $EXPECTED && > $DIFF && > $ERROROUTPUTFILE && > $ERROREXPECTED

# Locates standard tests and launches them
for testname in `ls $TESTDIR | grep -v "~$"`
do
	echo "--------------------------------------------"
	echo "  >>     $testname"
	echo -n "  >>     "
	cat $TESTDIR$testname | head -3 | tail -1
	echo "--------------------------------------------"
	source "$TESTDIR$testname"
done

# Fail Checks

echo -ne "\033[30m"
echo ""
echo ""
echo "--------------------------------------------"
echo "--------------------------------------------"
echo "----   checking for expected fails...   ----"
echo "--------------------------------------------"
echo "--------------------------------------------"
echo ""
echo ""
echo -ne "\033[37m"

# Locates FAIL tests and launches them
for testname in `ls $FAILDIR | grep -v "~$"`
do
	echo "--------------------------------------------"
	echo "  >>     $testname"
	echo -n "  >>     "
	cat $FAILDIR$testname | head -3 | tail -1
	echo "--------------------------------------------"
	source "$FAILDIR$testname"
done

# Cleanup
> $OUTPUTFILE && > $EXPECTED && > $DIFF && > $ERROROUTPUTFILE && > $ERROREXPECTED
rm -f *temp
echo -ne "\033[30m"
