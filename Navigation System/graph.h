// Kevin Stoeck 1223480830

#ifndef GRAPH_H
#define GRAPH_H

#include "data_structures.h"
#include "stack.h"
#include "heap.h"

void buildGraph(const char* filename, const char* graphType, int flag, pVERTEX *V, pNODE *ADJ, int &n, int &m);

void printADJ(pNODE *ADJ, int n);

void dijkstraSinglePair(pVERTEX *V, pNODE *ADJ, pHEAP pHeap, int n, int s, int t);
void dijkstraSingleSource(pVERTEX *V, pNODE *ADJ, pHEAP pHeap, int n, int s);

void printPath(pVERTEX *V, int s, int t, pSTACK pStack);
void printLength(pVERTEX *V, int s, int t);

#endif