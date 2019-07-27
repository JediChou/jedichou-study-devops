#!/bin/bash

# 定义关联数组
declare -A girls_array
girls_array[1001]='Sarah'
girls_array[1002]='Sammi'

# 其他用法基本和编程里的hash相同
echo ${girls_array[1001]}
echo ${girls_array[1002]}
echo ${girls_array[*]}
echo ${girls_array[@]}
echo ${#girls_array[*]}

# 列出索引
echo ${!girls_array[*]}
echo ${!girls_array[@]}