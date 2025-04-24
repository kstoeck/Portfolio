// Kevin Stoeck 1223480830

#ifndef DATA_STRUCTURES_H
#define DATA_STRUCTURES_H

typedef struct TAG_ELEMENT {
    int index;
    double key;
    int pos;
} ELEMENT;

typedef struct TAG_HEAP {
    int capacity;
    int size;
    int *H;
} HEAP;

#endif