#
#  $Id$
#
# Templates/Makefile.leaf
# 	Template leaf node Makefile
#

# C source names, if any, go here -- minus the .c
C_PIECES= init rlgeneric
C_FILES=$(C_PIECES:%=%.c)
C_O_FILES=$(C_PIECES:%=${ARCH}/%.o)

# C++ source names, if any, go here -- minus the .cc
CC_PIECES=
CC_FILES=$(CC_PIECES:%=%.cc)
CC_O_FILES=$(CC_PIECES:%=${ARCH}/%.o)

H_FILES= 

# Assembly source names, if any, go here -- minus the .s
S_PIECES=
S_FILES=$(S_PIECES:%=%.s)
S_O_FILES=$(S_FILES:%.s=${ARCH}/%.o)

SRCS=$(C_FILES) $(CC_FILES) $(H_FILES) $(S_FILES)
OBJS=$(C_O_FILES) $(CC_O_FILES) $(S_O_FILES)

PGMS=${ARCH}/rlchk

#
# RTEMS managers go here
#
MANAGERS=io event message semaphore

include $(RTEMS_MAKEFILE_PATH)/Makefile.inc
include $(RTEMS_CUSTOM)
include $(PROJECT_ROOT)/make/leaf.cfg

#
# (OPTIONAL) Add local stuff here using +=
#

DEFINES  +=
CPPFLAGS += -Dmain=rlchk
CFLAGS   += 

LD_PATHS  += 
LD_LIBS   += -lreadline -lncurses
CFLAGS_LD   += -Wl,--defsym -Wl,HeapSize=0x200000 # network needs more space
CFLAGS_DEBUG_V   += -DSTACK_CHECKER_ON

#
# Add your list of files to delete here.  The config files
#  already know how to delete some stuff, so you may want
#  to just run 'make clean' first to see what gets missed.
#  'make clobber' already includes 'make clean'
#

CLEAN_ADDITIONS += 
CLOBBER_ADDITIONS +=

all:	${ARCH} $(SRCS) $(PGMS)

${ARCH}/rlchk: ${OBJS} ${LINK_FILES}
	$(make-exe)

# Install the program(s), appending _g or _p as appropriate.
# for include files, just use $(INSTALL)
install:  all
	$(INSTALL_VARIANT) -m 555 ${PGMS} /usr/local/tftpboot/bootfiles/m68360/
