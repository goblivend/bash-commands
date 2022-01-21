#!/bin/sh

# A command to create a java main class template
# 1st param : the class name
jclass() {
    if [ "$#" -eq "0" ] ; then
        echo "usage: jclass <class name>"
    else

        sh "/mnt/g/Data Ivan/code/Bash/bash-commands/bash_commands/javaclass.sh" $@

    fi
}

