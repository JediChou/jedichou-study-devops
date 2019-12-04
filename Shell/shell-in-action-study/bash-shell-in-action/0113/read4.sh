#!/bin/bash
# File: read4.sh
# Desc: read with time limit

echo "Pls input your message (5s): "
read -t 5 something
echo "Your input is $something"