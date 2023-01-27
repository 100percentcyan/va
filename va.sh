#!/bin/bash
DESIRED_WALLET=$@
declare -a NW
ANOTHER_VALUE=0
DISPLAY="$ANOTHER_VALUE-${NW[$ANOTHER_VALUE]}"
declare -a vo
function reset_display {
          DISPLAY="$ANOTHER_VALUE-${NW[$ANOTHER_VALUE]}"
}
function reset_another_value {
          ANOTHER_VALUE=0
}

function cws {
          echo -e "$CR#"
          for i in $DESIRED_WALLET;
          do
          NW[$VALUE]=$i && (( VALUE ++ ))
          done
}

function dws {
          echo -e "$ANGEL#"
          while [[ $ANOTHER_VALUE -le $(($VALUE - 1)) ]]
          do
          reset_display
          echo $DISPLAY
          (( ANOTHER_VALUE ++ ))
          done
          reset_another_value
          reset_display
}

function gv {
         display_green_ambush
         while [[ $ANOTHER_VALUE -le $(($VALUE - 1)) ]]
         do
         if [[ ${NW[$ANOTHER_VALUE]} == ${vo[0]} || $ANOTHER_VALUE == ${vo[0]} ]]; then
         reset_display
         echo $DISPLAY
         fi 
         (( ANOTHER_VALUE ++ ))
         done
         reset_another_value
}

function rp {
          NW[${vo[1]}]=${vo[2]} && echo ":replaced:"
}

alias va_manual="display_green_ambush && cat va_manual.txt"
