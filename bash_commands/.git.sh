#!/bin/bash

# Create a command to only add modified files
alias gitadd="git ls-files --modified | xargs git add"



# A command to git clone the tp with the given number (to update when changing
# the source path)
gctp() { 
    if [ "$#" -ne 1 ] || [ "${#1}" -ne 2 ]; then
        echo "not a possible tp"
    else
        git clone "ivan.imbert@git.cri.epita.fr:p/2025-s3-tp/tp$1-ivan.imbert"
    fi
}
