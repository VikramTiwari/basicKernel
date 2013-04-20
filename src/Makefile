# Makefile for basicKernel project
# Using NASM as assembly compiler
# 
# The file will compile all the files in "sources"
# and then link them together into one ELF binary, 'kernel'
# It uses a linker script, 'link.ld' to do this.

SOURCES=boot.o main.o monitor.o common.o descriptor_tables.o isr.o interrupt.o gdt.o

CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector
LDFLAGS=-Tlink.ld
ASFLAGS=-felf

all: $(SOURCES) link

clean:
	-rm *.o kernel

link:
	ld $(LDFLAGS) -o kernel $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<
