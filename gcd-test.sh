#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT() {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}


##test1 引数の数のチェック処理の検査
#引数を一つだけ渡すケース
./gcd.sh 1 > $tmp-result
echo "Number of arguments is not 2" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test1-1"

#引数を三つ渡すケース
./gcd.sh 1 2 3 > $tmp-result
echo "Number of arguments is not 2" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test1-2"



##test2 第一引数の入力値チェック処理の検査
#第一引数に文字列を渡すケース
./gcd.sh abc 123> $tmp-result
echo "argument1 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test2-1"

#第一引数に実数を渡すケース
./gcd.sh 1.23 123> $tmp-result
echo "argument1 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test2-2"

#第一引数に負の整数を渡すケース
./gcd.sh -987 123> $tmp-result
echo "argument1 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test2-3"

#第一引数に先頭に0をつけた自然数を渡すケース
./gcd.sh 000987 123> $tmp-result
echo "argument1 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test2-4"



##test3 第二引数の入力値チェック処理の検査
#第二引数に文字列を渡すケース
./gcd.sh 123 abc> $tmp-result
echo "argument2 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test3-1"

#第二引数に実数を渡すケース
./gcd.sh 123 1.23> $tmp-result
echo "argument2 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test3-2"

#第二引数に負の整数を渡すケース
./gcd.sh 123 -987> $tmp-result
echo "argument2 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test3-3"

#第二引数に先頭に0をつけた自然数を渡すケース
./gcd.sh 123 000987> $tmp-result
echo "argument2 is not natural number or starting with 0" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test3-4"



##test4 最大公約数の計算ロジックの検査
#第一引数の値 = 第二引数の値
./gcd.sh 99 99> $tmp-result
echo "gcd(99,99) = 99" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test4-1"

#第一引数の値 > 第二引数の値
./gcd.sh 66 11> $tmp-result
echo "gcd(66,11) = 11" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test4-2"

#第一引数の値 < 第二引数の値
./gcd.sh 11531 11544 > $tmp-result
echo "gcd(11531,11544) = 13" > $tmp-ans
diff $tmp-result $tmp-ans || ERROR_EXIT "error in test4-3"



rm -f $tmp-*
