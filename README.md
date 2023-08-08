# README
Multiple git clone github classroom.

## How to use 
Look variables from ```p0-variables.sh``` first.
- Change ```orgName``` to your github classroom organization.
- Change ```practiceOrgName``` to practice github classroom organization.
- Change ```challengeVersion``` to challenge problem set, example: ```"v1"``` for set 1

Add some file and assign it with some data.
- Assign your buddies github username in file that have named like ```buddiesFile value``` (example: ```list_buddy.txt```)  from ```p0-variables.sh```
- Assign all student github username in file that have named like ```studentsFile value``` (example: ```list_students.txt```) from ```p0-variables.sh```

For archive and unarchive challenge, please install github cli first.
- Install github cli: https://cli.github.com/manual/installation
- Login github cli: https://cli.github.com/manual/gh_auth_login


## How to run
You can run from ```main.sh``` to choose from options
```
bash main.sh <$4-optional>
```

If you want to run 1 file, for example if you want to run ```p0-clone.sh``` only you can run with:
```
bash p0-clone.sh <$1> <$2> <$3-optional> <$4-optional>
```

## Arguments
### $1
Challenge type
- ```uc``` -> Ungraded Challenge
- ```ch``` -> Graded Challenge
- ```pt``` -> Practice Challenge
- ```slc``` -> Simulation Livecode
- ```lc``` -> Livecode
- ```st``` -> Special Training

notes: First challenge git use ```pt``` as challenge type

### $2
Challenge name.
- Practice challenge, you can write it <strong>without prefix practice</strong>, for example: ```Algoritma-and-Pseudocode``` .
- Ungraded / graded / slc / lc / st, you can write number only. example: ```1``` , ```2``` , ```3```, etc..
- If you want to apply to multiple challenge just add "," between challenge.
example: ```5,6,7```

notes: First challenge git use ```first-challenge``` as challenge name

### $3
Student list (optional).
- ```buddy``` -> buddy only (default)
- ```all``` -> all student

### $4
Github organization classroom name (optional). Change default value in variable ```orgName``` from ```p0-variables.sh```


## Variables
### Prefix Repo Challenge
Prefix challenge from repository in github classroom. Example: graded challenge 2 repository ```fsjs-p0-v3-ch2``` -> ```chPrefix``` + ```2```

### Parent folder name
Parent folder that group by challenge type. Example: practice challenge repository will have path like this ```./[RootFolder]/Practice-name-challenge```. ```RootFolder``` will have value from variable ```$ptRoot```

### Folder name that include challenge
Folder challenge name that include students repo. Example: ```./Practice/[PracticeFolderName]```. ```PracticeFolderName``` will have value from variabel ```$ptPath```
