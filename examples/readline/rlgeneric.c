/*
 * Host version of readline test program.
 * Works as RTEMS version when included in rlchk.c
 */
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <readline/readline.h>
#include <readline/history.h>

int
main (int argc, char **argv)
{
	char *line;

	rl_bind_key ('\t', rl_insert);
	stifle_history (10);
	for (;;) {
		line = readline ("Enter a line: ");
		if (line && *line)
			add_history (line);
		printf ("Line: `%s'\n", line);
		if (line && !strcmp (line, "dump")) {
			rl_dump_variables (0,0);
			rl_dump_functions (0,0);
		}
		free (line);
	}
	return 0;
}
