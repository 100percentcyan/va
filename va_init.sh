#!/bin/bash
declare -a vo
default="-" && arrow="*->" && small_arrow="*>" && drift_lights="$MAGENTA-*-"
if [[ ${vo[9]} != "constant" ]]; then
vo[8]=$default
fi
vo[3]=${vo[8]}
