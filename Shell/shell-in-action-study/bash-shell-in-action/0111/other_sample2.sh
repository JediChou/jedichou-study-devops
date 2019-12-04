#!/bin/bash

yes_or_no() {
    echo "is you name $*? ";
    while true
    do
        read -p "Enter yes or no: " x;
        case $x in
            y|Y )
                return 0;;
            n|N )
                return 1;;
            *   )
                echo "answer yes or no";
        esac
    done
}

echo "original parameters are $*";
if yes_or_no "$1"; then
    echo "Hi $1, nice name";
else
    echo "Never mind";
fi

exit 0