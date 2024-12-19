.section .data
.equ OUTPUT,                  0x0
.equ INPUT,                   0x1
.equ LOW,                     0x0
.equ HIGH,                    0x1

.equ GPIO_MATRIX_BASE, 0x60091000
.equ GPIO_OUT_W1TS_REG     0x0008
.equ GPIO_OUT_W1TC_REG     0x000C
.equ GPIO_ENABLE_REG       0x0020
.equ GPIO_ENABLE_W1TS_REG  0x0024
.equ GPIO_ENABLE_W1TC_REG  0x0028
#.equ IO_MUX_GPIOn_REG 0x60091000 + 0x0004+4*INPUT_PIN
.equ GPIO_IN_REG           0x003C


pin_modes: .word output, input

.section .text
#pinModeOutput and pinModeInput set the pin number stored in a0 either as output or input and return NULL.
pinMode:
    li t1, 1
    sll t1, t1, a0
    slli a1, a1, 2 #convert pin mode into jump table offset
    la t2, pin_modes
    add t2, t2, a1
    lw t2, 0(t2)
    jr t2
    ret

output: #*gpio_enable_w1ts_reg = (1 << LED_PIN);
    lui t0, %hi(GPIO_MATRIX_BASE)
    addi t0, t0, %lo(GPIO_MATRIX_BASE)
    sw t1, GPIO_ENABLE_W1TS_REG(t0)
input:
    ret

#digitalWrite sets the pin number stored in a0 low if a1 is 0, high otherwise and returns NULL.
digitalWrite: 
    lui t0, %hi(GPIO_MATRIX_BASE)
    addi t0, t0, %lo(GPIO_MATRIX_BASE)
    li t1, 1
    sll t1, t1, a0
    beqz a1, set_low
    sw t1, GPIO_OUT_W1TS_REG(t0)#*gpio_out_w1ts_reg = (1 << LED_PIN);
    ret
set_low:
    sw t1, GPIO_OUT_W1TC_REG(t0)#*gpio_out_w1tc_reg = (1 << LED_PIN);
    ret
