// Kevin Stoeck 1223480830

#include "heap.h"
#include "data_structures.h"
#include <iostream>
using namespace std;

// swap nodes in heap and change positions in aux array
void swapHeapNodes(HEAP *pHeap, ELEMENT **V, int i, int j) {
    int temp = pHeap->H[i];
    pHeap->H[i] = pHeap->H[j];
    pHeap->H[j] = temp;

    // update placement of swapped nodes
    V[pHeap->H[i]]->pos = i;
    V[pHeap->H[j]]->pos = j;
}

// find min heap at location i
void MinHeapify(HEAP *pHeap, int i, ELEMENT **V) {
    int left = 2 * i;
    int right = 2 * i + 1;
    int smallest = i;

    // compare with left child node
    if (left <= pHeap->size && V[pHeap->H[left]]->key < V[pHeap->H[smallest]]->key) {
        smallest = left;
    }

    // compare with right child node
    if (right <= pHeap->size && V[pHeap->H[right]]->key < V[pHeap->H[smallest]]->key) {
        smallest = right;
    }

    // if i is not smallest node, swap and recurs 
    if (smallest != i) {
        swapHeapNodes(pHeap, V, i, smallest);
        MinHeapify(pHeap, smallest, V);
    }
}

// build min heap
void BuildMinHeap(HEAP *pHeap, ELEMENT **V){
    int heapSize = pHeap->size;

    // heapify downwards from the last non-leaf 
    for (int i = heapSize / 2; i >= 1; i--){
        MinHeapify(pHeap, i, V);
    }
}