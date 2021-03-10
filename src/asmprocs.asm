.extern printf

.text
.globl syscall_print
.globl add_numbers
.globl add_vec4_sse_f32
.globl mul_vec2_sse_f64

# arg1 = rdi
# arg2 = rsi
# arg3 = rdx
# arg4 = rcx
# arg5 = r8
# arg6 = r9
# arg..= stack spill

# ret = rax


syscall_print:
    pushq %rbp
    movq %rsp, %rbp

    # 1st arg is already in rdi
    xorq %rsi, %rsi # no arg
    xorq %rax, %rax # no floats
    callq printf    # call

    movq %rbp, %rsp
    popq %rbp
    ret

add_numbers:
    pushq %rbp
    movq %rsp, %rbp

    addq %rsi, %rdi     # add $arg1 to $arg2 and store in %rdi
    movq %rdi, %rax     # copy %rdi to %rax, rex = return register

    movq %rbp, %rsp
    popq %rbp
    ret

add_vec4_sse_f32:
    pushq %rbp
    movq %rsp, %rbp

    movaps (%rdi), %xmm0    # copy 4 * f32 to %xmm0
    addps (%rsi), %xmm0     # add float* in %rsi to %xmm0 and store in %xmm0
    movaps %xmm0, (%rdi)    # copy 4 * f32 from %xmm0 to %rdi

    movq %rbp, %rsp
    popq %rbp
    ret

mul_vec2_sse_f64:
    pushq %rbp
    movq %rsp, %rbp

    movapd (%rdi), %xmm0    # copy 2 * f64 to %xmm0
    mulpd (%rsi), %xmm0     # add double* in %rsi to %xmm0 and store in %xmm0
    movapd %xmm0, (%rdi)    # copy 2 * f64 from %xmm0 to %rdi

    movq %rbp, %rsp
    popq %rbp
    ret
