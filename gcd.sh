#!/bin/sh

#引数が二つでなければエラーにする。
if [ $# -ne 2 ]; then
  echo "Number of arguments is not 2"
  exit 1
fi

#第一引数のチェック、自然数でなければエラーにする。
#0から始まる入力の入力もエラーにする。
if expr $1 : "[1-9][0-9]*$" > /dev/null; then
  :
else
  echo "argument1 is not natural number or starting with 0" 
  exit 1
fi

#第二引数のチェック、自然数でなければエラーとする。
#0から始まる値の入力もエラーにする。
if expr $2 : "[1-9][0-9]*$" > /dev/null; then
  :
else
  echo "argument2 is not natural number or starting with 0"
  exit 1
fi

#最大公約数を計算して、出力する。
nNum1=$1                              #第一引数の値を格納する変数。
nNum2=$2                              #第二引数の値を格納する変数。
remainder=1                           #剰余算の結果を格納する変数。
gcd=0                                 #最大公約数を格納する変数。

while [ $remainder -ne 0 ]            #剰余算の結果が0になるまでユークリッドの互除法を繰り返す。
do
  if [ $nNum1 -ge $nNum2 ]; then
    nNum1=`expr "$nNum1" % "$nNum2"`
    gcd=$nNum2
    remainder=$nNum1
  else
    nNum2=`expr "$nNum2" % "$nNum1"`
    gcd=$nNum1
    remainder=$nNum2
  fi
done

echo "gcd($1,$2) = "$gcd
