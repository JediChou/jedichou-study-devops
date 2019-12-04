#!/bin/bash
function DEBUG()
{
    [ "$_DEBUG" == "on" ] && $@ || :
}

for i in {1..10}
do
    echo "Normal output: $i"
    DEBUG echo "Debug output$i"
done

# 这种调试是无法打断点的!
# 但这个Debug函数还是非常好用的，值得推荐使用