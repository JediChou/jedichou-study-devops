#!/bin/bash
# File: time_take.sh
start=$(date +%s)
sleep 3
end=$(date +%s)
diff=$((end-start))
echo Time: $diff seconds