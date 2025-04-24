// Kevin Stoeck 1223480830

#ifndef HEAP_H
#define HEAP_H

#include "data_structures.h"

void swapHeapNodes(HEAP *pHeap, ELEMENT **V, int i, int j);

void MinHeapify(HEAP *pHeap, int i, ELEMENT **V);

void BuildMinHeap(HEAP *pHeap, ELEMENT **V);

#endif