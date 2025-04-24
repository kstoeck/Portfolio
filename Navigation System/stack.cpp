// Kevin Stoeck 1223480830

#include "stack.h"
#include <cstdlib>
#include <cstdio>

// allocate and init stack
pSTACK initStack(int capacity) {
    pSTACK pS = (pSTACK)calloc(1, sizeof(STACK));
    if (!pS) {
        fprintf(stdout, "Error: cannot allocate memory for stack.\n");
        exit(EXIT_FAILURE);
    }
    pS->capacity = capacity;
    pS->top = 0;
    pS->array = (int*)calloc(capacity + 1, sizeof(int));
    if (!pS->array) {
        fprintf(stdout, "Error: cannot allocate memory for stack array.\n");
        exit(EXIT_FAILURE);
    }
    return pS;
}

// push/add an int onto the stack
void push(pSTACK pS, int x) {
    if (pS->top == pS->capacity) {
        fprintf(stdout, "Error: Stack overflow.\n");
        return;
    }
    pS->top += 1;
    pS->array[pS->top] = x;
}

// pop/remove int from stack
int pop(pSTACK pS) {
    if (isEmpty(pS)) {
        fprintf(stdout, "Error: Stack underflow.\n");
        return -1;
    }
    int val = pS->array[pS->top];
    pS->top -= 1;
    return val;
}

// check for empty stack
bool isEmpty(pSTACK pS) {
    return (pS->top == 0);
}

// delete stack to free memory
void deleteStack(pSTACK pS) {
    if (!pS) return;
    if (pS->array) free(pS->array);
    free(pS);
}