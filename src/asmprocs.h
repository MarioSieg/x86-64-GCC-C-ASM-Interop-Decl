#ifndef ASMPROCS_H
#define ASMPROCS_H

#include <stdint.h>

extern void syscall_print(const char* const str);

extern int add_numbers(int x, int y);

extern void add_vec4_sse_f32(float* const restrict x, const float* const restrict y);
extern void mul_vec2_sse_f64(double* const restrict x, const double* const restrict y);

#endif
