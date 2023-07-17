#!/bin/sh

source p0-variables.sh
source p0-functions.sh

validate_arguments $1 $2 $3 $4
check_challenge_type $1 $2
check_student_list $3

echo $'START Checking\n'
for element in $students
do
  echo "Checking $element..."
  (cd "$folderPath/$element" && npm run test && cd ../../../) || echo "Failed to npm run test $element"
  echo $'\n\n'
done
