// Kevin Stoeck 1223480830

#include "util.h"
#include <cstring>

// check for valid graph
bool isValidGraph(const char* graphType) {
    if (strcmp(graphType, "DirectedGraph") == 0) {
    return true;
    }
    if (strcmp(graphType, "UndirectedGraph") == 0) {
    return true;
    }
    return false;
}

// check for valid flag
bool isValidFlag(int f) {
    return (f == 0 || f == 1);
}