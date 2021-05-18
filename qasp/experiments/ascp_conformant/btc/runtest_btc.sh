#!/bin/sh


#lparse -c h=3  -c w=1 btc_2.smo  | smodels
#lparse -c h=7  -c w=1 btc_4.smo  | smodels
#lparse -c h=11 -c w=1 btc_6.smo  | smodels
#lparse -c h=15 -c w=1 btc_8.smo  | smodels
#lparse -c h=19 -c w=1 btc_10.smo | smodels

TIMEOUT=1000
OUT="result_btc"

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
{ time timeout $TIMEOUT lparse -c h=3  -c w=1 btc_2.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--2--"
echo "--2--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=7  -c w=1 btc_4.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--3--"
echo "--3--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=11 -c w=1 btc_6.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--4--"
echo "--4--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=15 -c w=1 btc_8.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT

echo "--5--"
echo "--5--" >> $OUT
{ time timeout $TIMEOUT lparse -c h=19 -c w=1 btc_10.smo  | smodels ; } 2>> $OUT
check_timeout >> $OUT