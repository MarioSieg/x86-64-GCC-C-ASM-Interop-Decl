.data
msg: .ascii "Hello!\n"
len: .quad .-msg

.text
.globl syscall_print

syscall_print:
    pushq %rbp
    movq %rsp, %rbp

    movb $1, %al
    movb $1, %dil
    movq $msg, %rsi
    movq len, %rdx
    syscall

    movq %rbp, %rsp
    popq %rbp
    ret
