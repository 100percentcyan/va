#!/bin/bash
DESIRED_WALLET=$@
declare -a NW
declare -a RANGE_RECORD
declare -a SEPARATOR_RECORD
. va_init.sh
DISPLAY="$BASIC_COLOR$ANOTHER_VALUE${vo[3]}$BASIC_COLOR${NW[$ANOTHER_VALUE]}"

function reset_display {
          DISPLAY="$BASIC_COLOR$ANOTHER_VALUE${vo[3]}$BASIC_COLOR${NW[$ANOTHER_VALUE]}"
}

function display {
          echo -e $DISPLAY
}

function reset_another_value {
          ANOTHER_VALUE=0
}

function cws {
          echo -e "$CR#"
          for i in $DESIRED_WALLET;
          do
          NW[$VALUE]=$i && (( VALUE ++ )) && (( BACKUP_VALUE ++ ))
          done
}

function chrs {
          ANOTHER_VALUE=${vo[4]}
          while [[ $ANOTHER_VALUE -le ${vo[5]} ]]
          do
          RANGE_RECORD[$ANOTHER_VALUE]=$ANOTHER_VALUE
          (( ANOTHER_VALUE ++ ))
          done
          reset_another_value
          vo[3]=$default
}

function cfs {
          if [[ ${RANGE_RECORD[$ANOTHER_VALUE]} == $ANOTHER_VALUE && ${vo[4]} -le ${RANGE_RECORD[$ANOTHER_VALUE]} ]]; then
          vo[3]=${vo[6]}
          reset_display
          SEPARATOR_RECORD[$ANOTHER_VALUE]=${vo[6]}
          elif [[ ${SEPARATOR_RECORD[$ANOTHER_VALUE]} != "" && ${RANGE_RECORD[$ANOTHER_VALUE]} == $ANOTHER_VALUE && ${RANGE_RECORD[$ANOTHER_VALUE]} -le ${vo[4]} ]]; then
          vo[3]=${SEPARATOR_RECORD[$ANOTHER_VALUE]}
          reset_display
          else
          vo[3]=${vo[8]}
          reset_display
          fi
}

function cfd {
          case ${vo[10]} in
                    num)
                              DISPLAY="$BASIC_COLOR$ANOTHER_VALUE"
                              display
                              ;;
                    item)
                              DISPLAY="$BASIC${NW[$ANOTHER_VALUE]}"
                              display
                              ;;
                    num_sep)
                              DISPLAY="$BASIC_COLOR$ANOTHER_VALUE${vo[3]}$BASIC_COLOR"
                              display
                              ;;
                    item_sep)
                              DISPLAY="$BASIC_COLOR${vo[3]}$BASIC_COLOR${NW[$ANOTHER_VALUE]}"
                              display
                              ;;
                    .)
                              reset_display
                              display
                              ;;
          esac
}

function dws {
          echo -e "$ANGEL#"
          while [[ $ANOTHER_VALUE -le $(($VALUE - 1)) ]]
          do
          cfs
          cfd
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
         cfs
         cfd
         fi 
         (( ANOTHER_VALUE ++ ))
         done
         reset_another_value
}

function rp {
          NW[${vo[1]}]=${vo[2]} && echo ":replaced:"
}

function fsd {
          ANOTHER_VALUE=${vo[4]}
          VALUE=$((${vo[5]} + 1))
          dws
          VALUE=$(($BACKUP_VALUE + 1))
}

function ff {
          FOLDER=$(( ${vo[4]} - 1 ))
          FILE=${vo[4]}
          while [[ $FILE -le ${vo[5]} ]]
          do
          NW[$FILE]=${NW[$FOLDER]}/${NW[$FILE]}
          (( FILE ++ ))
          done
}

alias va_manual="display_green_ambush && cat va_manual.txt"
