# COMMAND

# How to use
- Go look variables from ```p0-variables.sh``` first.
You can change some variable.
- Change ```batchName``` in ```p0-variables.sh``` to your github classroom organization
- Write your buddies github username in file that have named like ```buddiesFile``` from ```p0-variables.sh```
- Write all student github username in file that have named like ```studentsFile``` from ```p0-variables.sh```

# How to run
You can run from ```main.sh``` to choose from options
```
bash main.sh <$4>
```

If you want to run 1 file, for example if you want to run ```p0-clone.sh``` only you can run with:
```
bash p0-clone.sh <$1> <$2> <$3> <$4>
```

## $1
Challenge type
- uc -> ungraded challenge
- ch -> graded challenge
- pt -> practice
- slc -> simulation livecode
- lc - livecode
- st - special training

## $2
Challenge name
- Practice without practice, example: "Algoritma-and-Pseudocode"
- Ungraded/graded/slc/lc/st, example: 1 , 2 , 3
- notes: for first challenge git use "first-challenge"

## $3
Student list
- buddy -> buddy only
- all -> all student

## $4
Github organization classroom name
