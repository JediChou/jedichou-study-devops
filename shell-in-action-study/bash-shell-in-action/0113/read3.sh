#!/bin/bash
# File: read3.sh
# Desc: use read with message and accept user input

echo "Pls input you first name and last name."
read -p "Your first name: " firstname
read -p "You last name: " lastname
echo "OK, We accept your input. Full name is: $firstname $lastname"
