#!/bin/sh

set -x

SRCDIR=../../avl-1.4.0

for TEST in avl avlt avltr rb
do
	rm -f $TEST.c
	ln -s $SRCDIR/$TEST.c .
	make TEST=$TEST SRCDIR=$SRCDIR
	rm -f $TEST.c
done
