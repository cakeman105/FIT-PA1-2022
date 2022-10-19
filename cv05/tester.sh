#!/bin/bash

#simple C I/O tester
#place into project root folder with compiled binary and folder containing test files named CZE/

echo "C TESTER"

FILECOUNT=$(ls CZE/ | grep _in.txt | wc -l)
let "FILECOUNT=FILECOUNT-1"
echo "found $FILECOUNT input test files"
mkdir out && echo "making dir 'out'"|| echo "warning! dir out already exists"
time for VAR in $(eval echo {0000..00$FILECOUNT}) 
do
	echo "---------------------"
	echo "test $VAR"
	cat CZE/"$VAR"_in.txt | ./a.out > out/"$VAR"_out.txt
	diff CZE/"$VAR"_out.txt out/"$VAR"_out.txt && echo "TEST PASSED" || echo "TEST FAILED"
done
