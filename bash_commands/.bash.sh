#!/bin/bash

# A command to open the explorer in the working directory
alias go="explorer.exe ."

# A command to add the current path as a shortcut to the cdto command file
addpath() {
    # Get the path of the current script
    SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

    name=$1
    path=$(pwd)
    cdto_path="$SCRIPT_DIR/.bash.sh"
    if [ -z "$name" ]; then
        echo "No name given, using $path"
    else
        # Executing the python file to add the shortcut
        python3 "$SCRIPT_DIR/addpath.py" "$path" "$name" "$cdto_path"
        source "$cdto_path"
    fi
}

# A command to delete the path with the given name from the .bash.sh file
delpath() {
    # Get the path of the current script
    SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
    name=$1
    cdto_path="$SCRIPT_DIR/.bash.sh"

    # Check if the first arg exists
    if [ -z "$name" ]; then
        echo "No name given, using $path"
    else
        # Executing the python file to add the shortcut
        python3 "$SCRIPT_DIR/delpath.py" "$name" "$cdto_path"
        source "$cdto_path"
    fi
}

# A command to easily navigate in different directories
cdto() {
    if [ "$#" -eq "0" ] ; then
        echo "Specify where you want to go"
    else
        case $1 in
            "prog")
                cd "/mnt/g/Data Ivan/cours/épita/Prépa/Prog/"
                ;;
            "cours")
                cd "/mnt/g/Data Ivan/cours/"
                ;;
            "s4")
                cd "/mnt/g/Data Ivan/cours/épita/Prépa/S4 inter/"
                ;;
            "algo")
                cd "/mnt/g/Data Ivan/cours/épita/Prépa/Algo/"
                ;;
            "tp")
                cd "/mnt/g/Data Ivan/cours/épita/Prépa/Prog/C/"
                ;;
            "code")
                cd "/mnt/g/Data Ivan/code/"
                ;;
            "c")
                cd "/mnt/g/Data Ivan/code/C/"
                ;;
            "ocr")
                cd "/mnt/g/Data Ivan/cours/épita/Prépa/Prog/Project S3 Sudoku OCR/OCR_C/"
                ;;
            "mc")
                cd "/mnt/g/Data Ivan/minecraft/"
                ;;
            "bash")
                cd "/mnt/g/Data Ivan/code/Bash/bash-commands/bash_commands/"
                ;;
            "java")
                cd "/mnt/g/Data Ivan/code/Java"
                ;;
            "cs")
                cd "/mnt/g/Data Ivan/code/C#"
                ;;
            "hackathon")
                cd "/mnt/g/Data Ivan/code/Hackathon"
                ;;
            "python")
                cd "/mnt/g/Data Ivan/code/Python"
                ;;
            "js")
                cd "/mnt/g/Data Ivan/code/JS"
                ;;
            "web")
                cd "/mnt/g/Data Ivan/code/Web/Website #1/website/"
                ;;
            "modded")
                cd "/mnt/c/Users/ivani/AppData/Roaming/Minecraft/Instances/"
                ;;
			"data")
				cd "/mnt/g/Data Ivan"
				;;
			"oom")
				cd "/mnt/g/Data Ivan/cours/épita/Prépa/S4 inter/Finland/OOM"
				;;
            "acdc")
				cd "/mnt/g/Data Ivan/cours/épita/ACDC"
				;;
			"ing1")
				cd "/mnt/g/Data Ivan/cours/épita/Ing1"
				;;
			"acdcode")
				cd "/mnt/g/Data Ivan/code/ACDC"
				;;
			"acdc")
				cd "/mnt/g/Data Ivan/cours/épita/ACDC"
				;;
            *)
                echo "not a known path : '$1', tring local path"
                cd $1
                ;;
        esac
    fi
}

declare -a COMMANDS=( prog algo tp code c  ocr mc bash web java cours s4 js python hackathon cs modded data oom ing1 acdcode acdc)

if [[ -n $COMP_LINE ]]; then
    for arg in "${COMMANDS[@]}"; do
        [[ ${arg:0:${#2}} = "${2,,}" ]] && echo "$arg"
    done
    exit
fi
