// Kevin Stoeck 1223480830

#ifndef HEAP_H
#define HEAP_H

#include "data_structures.h"

typedef VERTEX ELEMENT;
typedef ELEMENT *pELEMENT;

typedef struct TAG_HEAP {
    int         capacity; // max # of elements
    int         size;     // current # of elements
    pELEMENT   *H;        // array of pointers
} HEAP;
typedef HEAP *pHEAP;

pHEAP initHeap(int capacity);
void  insert(pHEAP pHeap, pVERTEX pV);
pVERTEX extractMin(pHEAP pHeap);
void  decreaseKey(pHEAP pHeap, int pos, double newKey);
void minHeapify(pHEAP pHeap, int i);

#endif