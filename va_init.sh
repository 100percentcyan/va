#!/bin/bash
declare -a vo
default="-" && arrow="*->" && small_arrow="*>" && drift_lights="$MAGENTA-*-" && tri_lines="$WHITE---" && blue_ellipses="$BLUE..."
if [[ ${vo[9]} != "constant" ]]; then
vo[8]=$default
fi
if [[ ${vo[10]} != "num" && ${vo[10]} != "item" && ${vo[10]} != "num_sep" && ${vo[10]} != "item_sep" ]]; then
vo[10]="."
fi
vo[3]=${vo[8]}
