main=false
private=false
NAME="$1"
FILENAME="$1.java"
while getopts n:mp flag ; do
    echo $flag
    case ${flag} in
        n)
            NAME="$OPTARG"
            FILENAME="$OPTARG.java";;
        m)
            main=true
            echo ${OPTARG};;
        p)
            private=true
            echo ${OPTARG};;
        :)
            echo "$flag requires an argument";;
        *) echo "Got opt : '${OPTARG}' for the flag : '${flag}'";;
    esac
done
echo "#########"
echo ". ${NAME}"
echo ". ${FILENAME}"
echo ${main}
echo "#########"
if [ -f ${FILENAME} ]; then
    echo "jclass : The file '$FILENAME' already exists."
else

    #if  [[ $NAME =~ (([0-9]+.*)|(.*[.\/*\-+&é~\"#\'\{\(\[\`\|è_\\ç\^à@\)\]\}]+.*)) ]] ; then
    #    echo "jclass : The class '$NAME' contains forbidden characters."
    #else
        echo "##########"
        printf "// imports here\n\n" | tee ${FILENAME}
        if $private ; then
            printf "private " | tee -a ${FILENAME}
        else
            printf "public " | tee -a ${FILENAME}
        fi
        printf "class %s {\n" $NAME | tee -a ${FILENAME}
        if $main ; then
            printf "\tpublic static main(String[] args) {\n\t\t\n\t}\n" | tee -a ${FILENAME}
        fi

        printf "}\n" | tee -a ${FILENAME}
    #fi
fi