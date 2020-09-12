// globalvar.s
.data

.balign 8 // Align to 8 bytes
.byte 1
global_var64 : .dword 0x1234  // a 64-bit value of 0x1234
// alternatively: .word 0x1234, 0x0

.balign 4 // Align to 4 bytes
.byte 1
global_var32 : .word 0x5678   // a 32-bit value of 0

.text

.globl main
main :
  ldr X0, address_of_global_var64 // X0 ← &global_var64
  ldr X1, [X0]                    // X1 ← *X0
  add X1, X1, #1                  // X1 ← X1 + 1
  str X1, [X0]                    // *X0 ← X1

  ldr X0, address_of_global_var32 // X0 ← &global_var32
  ldr W1, [X0]                    // W1 ← *X0
  add W1, W1, #1                  // W1 ← W1 + 1
  str W1, [X0]                    // *X0 ← W1

  mov W0, #0                      // W0 ← 0
  ret                             // exit program
address_of_global_var64 : .dword global_var64
address_of_global_var32 : .dword global_var32
