.include "simple_io.s"
.include "timer.s"

.section .data
.equ RTC_WDT_BASE,   0x600b1c00
.equ TIMG_WDTFEED_REG, 0x0060
.equ TIMG_WDTWPROTECT_REG, 0x0064
.equ WDT_UNLOCK_VAL, 0x50d83aa1

.equ LED_PIN, 7

message: .string "Hello World!"
HIGH_message: .string "Setting pin HIGH."
LOW_message: .string "Setting pin LOW." 

millis_message: .string "1000 millis."
micros_message: .string "1000 millis equivalent of micros." 

.section .text
.global app_main

app_main:
setup:  
    csrr t0, MHARTID
    bnez t0, halt #halt additional threads
    li a0, LED_PIN
    li a1, OUTPUT 
    call pinMode
    
loop:
    la a0, HIGH_message
    call puts
    li a0, LED_PIN
    li a1, HIGH
    call digitalWrite
    li a0, 1000
    call DELAY_MILLIS
    la a0, LOW_message
    call puts
    li a0, LED_PIN
    li a1, LOW
    call digitalWrite
    li a0, 1000
    call DELAY_MILLIS
    #optional (if you have not disabled the watchdog timer), call feedWDT
    j loop

feedWDT:
    lui t1, %hi(WDT_UNLOCK_VAL)
    addi t1, t1, %(lo(WDT_UNLOCK_VAL)
    lui t0, %hi(RTC_WDT_BASE)
    addi t0, t0, %lo(RTC_WDT_BASE)
    sw t1, TIMG_WDTWPROTECT_REG(t0)#unlock WDT write
    li t1, 1
    sw t1, TIMG_WDTFEED_REG(t0)
    sw t1, TIMG_WDTWPROTECT_REG(t0)#lock WDT write
    ret
halt:
    nop
    j halt
