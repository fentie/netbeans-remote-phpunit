#!/bin/sh
#echo $@ #uncomment to debug

REMOTE_SERVER=user@virtualhost
REMOTE_PATH_TO_TESTS='/path/to/tests'

# The very last argument is the path to the test(s) you want run
export TEST=$9

# Chop off everything up to "tests" in that path. "tests" is just an example path
TEST=${TEST##r*tests}

# Connect to your VM, cd to your test location and run phpunit with most of the args
ssh $REMOTE_SERVER "cd $PATH_TO_TESTS; phpunit $1 $2 $3 $4 $REMOTE_PATH_TO_TESTS/$TEST"

# Copy the test output back to your local machine, where NetBeans expects to find it
scp $REMOTE_SERVER:$2 $2
