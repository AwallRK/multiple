# README
Multiple git clone github classroom.

## How to use
Look variables from ```p0-variables.sh``` first.
- Change ```batchName``` to your github classroom organization.

Add some file and assign it with some data.
- Assign your buddies github username in file that have named like ```buddiesFile value```  from ```p0-variables.sh```
- Assign all student github username in file that have named like ```studentsFile value``` from ```p0-variables.sh```

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
Github organization classroom name (optional). Change default value in variable ```batchName``` from ```p0-variables.sh```
