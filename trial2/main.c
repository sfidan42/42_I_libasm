// main.c
#include <stdio.h>

// Declare the hello function (implemented in hello.s)
extern void hello();

int main() {
    hello();
    return 0;
}
