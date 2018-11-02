#!/bin/bash

TESTCASES_DIR=${TEST_DIR:-.}/testcases
PRINTAST=${PRINTAST:-./printast}

function do_test() {
    local input_file=$1

    while read instr
    do
        read outstr
        echo "$instr" | $PRINTAST | tr '\n' ' ' > test.out || exit 1
        output=$(cat test.out)
      	result_line="    IN: "$instr"\n   OUT: "$output"\nANSWER: $outstr\n==> "
        echo $output | diff <(echo $outstr) - > /dev/null
      	if [ $? = 0 ]; then
          echo -e "$result_line" "OK"
        else
          echo $result_line "NG"
        fi
    done < $input_file
}

for i in $TESTCASES_DIR/*_printast.in
do
    echo testing ${i##*/} || exit 1
    do_test $i
done
