#!/bin/zsh
if [ $# -ne 3 ];then
  echo "usage: $0 id from to"
  exit 1
fi

testid=$1
from=$2
to=$3

mkdir -p testdata/${testid}
cd testdata/${testid}

for num in {$from..$to};do
  wget "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${testid}&case=${num}&type=in" -O in${num}.txt
  wget "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${testid}&case=${num}&type=out" -O out${num}.txt 
done

