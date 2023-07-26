#!/bin/sh

source p0-variables.sh
source p0-functions.sh

validate_arguments $1 $2 $3 $4
check_challenge_type $1 $2
check_student_list $3

echo $'START INSTALLING\n'
for element in $students
do
  echo "|| Installing $element... ||"
  (cd "$folderPath/$element" && npm install && cd ../../../) || echo "Failed to npm install $element"
  echo $'\n\n'
done
