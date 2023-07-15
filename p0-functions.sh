create_parent_folder()
{
  # Practice
  if [[ ! -d "./$ptRoot" ]] && ([[ $1 == "first" ]] || [[ $1 == "pt" ]]); then
    mkdir $ptRoot
  fi

  # Ungraded
  if [ ! -d "./$ucRoot" ] && [ $1 == "uc" ]; then
    mkdir $ucRoot 
  fi

  # Graded
  if [ ! -d "./$gcRoot" ] && [ $1 == "ch" ]; then
    mkdir "$gcRoot"
  fi

  # Simulation
  if [ ! -d "./$slcRoot" ] && [ $1 == "slc" ]; then
    mkdir $slcRoot
  fi

  # Livecode
  if [ ! -d "./$lcRoot" ] && [ $1 == "lc" ]; then
    mkdir $lcRoot
  fi

  # Special Training
  if [ ! -d "./$stRoot" ] && [ $1 == "st" ]; then
    mkdir $stRoot
  fi
}

check_challenge_type()
{
  # CASE FROM FIRST COMMAND - Challenge Type
  case $1 in
    # ungraded challenge
    "uc")
      prefixCh="$ucPrefix$2"
      folderPath="$ucRoot/$ucPath$2"
      ;;
    # graded challenge
    "ch")
      prefixCh="$gcPrefix$2"
      folderPath="$gcRoot/$gcPath$2"
      ;;
    # practice challenge
    "pt")
      # first challenge git
      if [ $2 == "first-challenge" ]; then 
        prefixCh="fsjs-p0-first-challenge-git"
        folderPath="$ptRoot/first-challenge"
      else
        prefixCh="$ptPrefix$2"
        folderPath="$ptRoot/$ptPath$2"
      fi
      ;;
    # simulasi livecode
    "slc")
      prefixCh="$slcPrefix$2"
      folderPath="$slcRoot/$slcPath$2"
      ;;
    # livecode
    "lc")
      prefixCh="$lcPrefix$2"
      folderPath="$lcRoot/$lcPath$2"
      ;;
    # special training
    "st")
      prefixCh="$stPrefix$2"
      folderPath="$stRoot/$stPath$2"
      ;;
    # case invalid
    *)
      echo "invalid option $REPLY"
      ;;
  esac
}

validate_arguments()
{

  if [[ ! $1 || ! $2 ]]; then
    echo "Error! Need two arguments"
    exit
  fi

  commands=("pt" "uc" "ch" "slc" "lc" "st")
  if [[ ! " ${commands[*]} " =~ " $1 " ]]; then
    echo "Error! Challenge type must be pt uc ch slc lc or st"
    exit
  fi  
}

check_batch()
{
  if [ $1 ]; then
    batchName="$1"
  fi
}

check_student_list()
{
  if [[ $1 == "all" ]]; then
    students=$(cat "$studentsFile")
  else
    students=$(cat "$buddiesFile")
  fi
}

isFirst=false
check_root_folder()
{
  if [ $isFirst == false ]; then
    isFirst=true
    if [ ! -d "./$folderPath" ]; then
      echo "Folder doesn't exist. Creating now"
      mkdir ./$folderPath
      cd $folderPath
    else
      echo "Folder exists, remove it first"
      rm -rf ./$folderPath
      mkdir ./$folderPath
      cd $folderPath
    fi
    echo $'Folder created\n\n'
  fi
}

