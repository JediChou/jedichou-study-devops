#!/bin/bash

function fname()
{
    echo $1, $2
    echo "$@"
    echo "$*"
    return 1
}

# TODO: why ?
result=$(fname "one" "two" "three");
echo $result;