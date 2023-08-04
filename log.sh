#!/bin/sh

# LOG
# if [[ ! -d "./Logs" ]]; then
#   mkdir "Logs"
# fi
# cd "./Logs"
now=$(date)
IFS=' ' read -r day month date time zone year <<< "$now"
# echo $date $month $year $day 
# printf "Current date in dd/mm/yyyy format %s\n" "$now"
# echo $now
if [[ ! -d "./Logs" ]]; then
  mkdir "Logs"
fi
pt="./Logs/$year""_$month""_$date.txt"
# echo $pt
if [[ ! -f "$pt" ]]; then
  echo "===========================" > "$pt"
  echo $now >> "$pt"
  echo $'===========================\n' >> "$pt"

  echo "START" >> "$pt"
else
  echo "===========================" >> "$pt"
  echo $now >> "$pt"
  echo $'===========================\n' >> "$pt"
fi

bash "$1" "$2" "$3" "$4" "$5" >> "$pt" | while IFS= read -r line; do
  echo "$line" >> "$pt"
done


# if [[ ! -f "log.txt" ]]; then
#   echo "START" > log.txt
# fi
# bash main.sh 2>&1 | while IFS= read -r line; do
#   echo $line
#   echo $line >> log.txt
# done


# readarray -t lines < <(command)
# for $line in "${lines[@]}"; do
#   # do-something-with "$line"
#   echo $line
# done

# echo "test"
# while IFS= read -r line; do
#   echo "$line"
#   echo "telala"
# done <<<$output
# echo $output
# echo "test2"

# readarray -t lines < <(echo "test")
# for line in "${lines[@]}"; do
#   echo "$line"
# done

# while IFS= read -r line; do
#   echo "$line"
#   echo "telala"
# done <<<$output
# echo $output
# echo "test2"

# echo $(date)
# the_date=$(date)
# echo "The current date is ${the_date}. What a time to be alive!"


# OUTPUT=""
# Log
# if [[ ! -d "./Logs" ]]; then
#   mkdir "Logs"
# fi
# cd "./Logs"
# if [[ ! -f "log.txt" ]]; then
#   echo "START" > log.txt
# fi
# bash main.sh 2>&1 | while IFS= read -r line; do
#   echo $line
#   echo $line >> log.txt
#   # OUTPUT+=$line
#   # OUTPUT+=" test"
#   # OUTPUT+=""
# done
# echo $OUTPUT

# # echo "result" && echo ""

# t="AAAA"
# out=''
# out+="test"$'\n'$t$'\n'
# out+='b'
# echo "$out"

# str=$'test\na'
# echo "$str"

# echo "a"

# SOURCES="a b c d e"
# DESTINATIONS=""

# for src in $SOURCES
# do
#   echo Input destination to associate to the source $src:
#   read dest
#   DESTINATIONS+=" ${dest}"
# done
# echo $DESTINATIONS


