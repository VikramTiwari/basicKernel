// main.c
// Defines the C-code kernel entry points, calls intialization routines.

int main(struct multiboot *mboot_ptr)
{
	// All our initialization calls will go in here.
	return 0xDEADBABA;
}
