// main.c
// Defines the C-code kernel entry points, calls intialization routines.

#include "monitor.h"

int main(struct multiboot *mboot_ptr)
{
	// Initialize the screen by clearing it
	monitor_clear();
	// Write out a basic string
	monitor_write("Hello World!");

	return 0;
}
