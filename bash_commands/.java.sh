#!/bin/bash

isvalidname(){
    case $NAME in
        *" "*)
            return 1;;
        *"."*)
            return 1;;
        *"\t"*)
            return 1;;
        *)
            return 0;;
    esac
}


# A command to create a java main class template
# 1st param : the class name
jmain() {
    if [ "$#" -eq "0" ] ; then
        echo "usage: jmain <class name>"
    else

        main=false
        private=false
        NAME="$1"
        FILENAME="$1.java"
        while getopts m flag; do
            case ${flag} in
                m) main=true
                    echo ${OPTARG}
                    NAME="${OPTARG}"
                    FILENAME="${OPTARG}.java";;
                p) private=true
                    echo ${OPTARG}
                    NAME="${OPTARG}"
                    FILENAME="${OPTARG}.java";;
            esac
        done
        echo ${NAME}
        echo ${FILENAME}
        echo ${main}
        echo ${private}
        if [ -f ${FILENAME} ]; then
            echo "jmain : The file '$1.java' already exists."
        else

            #if  [[ $NAME =~ (([0-9]+.*)|(.*[.\/*\-+&é~\"#\'\{\(\[\`\|è_\\ç\^à@\)\]\}]+.*)) ]] ; then
            #    echo "jmain : The file '$1.java' contains forbidden characters."
            #else
                echo "##########"
                printf "// imports here\n\n" | tee ${FILENAME}
                if $private ; then
                    printf "private " | tee -a ${FILENAME}
                else
                    printf "public " | tee -a ${FILENAME}
                fi
                printf "class %s {\n" $1 | tee -a ${FILENAME}
                if $main ; then
                    printf "\tpublic static main(String[] args) {\n\t\t\n\t}\n" | tee -a ${FILENAME}
                fi

                printf "}\n" | tee -a ${FILENAME}
            #fi
        fi
    fi
}

