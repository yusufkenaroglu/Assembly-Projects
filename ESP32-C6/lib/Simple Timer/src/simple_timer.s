.section .data
#XTAL_CLK (40 MHz) default

#.equ PRESCALER_MICROS, 40
.equ PRESCALER_MILLIS, 40000
#BASE ADDRESSES
.equ TIMG0_BASE, 0x60008000 #Timer Group 0 Base Address
.equ PCR_BASE, 0x60096000 #Power, Clock, Reset Base Address

#PCR_TIMERGROUP0_CONF_REG & FIELDS
.equ PCR_TIMERGROUP0_CONF_REG, 0x003C
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
#TIMG_T0_UPDATE_REG
.equ TIMG_T0_UPDATE_REG, 0x000C
.equ TIMG_T0_UPDATE_FIELD, 31
#TIMG_T0LOADLO_REG
.equ TIMG_T0LOADLO_REG, 0x0018
#TIMG_T0LOADHI_REG
.equ TIMG_T0LOADHI_REG, 0x001C
#TIMG_T0LOAD_REG
.equ TIMG_T0LOAD_REG, 0x0020

#TIMG_T0LO_REG
.equ TIMG_T0LO_REG, 0x0004


.section .text

DELAY_MILLIS:
    #Configure the 16-bit prescaler by setting TIMG_T0_DIVIDER.
    li t2, (PRESCALER_MILLIS << TIMG_T0_DIVIDER_FIELD_BASE) | (1 << TIMG_T0_DIVCNT_RST_FIELD)
    li t0, TIMG0_BASE
    lw t1, TIMG_T0CONFIG_REG(t0)
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
        lw t2, TIMG_T0_UPDATE_REG(t0)
        li t3, (1 << 31)
        or t3, t3, t2
        sw t3, TIMG_T0_UPDATE_REG(t0)
        wait_clear:
        lw t2, TIMG_T0_UPDATE_REG(t0)
        li t3, (1 << 31)
        and t3, t3, t2
        bnez t2, wait_clear
        
        lw t3, TIMG_T0LO_REG(t0)
        
        blt t3, a0, get_curr_timer_value
        ret
