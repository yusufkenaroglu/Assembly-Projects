#V1.4
#improvements:
#              MEMORY-MAPPED VIDEO BUFFER
#              FLICKERING NOW FIXED
#ONLY UPPERCASE ENGLISH ALPHABET
#32 LETTERS MAX

.data

string_to_print: .string "NO FLICKER"

LED_COLOUR: .word 0xf6cc4c

A: .byte 0b01111110, 0b00010001, 0b00010001, 0b00010001, 0b01111110
B: .byte 0b01111111, 0b01001001, 0b01001001, 0b01001001, 0b00110110
C: .byte 0b00111110, 0b01000001, 0b01000001, 0b01000001, 0b00100010
D: .byte 0b01111111, 0b01000001, 0b01000001, 0b01000001, 0b00111110
E: .byte 0b01111111, 0b01001001, 0b01001001, 0b01001001, 0b01001001
F: .byte 0b01111111, 0b00001001, 0b00001001, 0b00001001, 0b00001001
G: .byte 0b00111110, 0b01000001, 0b01000001, 0b01001001, 0b01111010
H: .byte 0b01111111, 0b00001000, 0b00001000, 0b00001000, 0b01111111
I: .byte 0b00000000, 0b01000001, 0b01111111, 0b01000001, 0b00000000
J: .byte 0b00100000, 0b01000000, 0b01000001, 0b00111111, 0b00000001
K: .byte 0b01111111, 0b00001000, 0b00010100, 0b00100010, 0b01000001
L: .byte 0b01111111, 0b01000000, 0b01000000, 0b01000000, 0b01000000
M: .byte 0b01111111, 0b00000010, 0b00001100, 0b00000010, 0b01111111
N: .byte 0b01111111, 0b00000100, 0b00001000, 0b00010000, 0b01111111
O: .byte 0b00111110, 0b01000001, 0b01000001, 0b01000001, 0b00111110
P: .byte 0b01111111, 0b00001001, 0b00001001, 0b00001001, 0b00000110
Q: .byte 0b00111110, 0b01000001, 0b01010001, 0b00100001, 0b01011110
R: .byte 0b01111111, 0b00001001, 0b00011001, 0b00101001, 0b01000110
S: .byte 0b00100110, 0b01001001, 0b01001001, 0b01001001, 0b00110010
T: .byte 0b00000001, 0b00000001, 0b01111111, 0b00000001, 0b00000001
U: .byte 0b00111111, 0b01000000, 0b01000000, 0b01000000, 0b00111111
V: .byte 0b00011111, 0b00100000, 0b01000000, 0b00100000, 0b00011111
W: .byte 0b00111111, 0b01000000, 0b00111000, 0b01000000, 0b00111111
X: .byte 0b01100011, 0b00010100, 0b00001000, 0b00010100, 0b01100011
Y: .byte 0b00000111, 0b00001000, 0b01110000, 0b00001000, 0b00000111
Z: .byte 0b01100001, 0b01010001, 0b01001001, 0b01000101, 0b01000011

uppercase_alphabet: .word A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
current_alphabet_index: .byte 0
character_sequence: .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
character_sequence_index: .byte 0
character_sequence_length: .byte 0
scroll_offset: .byte LED_MATRIX_0_WIDTH
termination_offset: .byte 0
.align 4
video_buffer_address: .word 0x6ffffff0
#define colour (0x)
.text

main: 
    la a0, string_to_print
    la a1, character_sequence
    call convert_string_to_sequence
    la a0, LED_MATRIX_0_BASE
    la a1, LED_MATRIX_0_SIZE 
    add a1, a0, a1
    mv a2, zero
    call calculate_termination_offset
    animate:   
        call assign_character_index
        call index_alphabet
        call next_character
        j animate
    
    
calculate_termination_offset:
    la t0, termination_offset
    la t1, character_sequence_length
    lb t1, 0(t1)
    li t2, 6
    mul t1, t1, t2
    sub t1, zero, t1
    sb t1, 0(t0)
    jr ra
        
scroll_text:
    la t0, scroll_offset
    lb t1, 0(t1)
    addi t1, t1, -2
    sb t1, 0(t0)
    jr ra
            
convert_string_to_sequence: 
    xor t0, t0, t0 
    convert_loop:
        add a2, a0, t0 
        lb a2, 0(a2) 
        addi a2, a2, -65
        add t1, a1, t0
        sb a2, 0(t1)
        addi a2, a2, 65
        beqz a2, exit_convert_loop
        addi t0, t0, 1
        j convert_loop
    
    exit_convert_loop:
    la t1, character_sequence_length
    sb t0, 0(t1)
    jr ra
    
next_character:
    la t0, character_sequence_index
    lb t1, 0(t0)
    la t2, character_sequence_length
    lb t2, 0(t2)
    addi t2, t2, -1
    beq t1, t2, buffer_filled
    addi t1, t1, 1
    sb t1, 0(t0)
    jr ra
    
assign_character_index:
    la t0, character_sequence_index
    lb t0, 0(t0)
    la t2, character_sequence
    add t2, t2, t0
    lb t0, 0(t2)
    la t1, current_alphabet_index
    sb t0, 0(t1)
    mv a6, t1
    jr ra
 
index_alphabet:
    addi sp, sp, -4 
    sw ra, 0(sp)
    lb a6, 0(a6)
    slli a6, a6, 2
    
    la t4, uppercase_alphabet
    add t4, t4, a6
    lw t4, 0(t4)
    call draw_character
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra
    
draw_character:
    addi sp, sp, -4
    sw ra, 0(sp)
    la a0, LED_COLOUR
    lw a0, 0(a0)
    li t3, 4
    li t6, 7
    xor a1, a1, a1
    column_loop:
        
        xor a2, a2, a2
        add t0, t4, a1
        lb t0, 0(t0)
        
        la s5, character_sequence_index
        lb s5, 0(s5)
        li s6, 6
        mul s5, s5, s6
        add a1, a1, s5
        
        la s4, scroll_offset
        lb s4, 0(s4)
        add a1, a1, s4
        
        row_loop:
            andi t1, t0, 1
            beqz t1, no_light_up
            li a3, 79
            bgt a1, a3, no_light_up
            blt a1, zero, no_light_up
            call write_to_buffer
        no_light_up:
            bge a2, t6, exit_row_loop
            srli t0, t0, 1
            addi a2, a2, 1
            j row_loop
        exit_row_loop:
            sub a1, a1, s5
            sub a1, a1, s4
            bge a1, t3, continue
            addi a1, a1, 1
            j column_loop
    continue:
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra

write_to_buffer: 
    addi sp, sp, -16
    sw t0, 12(sp)
    sw t1, 8(sp)
    sw t2, 4(sp)
    sw t3, 0(sp)
    li t1, LED_MATRIX_0_WIDTH
    mul t0, a2, t1
    add t0, t0, a1
    li t1, 4
    mul t0, t0, t1
    la t1, video_buffer_address
    lw t1, 0(t1)
    #t0 holds LED coordinate in offset form
    #t1 holds the base address of video buffer
    add t1, t1, t0
    li t3, 0xf6cc4c
    sw t3, 0(t1)#store non-zero value at video_buffer[LED_coordinate]
    lw t3, 0(sp)
    lw t2, 4(sp)
    lw t1, 8(sp)
    lw t0, 12(sp)
    addi sp, sp, 16 
    jr ra

flush_buffer: 
# for (int i = 0; i < LED_MATRIX_0_SIZE; i++) {
#    LED_MATRIX_O[i] = video_buffer[i]; video_buffer[i] = colour:
#    video_buffer[i] = 0;
#}
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, video_buffer_address
    lw t0, 0(t0)
    li t1, LED_MATRIX_0_BASE
    li t3, LED_MATRIX_0_SIZE
    xor t2, t2, t2
    flush_loop:
        add s0, t0, t2
        lw s2, 0(s0)
        add s1, t1, t2
        sw s2, 0(s1)
        sw zero, 0(s0)
        beq t2, t3, exit_flush_loop
        addi t2, t2, 4
        j flush_loop
        exit_flush_loop:
        sw ra, 0(sp)
        addi sp, sp, 4
        jr ra


clear_matrix:
    sw a2, 0(a0)
    addi a0, a0, 4
    blt a0, a1, clear_matrix
    jr ra
    
buffer_filled:
    
    li a0, 0xf6cc4c
    call flush_buffer
    la t0, character_sequence_index
    sb zero, 0(t0)
    la t0, scroll_offset
    lb t1, 0(t0)
    addi t1, t1, -1
    sb t1, 0(t0)
    la t2, termination_offset
    lb t2, 0(t2)
    blt t1, t2, exit_program
    li a7, 30
    ecall
    mv t0, a0
    delay_millis:
        ecall
        sub a1, a0, t0
        addi a1, a1, 0
        blt a1, zero, delay_millis
        li s5, 0
        j animate 
        
exit_program:
    li a7, 10
    ecall
