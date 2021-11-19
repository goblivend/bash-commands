
alias test='echo test'

cdto() {
    if [ "$#" -eq "0" ] ; then
        echo "No param"
    elif [ "$1" = "prog" ] ; then
        #echo "Moving to Prog"
        cd "/mnt/g/Data Ivan/cours/épita/Prog/"
    elif [ "$1" = "algo" ] ; then
        #echo "Moving to Algo"
        cd "/mnt/g/Data Ivan/cours/épita/Algo/"
    elif [ "$1" = "tp" ] ; then
        #echo "Moving to tp"
        cd "/mnt/g/Data Ivan/cours/épita/Prog/C/"
    elif [ "$1" = "code" ] ; then
        #echo "Moving to code"
        cd "/mnt/g/Data Ivan/code/"
    elif [ "$1" = "c" ] ; then
        #echo "Moving to code/c"
        cd "/mnt/g/Data Ivan/code/C/"
    elif [ "$1" = "data" ] ; then
        #echo "Moving to Data Ivan"
        cd "/mnt/g/Data Ivan/"
    elif [ "$1" = "ocr" ] ; then
        #echo "Moving to OCR"
        cd "/mnt/g/Data Ivan/cours/épita/Prog/Project S3 Sudoku OCR/OCR_C/"
    else
        echo "not a known path : '$path'"
    fi
}
