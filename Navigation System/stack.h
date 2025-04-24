// Kevin Stoeck 1223480830

#ifndef STACK_H
#define STACK_H

#include "data_structures.h"

typedef struct TAG_STACK {
    int capacity;   // max number
    int top;        // top index
    int *array;     // array to store elements
} STACK;
typedef STACK *pSTACK;

pSTACK initStack(int capacity);
void   push(pSTACK pS, int x);
int    pop(pSTACK pS);
bool   isEmpty(pSTACK pS);
void   deleteStack(pSTACK pS);

#endif