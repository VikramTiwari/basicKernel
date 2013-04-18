;
; boot.s
; Kernel start location. Also defines multiboot header.
;

MBOOT_PAGE_ALIGN	equ 1<<0	; load kernel and modules on a page boundary
MBOOT_MEM_INFO		equ 1<<1	; provide kernel with memory info
MBOOT_HEADER_MAGIC	equ 0x1BADB002	; Multiboot Magic Value

; NOTE: We don't use MBOOT_AOUT_KLUDGE. Means that GRUB does not passes us a symbol table

MBOOT_HEADER_FLAGS	equ MBOOT_PAGE_ALIGN | MBOOT_MEM_INFO
MBOOT_CHECKSUM		equ -(MBOOT_HEADER_MAGIC + MBOOT_HEADER_FLAGS)

[BITS 32]		; All instructions are of 32-bit mode

[GLOBAL mboot]		; Make 'mboot' accessible from C
[EXTERN code]		; Start of the '.text' section
[EXTERN bss]		; Start of the '.bss' section
[EXTERN end]		; End of the last loadable section

mboot:
	dd MBOOT_HEADER_MAGIC		; GRUB will search for this value on each 4-byte boundary in kernel file
	dd MBOOT_HEADER_FLAGS		; How GRUB should load your file/settings
	dd MBOOT_CHECKSUM		; To ensure that the above values are correct
	dd mboot			; Location of the descriptor
	dd code				; Start of kernel '.text' (code) section
	dd bss				; End of kernel '.data' section
	dd end				; End of kernel
	dd start			; Kernel entry point (initial EIP)

[GLOBAL start]				; kenrel entry point
[EXTERN main]				; Entry point of our C code

start:
	push	ebx			; Load multiboot header location

	; Execute kernel
	cli				; Disable interrupts
	call main			; call main() function
	jmp $				; Enter infinite loop, to stop the processor executing whaever the rubbish is in the momory after kernel.
