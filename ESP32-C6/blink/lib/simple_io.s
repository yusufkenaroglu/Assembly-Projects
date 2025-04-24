.section .data
.equ OUTPUT,                    0
.equ INPUT,                     1
.equ LOW,                       0
.equ HIGH,                      1
.equ GPIO_MATRIX_BASE, 0x60091000
.equ GPIO_OUT_REG,         0x0004
.equ GPIO_OUT_W1TS_REG,    0x0008
.equ GPIO_OUT_W1TC_REG,    0x000c
.equ GPIO_ENABLE_REG,      0x0020
.equ GPIO_ENABLE_W1TS_REG, 0x0024
.equ GPIO_ENABLE_W1TC_REG, 0x0028

.section .text

.macro GPIO_MODE pin_num, pin_mode
    li t0, GPIO_MATRIX_BASE
    li t1, 1
    li t2, \pin_mode
    slli t1, t1, \pin_num
    beq t2, zero, 1f
    j 2f 
1:
    sw t1, GPIO_ENABLE_W1TS_REG(t0)
    j 3f
2:
    sw t1, GPIO_ENABLE_W1TC_REG(t0)
3:
.endm

.macro WRITE_GPIO pin_num, logic_level
    li t0, GPIO_MATRIX_BASE
    li t1, 1
    li t2, \logic_level
    slli t1, t1, \pin_num
    beq t2, zero, 1f
    j 2f 
1:
    sw t1, GPIO_OUT_W1TC_REG(t0)
    j 3f
2:
    sw t1, GPIO_OUT_W1TS_REG(t0)
3:
.endm
