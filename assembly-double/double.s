# double.s
# CMSC 313 - Project 2
# Reads a number from stdin, doubles it, prints "The double is: <n>"
# GAS / AT&T syntax, 32-bit x86, links with C runtime for printf/scanf.
#
# Build: gcc -m32 -o double double.s
# Run:   ./double

.section .data
prompt:   .asciz "Enter a number: "
in_fmt:   .asciz "%d"
out_fmt:  .asciz "The double is: %d\n"

.section .bss
.lcomm num, 4

.section .text
.globl main

main:
    # printf("Enter a number: ");
    pushl   $prompt
    call    printf
    addl    $4, %esp

    # scanf("%d", &num);
    pushl   $num
    pushl   $in_fmt
    call    scanf
    addl    $8, %esp

    # double the number
    movl    num, %eax
    addl    %eax, %eax

    # printf("The double is: %d\n", doubled);
    pushl   %eax
    pushl   $out_fmt
    call    printf
    addl    $8, %esp

    # return 0
    movl    $0, %eax
    ret
