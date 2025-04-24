// Kevin Stoeck 1223480830

#include <iomanip>
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include "util.h"
#include "data_structures.h"
#include "heap.h"
#include "main.h"

using namespace std;

// read instruction and create data structure
void processRead(const char* inputFile){
    ifstream fin(inputFile);
    if (!fin.is_open()){
        cerr <<"Error: cannot open input file"<< endl;
        return;
    }

    int tempN;
    fin >> tempN;
    if (tempN <= 0){
        cerr <<"Error: invalid number of elements (n)"<< endl;
        fin.close();
        return;
    }

    // clean up memory
    cleanUpMemory();

    // allocate memory for elements
    n = tempN;
    V = new ELEMENT*[n+1];
    for (int i = 1; i <= n; i++){
        V[i] = new ELEMENT;
    }

    // read keys and init array
    for (int i = 1; i <= n; i++){
        double keyVal;
        fin >> keyVal;
        V[i]->index = i;
        V[i]->key = keyVal;
        V[i]->pos = 0;
    }

    fin.close();

    // init heap
    pHeap = new HEAP;
    pHeap->capacity = n;
    pHeap->size = 0;
    pHeap->H = new int[n+1];
}

// print array instruction
void processPrintArray(){
    if (V == NULL){
        cerr <<"Error: array is NULL"<< endl;
        return;
    }

    for (int i = 1; i <= n; i++){
        fprintf(stdout, "%d %.6f %d\n", i, V[i]->key, V[i]->pos);
    }
}

// print heap instruction
void processPrintHeap(){
    if (pHeap == NULL){
        cerr <<"Error: heap is NULL"<< endl;
        return;
    }

    cout <<"Capacity = "<<pHeap->capacity<<", size = "<<pHeap->size<< endl;
    for (int i = 1; i <= pHeap->size; i++){
        cout <<"H["<<i<<"] = "<<pHeap->H[i]<< endl;
    }
}

// build heap instruction
void processBuildHeap(){
    if (V == NULL || pHeap == NULL){
        return;
    }

    pHeap->size = n;
    for (int i = 1; i <= n; i++){
        pHeap->H[i] = i;
        V[i]->pos = i;
    }

    BuildMinHeap(pHeap, V);
}

// insert at index instruction
void processInsert(int index) {
    if (index < 1 || index > n) {
        cerr << "Error: index out of bound" << endl;
        return;
    }

    if (V[index]->pos != 0) {
        cerr << "Error: V[" << index << "] already in the heap" << endl;
        return;
    }

    // increase heap size and add element
    pHeap->size++;
    int heapSize = pHeap->size;
    pHeap->H[heapSize] = index;
    V[index]->pos = heapSize;

    int i = heapSize;

    // maintain min heap property
    while (i > 1) {
        int parent = i / 2;
        if (V[pHeap->H[parent]]->key <= V[pHeap->H[i]]->key) {
            break;
        }

        swapHeapNodes(pHeap, V, parent, i);
        i = parent;
    }

    cout << "Element V[" << index << "] inserted into the heap" << endl;
}

// extract minimum instruction
void processExtractMin() {
    if (pHeap == NULL) {
        cerr << "Error: heap is NULL" << endl;
        return;
    }

    if (pHeap->size == 0) {
        cerr << "Error: heap is empty" << endl;
        return;
    }

    int minIndex = pHeap->H[1];

    // move last element to root and decrease heap size
    pHeap->H[1] = pHeap->H[pHeap->size];
    V[pHeap->H[1]]->pos = 1;
    pHeap->size--;

    // mark extracted element as removed
    V[minIndex]->pos = 0;

    // restore min heap property
    MinHeapify(pHeap, 1, V);
}

// decrease key instruction
void processDecreaseKey(int index, double newKey) {
    if (index < 1 || index > n || newKey >= V[index]->key) {
        cerr << "Error: invalid call to DecreaseKey" << endl;
        return;
    }

    if (V[index]->pos == 0) {
        cerr << "Error: V[" << index << "] not in the heap" << endl;
        return;
    }

    // update key value
    V[index]->key = newKey;

    int i = V[index]->pos;

    // maintain min heap property
    while (i > 1) {
        int parent = i / 2;
        if (V[pHeap->H[parent]]->key <= V[pHeap->H[i]]->key) {
            break;
        }

        swapHeapNodes(pHeap, V, parent, i);
        i = parent;
    }
}

// write instruction
void processWrite(const char* outputFile){
    ofstream fout(outputFile);
    if (!fout.is_open()){
        cerr <<"Error: cannot open output file"<< endl;
        return;
    }

    // write each elements index, key, and position
    for (int i = 1; i <= n; i++){
        fout <<i<<" "<<fixed<<setprecision(6)<<V[i]->key<<" "<<V[i]->pos<<"\n";
    }

    fout.close();
}

// clean up memory
void cleanUpMemory(){
    if (V != NULL){
        for (int i = 1; i <= n; i++){
            delete V[i];
        }
        delete[] V;
        V = NULL;
    }

    if (pHeap != NULL){
        if (pHeap->H != NULL){
            delete[] pHeap->H;
            pHeap->H = NULL;
        }
        delete pHeap;
        pHeap = NULL;
    }
    n = 0;
}