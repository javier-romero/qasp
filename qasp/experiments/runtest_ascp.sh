#!/bin/sh

TIMEOUT=1200

check_timeout() {
    if [ $? -eq 124 ]
    then
        echo "**************TIMEOUT*******************"
        echo "-> EXIT"
        exit 0
    else
        echo "**OK**"
    fi
}

run(){
    echo $0 > $OUT
    LEN=${#INSTANCES[@]}
    for ((i=0; i<$LEN; i++))
    do
        FILE=${!INSTANCES[i]:0:1}
        H=${!INSTANCES[i]:1:1}
        W=${!INSTANCES[i]:2:1}
        echo "---------$i: $FILE--------------"
        echo "---------$i: $FILE--------------" >> $OUT
        { time -p timeout $TIMEOUT bash -c "lparse -c h=$H  -c w=$W $DIR$FILE  | smodels" ; } >> $OUT 2>&1
        check_timeout >> $OUT
    done
}
