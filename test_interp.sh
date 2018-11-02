#!/bin/bash

TESTCASES_DIR=${TEST_DIR:-.}/testcases
INTERP=${INTERP:-./interp}

function do_test() {
    local input_file=$1

    while read instr
    do
        read outstr
        echo "$instr" | $INTERP > test.out || exit 1
        result_line="IN: "$instr" OUT: "`cat test.out`" ANSWER: $outstr ==> "
        echo $outstr | diff - test.out > /dev/null
      	if [ $? = 0 ]; then
          echo "$result_line" "OK"
        else
          echo "$result_line" "NG"
        fi
    done < $input_file
}

for i in $TESTCASES_DIR/*_interp.in
do
    echo testing ${i##*/} || exit 1
    do_test $i
done
