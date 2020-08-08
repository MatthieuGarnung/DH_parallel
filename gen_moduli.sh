#!/bin/bash

bits=$1
file_candi="moduli-"$bits".candi"

ssh-keygen -M generate -O bits=$bits $file_candi
lines=`wc -l $file_candi | awk -F " " '{print $1}'`
cores=`lscpu | egrep "Processeur" | egrep -o "[0-9]+"`
chunk=$((lines/cores))
let cores--

split -l $chunk $file_candi
parallel ssh-keygen -M screen -f {1} {2} ::: x* ::: `seq 0 $cores`
rm x*
cat [0-9] > moduli
rm [0-9]*
rm $file_candi


