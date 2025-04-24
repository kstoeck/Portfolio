// Kevin Stoeck 1223480830

#include "heap.h"
#include <cstdio>
#include <cfloat>
#include <iostream>
using namespace std;

// allocate memory and init heap
pHEAP initHeap(int capacity) {
    pHEAP pH = (pHEAP)calloc(1, sizeof(HEAP));
    if (!pH) {
        fprintf(stderr, "Error: cannot allocate memory for heap.\n");
        exit(EXIT_FAILURE);
    }
    pH->capacity = capacity;
    pH->size = 0;
    pH->H = (pVERTEX*)calloc(capacity + 1, sizeof(pVERTEX));
    if (!pH->H) {
        fprintf(stderr, "Error: cannot allocate memory for heap array.\n");
        exit(EXIT_FAILURE);
    }
    return pH;
}

// change positions of 2 vertices in heap
void swapVertices(pVERTEX* a, pVERTEX* b) {
    pVERTEX temp = *a;
    *a = *b;
    *b = temp;
    int tempPos = (*a)->current;
    (*a)->current = (*b)->current;
    (*b)->current = tempPos;
}

// maintain heap property at i
void minHeapify(pHEAP pHeap, int i) {
    int left  = 2 * i;
    int right = 2 * i + 1;
    int smallest = i;

    // compare left
    if (left <= pHeap->size && pHeap->H[left]->distance < pHeap->H[smallest]->distance)
    {
        smallest = left;
    }
    // compare right
    if (right <= pHeap->size && pHeap->H[right]->distance < pHeap->H[smallest]->distance)
    {
        smallest = right;
    }
    // if right or left is smaller swap and recurse
    if (smallest != i)
    {
        swapVertices(&pHeap->H[i], &pHeap->H[smallest]);
        minHeapify(pHeap, smallest);
    }
}

// move node up if it is smaller than parent
void bubbleUp(pHEAP pHeap, int i) {
    while (i > 1 && pHeap->H[i / 2]->distance  > pHeap->H[i]->distance ) {
        swapVertices(&pHeap->H[i], &pHeap->H[i / 2]);
        i = i / 2;
    }
}

// inset vertex into heap
void insert(pHEAP pHeap, pVERTEX pV) {
    if (pHeap->size == pHeap->capacity) {
        fprintf(stderr, "Error: Heap is full. Cannot insert.\n");
        return;
    }
    pHeap->size += 1;
    int i = pHeap->size;
    pHeap->H[i] = pV;
    pV->current  = i;
    bubbleUp(pHeap, i);
}

// remove and return min vertex
pVERTEX extractMin(pHEAP pHeap) {
    if (pHeap->size < 1) {
        return NULL;
    }
    pVERTEX minVertex = pHeap->H[1];
    pHeap->H[1] = pHeap->H[pHeap->size];
    pHeap->H[1]->current  = 1;
    pHeap->size -= 1;
    minHeapify(pHeap, 1);
    minVertex->current  = 0;
    return minVertex;
}

// decrease key of vertex then move it up in the heap
void decreaseKey(pHEAP pHeap, int pos, double newKey) {
    if (pos < 1 || pos > pHeap->size) {
        fprintf(stderr, "Error: invalid position in decreaseKey.\n");
        return;
    }
    if (newKey > pHeap->H[pos]->distance) {
        return;
    }
    pHeap->H[pos]->distance = newKey;
    bubbleUp(pHeap, pos);
}

