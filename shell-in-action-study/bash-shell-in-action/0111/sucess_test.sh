#!/bin/bash
# File: sucess_test.sh

CMD="ls -l"
$CMD
if [ $? -eq 0 ]; then
    echo "$CMD executed success"
else
    echo "$CMD executed failed"
fi

exit 0;