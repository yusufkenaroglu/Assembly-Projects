#V1.0 
#ONLY UPPERCASE ENGLISH ALPHABET
#13 LETTERS MAX

.data
string_to_print: .string “WELCOME”

LED_ON_COLOUR: .word 0xf6cc4c
A_x: .byte 1, 2, 3, 0, 4, 0, 4, 0, 4, 0, 1, 2, 3, 4, 0, 4, 0, 4
A_y: .byte 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4, 5, 5, 6, 6
A_length: .byte  19

B_x: .byte 0, 1, 2, 3, 0, 4, 0, 4, 0, 1, 2, 3, 0, 4, 0, 4, 0, 1, 2, 3
B_y: .byte 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 3, 3, 4, 4, 5, 5, 6, 6, 6, 6
B_length: .byte  20

C_x: .byte 1, 2, 3, 0, 4, 0, 0, 0, 0, 4, 1, 2, 3
C_y: .byte 0, 0, 0, 1, 1, 2, 3, 4, 5, 5, 6, 6, 6
C_length: .byte  13

D_x: .byte 0, 1, 2, 3, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 1, 2, 3
D_y: .byte 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 6
D_length: .byte  18

E_x: .byte 0, 1, 2, 3, 4, 0, 0, 0, 1, 2, 3, 4, 0, 0, 0, 1, 2, 3, 4
E_y: .byte 0, 0, 0, 0, 0, 1, 2, 3, 3, 3, 3, 3, 4, 5, 6, 6, 6, 6, 6
E_length: .byte  19

F_x: .byte 0, 1, 2, 3, 4, 0, 0, 0, 1, 2, 3, 4, 0, 0, 0
F_y: .byte 0, 0, 0, 0, 0, 1, 2, 3, 3, 3, 3, 3, 4, 5, 6
F_length: .byte  15

G_x: .byte 1, 2, 3, 0, 4, 0, 0, 3, 4, 0, 4, 0, 4, 1, 2, 3, 4
G_y: .byte 0, 0, 0, 1, 1, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 6, 6
G_length: .byte  17

H_x: .byte 0, 4, 0, 4, 0, 4, 0, 1, 2, 3, 4, 0, 4, 0, 4, 0, 4
H_y: .byte 0, 0, 1, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 5, 5, 6, 6
H_length: .byte  17

I_x: .byte 1, 2, 3, 2, 2, 2, 2, 2, 1, 2, 3
I_y: .byte 0, 0, 0, 1, 2, 3, 4, 5, 6, 6, 6
I_length: .byte  11

J_x: .byte 2, 3, 4, 3, 3, 3, 3, 0, 3, 1, 2 
J_y: .byte 0, 0, 0, 1, 2, 3, 4, 5, 5, 6, 6
J_length: .byte  11

K_x: .byte 0, 4, 0, 3, 0, 2, 0, 1, 0, 2, 0, 3, 0, 4
K_y: .byte 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6
K_length: .byte  14

L_x: .byte 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4
L_y: .byte 0, 1, 2, 3, 4, 5, 6, 6, 6, 6, 6
L_length: .byte  11

M_x: .byte 0, 4, 0, 1, 3, 4, 0, 2, 4, 0, 2, 4, 0, 4, 0, 4, 0, 4
M_y: .byte 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6
M_length: .byte  18

N_x: .byte 0, 4, 0, 4, 0, 1, 4, 0, 2, 4, 0, 3, 4, 0, 4, 0, 4
N_y: .byte 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6
N_length: .byte  17

O_x: .byte 1, 2, 3, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 1, 2, 3
O_y: .byte 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6
O_length: .byte  16

P_x: .byte 0, 1, 2, 3, 0, 4, 0, 4, 0, 1, 2, 3, 0, 0, 0
P_y: .byte 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 3, 3, 4, 5, 6
P_length: .byte  15

Q_x: .byte 1, 2, 3, 0, 4, 0, 4, 0, 4, 0, 2, 4, 0, 3, 1, 2, 4
Q_y: .byte 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6
Q_length: .byte  17

R_x: .byte 0, 1, 2, 3, 0, 4, 0, 4, 0, 1, 2, 3, 0, 2, 0, 3, 0, 4
R_y: .byte 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 3, 3, 4, 4, 5, 5, 6, 6
R_length: .byte  18

S_x: .byte 1, 2, 3, 0, 4, 0, 1, 2, 3, 4, 0, 4, 1, 2, 3
S_y: .byte 0, 0, 0, 1, 1, 2, 3, 3, 3, 4, 5, 5, 6, 6, 6
S_length: .byte  15

T_x: .byte 0, 1, 2, 3, 4, 2, 2, 2, 2, 2, 2
T_y: .byte 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6
T_length: .byte  11

U_x: .byte 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 1, 2, 3
U_y: .byte 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6
U_length: .byte  15

V_x: .byte 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 1, 3, 2
V_y: .byte 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6
V_length: .byte  13

W_x: .byte 0, 4, 0, 4, 0, 4, 0, 2, 4, 0, 2, 4, 0, 2, 4, 1, 3
W_y: .byte 0, 0, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6
W_length: .byte  17

X_x: .byte 0, 4, 0, 4, 1, 3, 2, 1, 3, 0, 4, 0, 4
X_y: .byte 0, 0, 1, 1, 2, 2, 3, 4, 4, 5, 5, 6, 6
X_length: .byte  13

Y_x: .byte 0, 4, 0, 4, 0, 4, 1, 3, 2, 2, 2
Y_y: .byte 0, 0, 1, 1, 2, 2, 3, 3, 4, 5, 6
Y_length: .byte  11

Z_x: .byte 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4
Z_y: .byte 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 6, 6, 6, 6
Z_length: .byte  15

uppercase_alphabet_x: .word A_x, B_x, C_x, D_x, E_x, F_x, G_x, H_x, I_x, J_x, K_x, L_x, M_x, N_x, O_x, P_x, Q_x, R_x, S_x, T_x, U_x, V_x, W_x, X_x, Y_x, Z_x
uppercase_alphabet_y: .word A_y, B_y, C_y, D_y, E_y, F_y, G_y, H_y, I_y, J_y, K_y, L_y, M_y, N_y, O_y, P_y, Q_y, R_y, S_y, T_y, U_y, V_y, W_y, X_y, Y_y, Z_y
uppercase_alphabet_lengths: .word A_length, B_length, C_length, D_length, E_length, F_length, G_length, H_length, I_length, J_length, K_length, L_length, M_length, N_length, O_length, P_length, Q_length, R_length, S_length, T_length, U_length, V_length, W_length, X_length, Y_length, Z_length
uppercase_alphabet_size: .byte 26
current_alphabet_index: .byte 0
character_sequence: .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
character_sequence_index: .byte 0
character_sequence_length: .byte 0

#13 CHARACTERS FIT WITHOUT OVERFLOW
.globl main
.text

main:
    la a0, LED_MATRIX_0_BASE
    la a1, LED_MATRIX_0_SIZE
    add a1, a0, a1
    mv a2, zero
    call clear_matrix
    la a0, string_to_print
    la a1, character_sequence
    call convert_string_to_sequence
    la a0, LED_MATRIX_0_BASE
    la a1, LED_MATRIX_0_SIZE
    add a1, a0, a1
    mv a2, zero
    
    d_loop:    
    call assign_character_index
    call index_alphabet
    call next_character
    li a7, 30
    ecall
    mv t0, a0
    wait:
        ecall
        sub a1, a0, t0
        addi a1, a1, -75
        blt a1, zero, wait
        li s0, 0
        j d_loop
        
convert_string_to_sequence: 
    #base address of input string in a0
    #base address of character_sequence in a1
    #pseudo-code: i = 0; while (string[i]){ character_sequence[i] = string[i]; i++; }
    xor t0, t0, t0 # i = 0
    convert_loop:
        add a2, a0, t0 
        lb a2, 0(a2) #string[i]
        addi a2, a2, -65
        add t1, a1, t0
        sb a2, 0(t1)
        addi a2, a2, 65
        beqz a2, exit_convert_loop
        addi t0, t0, 1
        j convert_loop
    
    exit_convert_loop:
    #t0 holds the total number of characters
    la t1, character_sequence_length
    sb t0, 0(t1)
    ret
    
next_character:
    #increment character_sequence_index by 1 and wrap character_sequence_length
    la t0, character_sequence_index
    lb t1, 0(t0)
    la t2, character_sequence_length
    lb t2, 0(t2)
    addi t2, t2, -1 #convert 1 indexed length to 0 indexed
    beq t1, t2, exit_program
    addi t1, t1, 1
    sb t1, 0(t0)
    ret
    
assign_character_index:
    #assign character_sequence[character_sequence_index] to current_alphabet_index
    la t0, character_sequence_index
    lb t0, 0(t0)#t0 now contains sequence index
    la t2, character_sequence
    add t2, t2, t0
    lb t0, 0(t2)
    la t1, current_alphabet_index
    sb t0, 0(t1)
    mv a6, t1
    ret
 
index_alphabet:
    addi sp, sp, -4 
    sw ra, 0(sp)
    lb a6, 0(a6)
    slli a6, a6, 2
    la t4, uppercase_alphabet_x
    add t4, t4, a6
    lw t4, 0(t4)
    la t5, uppercase_alphabet_y
    add t5, t5, a6
    lw t5, 0(t5)
    la t6, uppercase_alphabet_lengths
    add t6, t6, a6
    lw t6, 0(t6)
    call draw_character
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
    
draw_character:
    addi sp, sp, -4
    sw ra, 0(sp)
    la a0, LED_ON_COLOUR
    lw a0, 0(a0)
    lb t6, 0(t6)
    character_loop:
        lb a1, 0(t4)
        lb a2, 0(t5)
        call setLED
        addi s0, s0, 1
        addi t4, t4, 1
        addi t5, t5, 1
        blt s0, t6, character_loop
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

setLED: 
    addi sp, sp, -4
    sw t0, 0(sp)
    addi sp, sp, -4
    sw t1, 0(sp)
    li t1, LED_MATRIX_0_WIDTH
    mul t0, a2, t1
    add t0, t0, a1
    li t1, 4
    mul t0, t0, t1
    li t1, LED_MATRIX_0_BASE
    #adjust t1 immediate offset to scroll print (+4 = 1 columnn)
    #column_offset = sequence_index * 4
    #t1 = t1 + column_offset
    la s5, character_sequence_index
    lb s5, 0(s5)
    li s6, 24
    mul s5, s5, s6
    add t1, t1, s5
    add t0, t1, t0
    sw a0, 0(t0)
    lw t1, 0(sp)
    addi sp, sp, 4
    lw t0, 0(sp)
    addi sp, sp, 4
    jr ra

clear_matrix:
    sw a2, 0(a0)
    addi a0, a0, 4
    blt a0, a1, clear_matrix
    ret
    
exit_program:
    li a7, 10
    ecall
