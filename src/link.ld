/* link.ld */
/* Linker Script for the kernel - ensures everything goes in correct place */

ENTRY(start)
SECTIONS
{
	.text 0x100000 :
	{
		code = .; _code = .; __code = .;
		*(.text)
		. = ALIGN(4096);
	}

	.data :
	{
		data = .; _data = .; __data = .;
		*(.data)
		*(.rodata)
		. = ALIGN(4096);
	}

	.bss :
	{
		bss = .; _bss = .; __bss = .;
		*(.bss)
		. = ALIGN(4096);
	}

	end = .; _end = .; __end = .;
}

/* Tells LD how to set up the kernel image. */
/* First it tells LD that the start location of our binary should be the symbool 'start' */
/* It then tells LD that the .text section (all code here) should be the first and start at 0x100000 (1MB) */
/* The .data (initialized static data) and the .bss (uninitalized static data) should be next, and that each should be page-aligned (ALIGN(4096)). */
/* OPTIONAL: Add .rodata (Done by Linux GCC). This is read-only initialized data (constants) */
