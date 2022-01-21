#!/bin/sh

# A command to create a java main class template
# 1st param : the class name
jmain() {
    if [ "$#" -eq "0" ] ; then
        echo "usage: jmain <class name>"
    else

        sh ./javaclass.sh $@

    fi
}

