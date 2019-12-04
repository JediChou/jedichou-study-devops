#!/bin/bash

array_var[0]="test1"
array_var[1]="test2"
array_var[2]="test3"
array_var[3]="test4"
array_var[4]="test5"
array_var[5]="test6"

echo "获取特定索引的数组元素内容 [0]:" ${array_var[0]}
echo "获取特定索引的数组元素内容 [5]:" ${array_var[5]}
echo "数组元素:" ${array_var[*]}
echo "数组元素:" ${array_var[@]}
echo "数组长度:" ${#array_var[*]}