// Kevin Stoeck 1223480830

#ifndef UTIL_H
#define UTIL_H

void processRead(const char* inputeFile);

void processPrintArray();

void processPrintHeap();

void processBuildHeap();

void processInsert(int index);

void processExtractMin();

void processDecreaseKey(int index, double newKey);

void processWrite(const char* outputFile);

void cleanUpMemory();

#endif