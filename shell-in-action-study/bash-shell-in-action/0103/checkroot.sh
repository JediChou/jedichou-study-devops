#!/bin/bash

# 检查是否为超级用户
if [ $UID -ne 0 ]; then
  echo "Non root user. Please check again!"
else
  echo "Root user"
fi