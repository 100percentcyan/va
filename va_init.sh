#!/bin/bash
declare -a vo
default="-" && arrow="*->" && small_arrow="*>" && drift_lights="$MAGENTA-*-" && tri_lines="$WHITE---"
if [[ ${vo[9]} != "constant" ]]; then
vo[8]=$default
fi
vo[3]=${vo[8]}
