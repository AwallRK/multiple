#!/bin/sh

source p0-variables.sh
source p0-functions.sh

validate_arguments $1 $2 $3 $4
check_batch $4
create_parent_folder $1
check_student_list $3

echo $'START CLONING\n'
for element in $students
do
  check_challenge_type $1 $2
  check_root_folder
  echo "|| Cloning $element into folder $folderPath ||"

  if [ $2 == "first-challenge" ];then
    git clone https://github.com/$orgName/$prefixCh-$element
  elif [ $1 == "pt" ]; then
    git clone https://github.com/$practiceOrgName/$prefixCh-$element
  elif [ $1 == "thr" ]; then
    git clone https://github.com/$orgName/$prefixCh-$element
  else
    git clone https://github.com/$orgName/$prefixCh-$element
  fi
  mv ./$prefixCh-$element ./$element
  echo $'Done clone '"$element"$'\n\n'
done
