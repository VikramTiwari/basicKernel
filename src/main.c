// main.c
// Defines the C-code kernel entry points, calls intialization routines.

#include "monitor.h"
#include "descriptor_tables.h"

int main(struct multiboot *mboot_ptr)
{
	// Initialize all the ISRs and Segmentation
	init_descriptor_tables();
	// Initialize the screen by clearing it
	monitor_clear();
	// Write out a basic string
	monitor_write("Hello World! \n");

	asm volatile("int $0x3");
	asm volatile("int $0x4");

	return 0;
}
