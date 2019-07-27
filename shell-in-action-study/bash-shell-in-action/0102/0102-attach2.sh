#!/bin/bash

# 打印彩色输出
echo
echo "colorful output:"
echo -e "\e[1;31m This is test text \e[0m"
echo -e "\e[1;32m This is test text \e[0m"
echo -e "\e[1;33m This is test text \e[0m"
echo -e "\e[1;34m This is test text \e[0m"
echo -e "\e[1;35m This is test text \e[0m"
echo -e "\e[1;36m This is test text \e[0m"
echo -e "\e[1;37m This is test text \e[0m"

# 打印彩色背景输出
echo
echo "colorful backgroud output:"
echo -e "\e[1;41m This is test text \e[0m"
echo -e "\e[1;42m This is test text \e[0m"
echo -e "\e[1;43m This is test text \e[0m"
echo -e "\e[1;44m This is test text \e[0m"
echo -e "\e[1;45m This is test text \e[0m"
echo -e "\e[1;46m This is test text \e[0m"
echo -e "\e[1;47m This is test text \e[0m"

# 嵌套的使用
echo
echo "mix output:"
echo -e "\e[1;42m \e[1;37mThis \e[1;33mis \e[1;34mtest \e[1;35mtext \e[0m"