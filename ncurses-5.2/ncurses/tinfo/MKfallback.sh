#!/bin/sh
# $Id$
#
# MKfallback.sh -- create fallback table for entry reads
#
# This script generates source code for a custom version of read_entry.c
# that (instead of reading capabilities for an argument terminal type
# from an on-disk terminfo tree) tries to match the type with one of a
# specified list of types generated in.
#
cat <<EOF
/*
 * DO NOT EDIT THIS FILE BY HAND!  It is generated by MKfallback.sh.
 */

#include <curses.priv.h>
#include <term.h>

EOF

if [ "$*" ]
then
	cat <<EOF
#include <tic.h>

/* fallback entries for: $* */
EOF
	for x in $*
	do
		echo "/* $x */"
		infocmp -E $x
	done

	cat <<EOF
static const TERMTYPE fallbacks[$#] =
{
EOF
	comma=""
	for x in $*
	do
		echo "$comma /* $x */"
		infocmp -e $x
		comma=","
	done

	cat <<EOF
};

EOF
fi

cat <<EOF
const TERMTYPE *_nc_fallback(const char *name GCC_UNUSED)
{
EOF

if [ "$*" ]
then
	cat <<EOF
    const TERMTYPE	*tp;

    for (tp = fallbacks;
	 	tp < fallbacks + sizeof(fallbacks)/sizeof(TERMTYPE);
	 	tp++)
	if (_nc_name_match(tp->term_names, name, "|"))
	    return(tp);
EOF
else
	echo "	/* the fallback list is empty */";
fi

cat <<EOF
	return((TERMTYPE *)0);
}
EOF
