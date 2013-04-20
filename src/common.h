// common.h
// Defines typedefs and some global functions

#ifndef COMMON_H
#define COMMON_H

// Some typedefs to standardise sizes across platform
// Written for 32-bit X86

typedef unsigned int u32int;
typedef int s32int;
typedef unsigned int u16int;
typedef	short s16int;
typedef unsigned char u8int;
typedef char s8int;

void outb(u16int port, u8int value);
u8int inb(u16int port);
u16int inw(u16int port);

#endif //COMMON_H
