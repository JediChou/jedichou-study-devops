#!/bin/bash
#Usage: bc

#浮点数运算
no=54
result=`echo "$no * 1.5" | bc`
echo $result

#设定小数精度
echo "scale=2;8/3" | bc

#进制转换
no1=100
echo "obase=2; $no1" | bc
no2=1100100
echo "obase=10; ibase=2; $no2" | bc

#计算平方及平方根
echo "sqrt(100)" | bc
echo "10^10" | bc