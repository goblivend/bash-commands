
gctp() { 
    echo $#
    if [[ "$#"!="1" ]]; then
        echo "not a possible tp"
    else
        echo "test"
        local string="git clone ivan.imbert@git.cri.epita.fr:p/2025-s3-tp/tp0"
        echo "${string}"
        
        string+="$1"
        echo "$string"
    
        string+="-ivan.imbert"
        echo "$string"
    fi
}
