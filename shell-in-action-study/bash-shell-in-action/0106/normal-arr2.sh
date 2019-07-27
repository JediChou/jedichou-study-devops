#!/bin/bash

array_var=(1 2 3 4 5 6) #不要有空格

echo "获取特定索引的数组元素内容 [0]:" ${array_var[0]}
echo "获取特定索引的数组元素内容 [5]:" ${array_var[5]}
echo "数组元素:" ${array_var[*]}
echo "数组元素:" ${array_var[@]}
echo "数组长度:" ${#array_var[*]}