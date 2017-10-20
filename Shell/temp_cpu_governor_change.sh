#!/bin/bash
DiR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NOFCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
START='/sys/devices/system/cpu/cpu'
END='/cpufreq/scaling_governor'
declare -a ORiGOVS
for ((i=0;i < NOFCPU;i++))
{
	j=$START$i$END
	ORiGOVS[$i]=$(cat $j)
}
for ((i=0;i < NOFCPU;i++))
{
	j=$START$i$END
	echo performance > $j
}

# program you want to run with high performance

for ((i=0;i < NOFCPU;i++))
{
	j=$START$i$END
	echo ${ORiGOVS[$i]} > $j
}
