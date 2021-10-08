Hello! This is a work in progress interpreter for the Hanoi Love esoteric programming language, created by "Jeffry Johnston <hanoilove@kidsquid.com>".

the rundown of the lang go as follows:

there are 8 instructions: . ' , ; ` "  : !

cmd|  name  | description
 . | nxtstk | next stack: selects next stack in order (A,B,C,D). loops back to A from D.
 ' | cpyreg | copy register: copies byte in register and pushes it to the stack
 , | pfsmir | pop from stack move into register
 ; | pfsatr | pop from stack add to register
 ` | pfssfr | pop from stack sub from register
 " | iomode | io mode prefix: next instruction will pop from stdin or push to stdout instead of a stack.
 : | sifzer | skip if zero: if the register is zero, skip instructions until the "!" instruction is reached.
 ! | eskhlt | end skip/halt: if matching a ":", end skip. if not matching a ":", halt.


There are 4 stacks and one register. A, B, C, D, REG

Stack A is the initial stack. It pops a 1 if empty, holds 8bit values, and has boundless memory (limited only by physical memory)

Both Stack B and C pop a 0 if empty, hold 8bit values, and have boundless memory (limited only by physical memory)

Stack D is for storing the location of instructions.  When a push operation is performed here, the previous instruction location (current location minus one) is pushed onto the stack.  When a pop operation is performed the new instruction location is popped from the stack.  If a ";" or "`" instruction is performed on this stack then the instruction location is popped, but no further action is taken (this is useful for breaking out of loops).

The register holds one 8 bit value, used for swapping between stacks. It is initalized to 0.