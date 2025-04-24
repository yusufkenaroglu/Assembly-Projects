.include "lib/simple_io.s" 
.include "lib/macros.s" 
.include "lib/timer.s"  
.include "lib/rmt.s"

.section .data

led_on_message: .string "Setting LED on."
led_off_message: .string "Setting LED off."
.equ LED_BUILTIN, 8
.section .text
.global app_main


app_main:

setup:  
    csrr t0, mhartid 
    bnez t0, halt 
    GPIO_MODE LED_BUILTIN, OUTPUT
loop:
    PRINT_LINE led_on_message
    WRITE_GPIO LED_BUILTIN, HIGH
    DELAY_MILLIS 1000
    PRINT_LINE led_off_message
    WRITE_GPIO LED_BUILTIN, LOW
    DELAY_MILLIS 1000
    j loop
halt:  
    nop
    j halt
