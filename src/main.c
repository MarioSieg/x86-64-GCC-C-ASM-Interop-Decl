#include "asmprocs.h"

signed main(const signed argc, const char* const* const argv) {
    (void)argc, (void)argv;

    syscall_print();

    return 0;
}