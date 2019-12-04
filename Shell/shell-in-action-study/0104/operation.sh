#!/bin/bash
#三种运算方式
no1=4
no2=5

let result1=no1+no2
echo $result1

result2=$[no1 + no2]
echo $result2

result3=`expr $no1 + $no2`
echo $result3
