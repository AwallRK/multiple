#!/bin/sh

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

run_script()
{
  scriptName=$1
  act=$2
  organization=$3
  read -p "Enter challenge number/name: " challenge
  if [[ "$challenge" == *","* ]]; then
    IFS=','
    read -a challenges <<< "$challenge"
    for val in "${challenges[@]}";
    do
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
    bash $scriptName $challengeType $challenge $student $organization
    echo "FINISH-$act-$student"
  fi
}

main()
{
  organization=$1
  PS3='Please enter your choice: '
  options=("clone" "archive" "unarchive" "install" "test" "cancel")
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