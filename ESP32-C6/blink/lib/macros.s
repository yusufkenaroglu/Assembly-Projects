.macro PRINT_LINE string_addr
    la a0, \string_addr
    call puts
.endm

.macro PUSH reg
    addi sp, sp, -4
    sw \reg, 0(sp)
.endm

.macro POP reg
    lw \reg, 0(sp)
    addi sp, sp, 4
.endm

.macro SET_BIT reg, bit
    PUSH t4
    addi t4, zero, 1
    slli t4, t4, \bit
    or \reg, \reg, t4
    POP t4
.endm

.macro CLEAR_BIT reg, bit
    PUSH t4,
    addi t4, zero, 1
    slli t4, t4, \bit
    xori t4, t4, -1
    and \reg, \reg, t4
    POP t4
.endm

.macro ENABLE_TIMER_CLOCK
    li t4, PCR_BASE
    li t5, (1 << PCR_TG0_CLK_EN_FIELD)  # Enable TG0 peripheral clock
    sw t5, PCR_TIMERGROUP0_CONF_REG(t4)
    li t5, (1 << PCR_TG0_TIMER_CLK_EN_FIELD)  # Enable timer clock
    sw t5, PCR_TIMERGROUP0_TIMER_CLK_CONF_REG(t4)
.endm

.macro DELAY_MILLIS time
    li a0, \time
    call delay_millis
.endm

.macro DELAY_MICROS time
    li a0, \time
    call delay_micros
.endm
