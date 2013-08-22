/*
 * Root task
 *
 * $Revision$    $Date$    $Author$
 */
#include <bsp.h>
#include <stdio.h>
#include <stdlib.h>

/*
 ***********************************************************************
 *                         RTEMS CONFIGURATION                         *
 ***********************************************************************
 */
#define CONFIGURE_RTEMS_INIT_TASKS_TABLE

#define CONFIGURE_MAXIMUM_TASKS			20
#define CONFIGURE_MAXIMUM_SEMAPHORES		10
#define CONFIGURE_MAXIMUM_MESSAGE_QUEUES	10

#define CONFIGURE_MICROSECONDS_PER_TICK	52489

#define CONFIGURE_INIT
#define CONFIGURE_INIT_TASK_INITIAL_MODES (RTEMS_PREEMPT | \
					RTEMS_NO_TIMESLICE | \
					RTEMS_NO_ASR | \
					RTEMS_INTERRUPT_LEVEL(0))
#define CONFIGURE_INIT_TASK_STACK_SIZE  (10*1024)
#define CONFIGURE_INIT_TASK_PRIORITY    100
rtems_task Init (rtems_task_argument argument);

#define CONFIGURE_HAS_OWN_DEVICE_DRIVER_TABLE
rtems_driver_address_table Device_drivers[] = {
  CONSOLE_DRIVER_TABLE_ENTRY,
  CLOCK_DRIVER_TABLE_ENTRY,
};

#include <rtems/confdefs.h>

extern int main (int argc, char **argv);

/*
 * RTEMS Startup Task
 */
rtems_task
Init (rtems_task_argument ignored)
{
	putenv ("TERM=xterm");
	main (0, NULL);
	rtems_task_suspend (RTEMS_SELF);
}
