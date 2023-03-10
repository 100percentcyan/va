#!/bin/bash
declare -a vo
BASIC_COLOR=$YELLOW && BG_BASIC_COLOR=$NO_COLOR
default="-" && arrow="*->" && small_arrow="*>" && drift_lights="$MAGENTA-*-" && tri_lines="$LIGHT_GRAY---" && blue_ellipses="$BLUE..." && green_ellipses="$GREEN..." && geo_comma="$BLUE,$GREEN,"
if [[ ${vo[9]} != "constant" ]]; then
vo[8]=$default
fi
if [[ ${vo[10]} != "num" && ${vo[10]} != "item" && ${vo[10]} != "num_sep" && ${vo[10]} != "item_sep" ]]; then
vo[10]="."
fi
vo[3]=${vo[8]}

function sws {
          echo "#!/bin/bash" >> ${vo[12]}
          echo ". va.sh ${vo[11]}" >> ${vo[12]}
}

function swg {
          echo "vo[8]='${vo[8]}'" >> ${vo[12]}
          echo "vo[9]='constant'" >> ${vo[12]}
}
function swv {
          echo "vo[10]=${vo[10]}" >> ${vo[12]}
}

function swr {
          echo "vo[4]=${vo[4]}" >> ${vo[12]}
          echo "vo[5]=${vo[5]}" >> ${vo[12]}
}
function swrs {
          echo "vo[6]='${vo[6]}'" >> ${vo[12]}
}
function swa {
          echo ${vo[13]} >> ${vo[12]}
}
function ra {
          sas && swc && swv && swr && swrs && swa
}
