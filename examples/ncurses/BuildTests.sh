#!/bin/sh

set -x

SRCDIR=../../ncurses-5.2/test

for TEST in \
	blue \
	bs \
	cardfile \
	ditto \
	filter \
	firework \
	firstlast \
	gdc \
	hanoi \
	hashtest \
	keynames \
	knight \
	lrtest \
	ncurses \
	newdemo \
	rain \
	tclock \
	testaddch \
	testcurs \
	testscanw \
	view \
	worm \
	xmas
do
	rm -f $TEST.c
	ln -s $SRCDIR/$TEST.c .
	make TEST=$TEST SRCDIR=$SRCDIR
	rm -f $TEST.c
done
