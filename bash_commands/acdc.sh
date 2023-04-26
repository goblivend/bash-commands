# A command to git clone the tps of students with the given number
# (to update when changing the source path)
gcacdc() {
    if [ "$#" -ne 1 ]; then
        echo "Please specify the number of the tp"
    elif  [ "${#1}" -ne 2 ]; then
        echo "Please use a 2 digit number"
    else
        echo "cdto acdc"
        echo "cd "

        local logins="/mnt/g/Data Ivan/code/Bash/students login.txt"
        while read -r login; do
            echo "git clone \"ivan.imbert@git.cri.epita.fr:p/2025-s3-tp/tp$1-$login"
        done < "$logins"

        # for login in $(cat $($logins)); do
        #
        # done
    fi
}



#     while IFS= read -r line; do
#         curr=$(($line))
#         if [ $curr -gt $(($prev)) ] ; then
#             nb=$((nb+1))
#         fi
#         prev=$curr
#     done <"$1"
#     echo "$nb"