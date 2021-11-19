
gctp() { 
    if [ "$#" -ne 1 ]; then
        echo "not a possible tp"
    else
        git clone "ivan.imbert@git.cri.epita.fr:p/2025-s3-tp/tp$1-ivan.imbert"
    fi
}
