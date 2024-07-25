#V1.0
.data:
    day_to_ms: .word 86400000
    hour_to_ms: .word 3600000
    minute_to_ms: .word 60000
    second_to_ms: .word 1000
    
    
.text:
    main:
        li a0, LED_MATRIX_0_BASE
        li t4, 24
        
        li a7, 30
        li a6, 1000
        la t0, day_to_ms
        lw t3, 12(t0) #t2 contains second_to_ms
        lw t2, 0(t0) #t2 contains day_to_ms
        lw t1, 4(t0) #t1 contains hour_to_ms
        lw t0, 8(t0) #t0 contains minute_to_ms
        loop:
        ecall
        slli a1, a1, 32
        or a0, a0, a1 #a0 now holds the 64 bit number for epoch
        divu s1, a0, t1
        
        remu t5, a0, t1
        remu s0, a0, t0
        remu s2, s1, t4
        divu s4, s0, a6
        divu s3, t5, t0
        mv a0, s2
        mv a1, s3
        mv a2, s4
        call print_time
        j loop
        
print_time:
    
    lb t6, 0(sp)
    beq t6, a2, done
    
    sb a2, 0(sp) 
    li a7, 1
    ecall
    li a7, 11
    li a0, 0x3a
    ecall
    li a7, 1
    mv a0, a1
    ecall
    li a7, 11
    li a0, 0x3a
    ecall
    li a7, 1
    mv a0, a2
    ecall
    li a7, 11
    li a0, 0xa
    ecall
    li a7, 30
    done:
        ret
