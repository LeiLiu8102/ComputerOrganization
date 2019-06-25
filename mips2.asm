# Search character in a string
    .data
    .align 2
string: .space 2000
success_info: .asciiz "Success! Location: "
fail_info: .asciiz "Fail!"
new_line: .asciiz "\n"
    .text
main:
move $t0, $zero # initialize $t0, the index of string
move $t1, $zero # counter
read:
li $v0, 12
syscall # read a char

beq $v0, 10, input
sw $v0, string($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
j read

input:
    li $v0, 12
    syscall
    move $v1, $v0 #input char in $v1
    la $a0, new_line
    li $v0, 4
    syscall # print new line
    beq $v1, 63, endloop
search:
    move $t0, $zero # initialize $t0
    move $t2, $zero # count
    compare:
    addi $t2, $t2, 1
    lw $t3, string($t0)
    beq $v1, $t3, success
    bge $t2, $t1, fail
    addi $t0, $t0, 4
    j compare
success:
    la $a0, success_info
    li $v0, 4
    syscall # print success_info
    move $a0, $t2
    li $v0, 1
    syscall
    la $a0, new_line
    li $v0, 4
    syscall # print new line
    j input
fail:
    la $a0, fail_info
    li $v0, 4
    syscall # print success_info
    la $a0, new_line
    li $v0, 4
    syscall # print new line
    j input 

endloop:
    li $v0, 10
    syscall