.section .data
#XTAL_CLK (40 MHz) default

.equ PRESCALER_MICROS, 40
.equ PRESCALER_MILLIS, 40000
#BASE ADDRESSES
.equ TIMG0_BASE, 0x60008000 
.equ PCR_BASE, 0x60096000 

#PCR_TIMERGROUP0_CONF_REG & FIELDS
.equ PCR_TIMERGROUP0_CONF_REG, 0x003c
.equ PCR_TG0_CLK_EN_FIELD, 0
.equ PCR_TG0_RST_EN_FIELD, 1

#PCR_TIMERGROUP0_TIMER_CLK_CONF_REG & FIELDS
.equ PCR_TIMERGROUP0_TIMER_CLK_CONF_REG, 0x0040
.equ PCR_TG0_TIMER_CLK_SEL_FIELD_BASE, 20
.equ PCR_TG0_TIMER_CLK_EN_FIELD, 22

#TIMG_T0CONFIG_REG & FIELDS
.equ TIMG_T0CONFIG_REG, 0x0000
.equ TIMG_T0_ALARM_EN_FIELD, 10
.equ TIMG_T0_DIVCNT_RST_FIELD, 12
.equ TIMG_T0_DIVIDER_FIELD_BASE, 13
.equ TIMG_T0_AUTORELOAD_FIELD, 29
.equ TIMG_T0_INCREASE_FIELD, 30
.equ TIMG_T0_EN_FIELD, 31
.equ TIMG_T0UPDATE_REG, 0xc
.equ TIMG_T0_UPDATE_FIELD, 31
.equ TIMG_T0LOADLO_REG, 0x0018
.equ TIMG_T0LOADHI_REG, 0x001c
.equ TIMG_T0LOAD_REG, 0x0020

#TIMG_T0LO_REG
.equ TIMG_T0LO_REG, 0x0004

.section .text
delay_micros:
    # Configure the prescaler and reset the divider counter
    li t2, (PRESCALER_MICROS << TIMG_T0_DIVIDER_FIELD_BASE) | (1 << TIMG_T0_DIVCNT_RST_FIELD)
    j prescaler_set
delay_millis:
    # Configure the prescaler and reset the divider counter
    li t2, (PRESCALER_MILLIS << TIMG_T0_DIVIDER_FIELD_BASE) | (1 << TIMG_T0_DIVCNT_RST_FIELD)
prescaler_set:
    ENABLE_TIMER_CLOCK
    li t0, TIMG0_BASE
    # Read existing config
    lw t1, TIMG_T0CONFIG_REG(t0)
    # Clear AUTORELOAD
    li t4, 1
    slli t4, t4, TIMG_T0_AUTORELOAD_FIELD
    not t4, t4
    and t1, t1, t4
    # Set INCREASE
    li t4, 1
    slli t4, t4, TIMG_T0_INCREASE_FIELD
    or t1, t1, t4
    or t1, t1, t2
    sw t1, TIMG_T0CONFIG_REG(t0)
    sw zero, TIMG_T0LOADHI_REG(t0)
    sw zero, TIMG_T0LOADLO_REG(t0)
    li t1, 1
    sw t1, TIMG_T0LOAD_REG(t0)
    lw t1, TIMG_T0CONFIG_REG(t0)
    li t2, (1 << TIMG_T0_EN_FIELD)
    or t1, t1, t2
    sw t1, TIMG_T0CONFIG_REG(t0)

get_curr_timer_value:
    sw zero, TIMG_T0UPDATE_REG(t0)

wait_clear:
    lw t2, TIMG_T0UPDATE_REG(t0)
    li t3, 1
    slli t3, t3, TIMG_T0_UPDATE_FIELD
    and t3, t3, t2
    bnez t3, wait_clear
    lw t3, TIMG_T0LO_REG(t0)
    blt t3, a0, get_curr_timer_value
    sw zero, TIMG_T0CONFIG_REG(t0)
    ret
