#!/bin/sh
source p0-variables.sh

choose_students()
{
  PS3='Please choose! For all student or buddy only: '
  options2=("buddy" "all")
  select opt2 in "${options2[@]}"
  do
    case $opt2 in
      "buddy")
        student="$opt2"
        break
        ;;
      "all")
        student="$opt2"
        break
        ;;
    esac
  done
  echo ""
}

choose_challenge()
{
  PS3='Please choose the challenge: '
  options2=("first-challenge" "graded" "ungraded" "practice" "simulation" "livecode" "special-training")
  select opt in "${options2[@]}"
  do
    case $opt in
      "first-challenge")
        echo $'\nplease write "first-challenge" when ask for challenge number\n'
        challengeType="pt"
        break
        ;;
      "graded")
        challengeType="ch"
        break
        ;;
      "ungraded")
        challengeType="uc"
        break
        ;;
      "practice")
        challengeType="pt"
        break
        ;;
      "simulation")
        challengeType="slc"
        break
        ;;
      "livecode")
        challengeType="lc"
        break
        ;;
      "special-training")
        challengeType="st"
        break
        ;;
    esac
  done
  echo ""
}

check_practice_challenge()
{
  local challenge=""
  PS3="Please choose the practice challenge: "
  options2=("first-challenge" "Algoritma-and-Pseudocode" "Calculate-Circumference" "Newton-Second-Law" "Progate-Course-Javascript-1-to-2" "Basic-Conditional-Javascript" "Advance-Conditional" "Gatcha" "Basic-Loop" "Laundry-Day" "Nested-Loop" "Functions" "Array" "Array-Multi" "Modular-Function" "Object" "Progate-Course-HTML-CSS" "Menghias-HTML-dengan-CSS")
  select opt in "${options2[@]}"
  do
    case $opt in
      "first-challenge" | "Algoritma-and-Pseudocode" | "Calculate-Circumference" | "Newton-Second-Law" | "Progate-Course-Javascript-1-to-2" | "Basic-Conditional-Javascript" | "Advance-Conditional" | "Gatcha" | "Basic-Loop" | "Laundry-Day" | "Nested-Loop" | "Functions" | "Array" | "Array-Multi" | "Modular-Function" | "Object" | "Progate-Course-HTML-CSS" | "Menghias-HTML-dengan-CSS")
        challenge=$opt
        echo "$opt"
        break
        ;;
      *)
        echo "Invalid"
        break
        ;;
    esac
  done
}

choose_delete_folder()
{
  PS3='Please choose folder: '
  options2=("$ptRoot" "$ucRoot" "$gcRoot" "$slcRoot" "$lcRoot" "$stRoot" "all")
  select opt2 in "${options2[@]}"
  do
    case $opt2 in
      "$ptRoot" | "$ucRoot" | "$gcRoot" | "$slcRoot" | "$lcRoot" | "$stRoot")
        (echo "Removing $opt2" && rm -rf "$opt2" && echo "Success removing $opt2") || echo "Error! when removing folder $opt2"
        break
        ;;
      "all")
        (echo "Removing practice folder" && rm -rf "$ptRoot") || echo "Error! when removing folder practice"
        (echo "Removing ungraded folder" && rm -rf "$ucRoot") || echo "Error! when removing folder ungraded"
        (echo "Removing graded folder" && rm -rf "$gcRoot") || echo "Error! when removing folder graded"
        (echo "Removing livecode folder" && rm -rf "$lcRoot") || echo "Error! when removing folder livecode"
        (echo "Removing simulasi livecode folder" && rm -rf "$slcRoot") || echo "Error! when removing folder simulasi livecode"
        (echo "Removing special training folder" && rm -rf "$stRoot") || echo "Error! when removing folder special training"
        break
        ;;
    esac
  done
  echo ""
}

run_script()
{
  scriptName=$1
  act=$2
  organization=$3
  if [ $challengeType == "pt" ]; then
    challenge="$(check_practice_challenge)"
  else
    read -p "Enter challenge number/name: " challenge
  fi
  if [[ "$challenge" == *","* ]]; then
    IFS=','
    read -a challenges <<< "$challenge"
    for val in "${challenges[@]}"; do
      echo "=============================="
      echo "|| START-$act-$student FOR CHALLENGE $val ||"
      echo "=============================="
      bash $scriptName $challengeType $val $student $organization
      echo "=============================="
      echo "|| FINISH-$act-$student FOR CHALLENGE $val ||"
      echo '==============================\n\n'
    done
  else
    echo "START-$act-$student"
    if [[ "$isLogging" == false ]]; then
      bash $scriptName $challengeType $challenge $student $organization
    else
      bash log.sh $scriptName $challengeType $challenge $student $organization
    fi
    echo "FINISH-$act-$student"
  fi
}

main()
{
  organization=$1
  PS3='Please enter your choice: '
  options=("clone" "archive" "unarchive" "install" "test" "cancel" "clear-folder")
  select opt in "${options[@]}"
  do
    echo ""
    case $opt in
      "clone")
        choose_students
        choose_challenge
        run_script "p0-clone.sh" "CLONING" $organization
        break
        ;;
      "archive")
        choose_students
        choose_challenge
        run_script "p0-archive.sh" "ARCHIVING" $organization
        break
        ;;
      "unarchive")
        choose_students
        choose_challenge
        run_script "p0-unarchive.sh" "UNARCHIVING" $organization
        break
        ;;
      "install")
        choose_students
        choose_challenge
        run_script "p0-install.sh" "INSTALLING" $organization
        break
        ;;
      "test")
        choose_students
        choose_challenge
        run_script "p0-test.sh" "TESTING" $organization
        break
        ;;
      "clear-folder")
        choose_delete_folder
        break
        ;;
      "cancel")
        break
        ;;
      *) echo "invalid option $REPLY";;
    esac
  done
}

# Variables
student=""
challengeType=""
main $1