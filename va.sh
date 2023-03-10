#!/bin/bash
DESIRED_WALLET=$@
declare -a NW
ANOTHER_VALUE=0
declare -a cv
declare -a sth
. va_init.sh
DISPLAY="$ANOTHER_VALUE${vo[3]}$BG_BASIC_COLOR$BASIC_COLOR${NW[$ANOTHER_VALUE]}"

function reset_display {
          DISPLAY="$ANOTHER_VALUE${vo[3]}$BASIC_COLOR${NW[$ANOTHER_VALUE]}"
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
          cv[$ANOTHER_VALUE]=$ANOTHER_VALUE
          (( ANOTHER_VALUE ++ ))
          done
          reset_another_value
          vo[3]=$default
}

function cfs {
          if [[ ${cv[$ANOTHER_VALUE]} == $ANOTHER_VALUE && ${vo[4]} -le ${cv[$ANOTHER_VALUE]} ]]; then
          vo[3]=${vo[6]}
          reset_display
          sth[$ANOTHER_VALUE]=${vo[6]}
          elif [[ ${sth[$ANOTHER_VALUE]} != "" && ${cv[$ANOTHER_VALUE]} == $ANOTHER_VALUE && ${cv[$ANOTHER_VALUE]} -le ${vo[4]} ]]; then
          vo[3]=${sth[$ANOTHER_VALUE]}
          reset_display
          else
          vo[3]=${vo[8]}
          reset_display
          fi
}

function cfd {
          case ${vo[10]} in
                    num)
                              echo $ANOTHER_VALUE
                              ;;
                    item)
                              echo -e ${NW[$ANOTHER_VALUE]}
                              ;;
                    num_sep)
                              echo -e "$ANOTHER_VALUE${vo[3]}$BASIC_COLOR"
                              ;;
                    item_sep)
                              echo -e "${vo[3]}$BASIC_COLOR${NW[$ANOTHER_VALUE]}"
                              ;;
                    .)
                              echo -e $DISPLAY
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
         BASIC_COLOR=$GREEN
         while [[ $ANOTHER_VALUE -le $(($VALUE - 1)) ]]
         do
         if [[ ${NW[$ANOTHER_VALUE]} == ${vo[0]} || $ANOTHER_VALUE == ${vo[0]} ]]; then
         cfs
         cfd
         fi 
         (( ANOTHER_VALUE ++ ))
         done
         reset_another_value
         BASIC_COLOR=$YELLOW
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


alias va_manual="display_green_ambush && cat va_manual.txt"
