#!/bin/bash
# file name: setpath.sh
# Author: Jedi Chou, 2016.3.23 17:48
# Ref: Packt Linux Shell Cookbook zh-cn, page 25

# Lab: echo $PATH ENV variable
echo "You can use echo to display local PATH environment variables"
echo $PATH

# Lab: echo $PATH ENV variable, and use tr command replace
# ':' to '\n'. The ouput result keep a simple format.
echo "Ofcouse, You can use cat ... | tr ... to do same thing."
echo $PATH | tr ':' '\n'

# OK, let move to next station!

# Lab: set a http_proxy variable, and add it to current
# environment.
HTTP_PROXY=http://192.168.0.2:3128
export HTTP_PROXY=$HTTP_PROXY
echo $HTTP_PROXY
