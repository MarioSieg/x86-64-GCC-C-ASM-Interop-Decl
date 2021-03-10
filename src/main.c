#include <stdio.h>

#include "asmprocs.h"

int main(const int argc, const char* const* const argv) {
    (void)argc, (void)argv;

    {
        printf("Performing asm calls with standart calling convension...\n");
        syscall_print("Hello assembly!\n");
    }

    {
        int32_t x = 3, y = 5;
        int32_t z = add_numbers(x, y);
        printf("%d + %d = %d\n", x, y, z);
    }

    {
        float x[4] = { 1.f, 2.f, 3.f, 4.f };
        const float y[4] = { 1.f, 2.f, 3.f, 4.f };
        add_vec4_sse_f32(x, y);
        printf("SSE 4 * f32: %f %f %f %f\n", x[0], x[1], x[2], x[3]);
    }

    {
        double x[4] = { 4.0, 2.0};
        const double y[4] = { 4.0, 2.0};
        mul_vec2_sse_f64(x, y);
        printf("SSE 2 * f64: %f %f\n", x[0], x[1]);
    }

    return 0;
}