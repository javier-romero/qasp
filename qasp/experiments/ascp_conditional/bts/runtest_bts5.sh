#!/bin/sh

#lparse -c h=2  -c w=2  bts5_2.smo  | smodels
#lparse -c h=4  -c w=4  bts5_4.smo  | smodels
#lparse -c h=6  -c w=6  bts5_6.smo  | smodels
#lparse -c h=8  -c w=8  bts5_8.smo  | smodels
#lparse -c h=10 -c w=10 bts5_10.smo | smodels


TIMEOUT=1800
OUT="result_bts5"

check_timeout() {
    if [ $? -eq 124 ]
    then
        echo "TIMEOUT" 2>> $OUT
        echo "EXIT"
        exit 0
    else
        echo "OK" 2>> $OUT
    fi
}

echo "--1--"
echo "--1--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=2  -c w=2  bts5_2.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--2--"
echo "--2--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=4  -c w=4  bts5_4.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--3--"
echo "--3--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=6  -c w=6  bts5_6.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--4--"
echo "--4--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=8  -c w=8  bts5_8.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--5--"
echo "--5--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=10 -c w=10 bts5_10.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT
