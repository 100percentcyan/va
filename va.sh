#!/bin/bash
DESIRED_WALLET=$@
declare -a NW
ANOTHER_VALUE=0
declare -a vo
declare -a cv

default="-" && arrow="*->" && small_arrow="*>"
vo[3]=$default

declare -a DISPLAY
DISPLAY[$ANOTHER_VALUE]="$ANOTHER_VALUE${vo[3]}${NW[$ANOTHER_VALUE]}"


function reset_display {
          DISPLAY[$ANOTHER_VALUE]="$ANOTHER_VALUE${vo[3]}${NW[$ANOTHER_VALUE]}"
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

function chrg {
          ANOTHER_VALUE=${vo[4]}
          while [[ $ANOTHER_VALUE -le ${vo[5]} ]]
          do
          cv[$ANOTHER_VALUE]=$ANOTHER_VALUE
          (( ANOTHER_VALUE ++ ))
          done
          reset_another_value
          vo[3]=vo[4]
}

function dws {
          echo -e "$ANGEL#"
          while [[ $ANOTHER_VALUE -le $(($VALUE - 1)) ]]
          do
          reset_display
          echo ${DISPLAY[$ANOTHER_VALUE]}
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
