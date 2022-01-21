#!/bin/bash

# A command to open the explorer in the working directory
alias go="explorer.exe ."

# A command to easily navigate in different directories
cdto() {
    if [ "$#" -eq "0" ] ; then
        echo "No param"
    else
        case $1 in
            "prog")
                #echo "Moving to Prog"
                cd "/mnt/g/Data Ivan/cours/épita/Prog/"
                ;;
            "algo")
                #echo "Moving to Algo"
                cd "/mnt/g/Data Ivan/cours/épita/Algo/"
                ;;
            "tp")
                #echo "Moving to tp"
                cd "/mnt/g/Data Ivan/cours/épita/Prog/C/"
                ;;
            "code")
                #echo "Moving to code"
                cd "/mnt/g/Data Ivan/code/"
                ;;
            "c")
                #echo "Moving to code/c"
                cd "/mnt/g/Data Ivan/code/C/"
                ;;
            "data")
                #echo "Moving to Data Ivan"
                cd "/mnt/g/Data Ivan/"
                ;;
            "ocr")
                #echo "Moving to OCR"
                cd "/mnt/g/Data Ivan/cours/épita/Prog/Project S3 Sudoku OCR/OCR_C/"
                ;;
            "mc")
                #echo "Moving to Minecraft"
                cd "/mnt/g/Data Ivan/minecraft/"
                ;;
            "bash")
                #echo "Moving to Bash files"
                cd "/mnt/g/Data Ivan/code/Bash/bash-commands/bash_commands/"
                ;;
            "java")
                #echo "Moving to Java files"
                cd "/mnt/g/Data Ivan/code/Java"
                ;;
            "web")
                #echo "Moving to new Website"
                cd "/mnt/g/Data Ivan/code/Web/Website #1/website/"
                ;;
            *)
                echo "not a known path : '$1'"
                ;;
        esac
    fi
}

declare -a COMMANDS=(prog algo tp code c data ocr mc bash web java)

if [[ -n $COMP_LINE ]]; then
    for arg in "${COMMANDS[@]}"; do
        [[ ${arg:0:${#2}} = "${2,,}" ]] && echo "$arg"
    done
    exit
fi
