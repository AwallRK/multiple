#!/bin/sh

source p0-variables.sh
source p0-functions.sh

validate_arguments $1 $2 $3 $4
check_challenge_type $1 $2
check_student_list $3

echo $'START ARCHIVING\n'
for element in $students
do
  
  echo "|| Archiving $element... ||"
  (cd "$folderPath/$element" && gh repo set-default $orgName/$prefixCh-$element && gh repo archive -y && cd ../../../) || echo "Failed to archive $element"
  echo $'\n\n'
done
