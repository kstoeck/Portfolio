// Kevin Stoeck 1223480830

#include "main.h"
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cfloat>

// print use format and exit msg
static void printUsageError() {
    fprintf(stderr, "Usage: ./PJ3 <InputFile> <GraphType> <Flag>\n");
}

// free all allocated memory
static void freeAll(pVERTEX* V, pNODE* ADJ, int n, pHEAP pHeap, pSTACK pStack)
{
    // free adjacency lists
    if (ADJ) {
        for (int i = 1; i <= n; i++) {
            pNODE cur = ADJ[i];
            while (cur) {
                pNODE tmp = cur;
                cur = cur->next;
                free(tmp);
            }
        }
        free(ADJ);
    }

    // free the V array
    if (V) {
        for (int i = 1; i <= n; i++) {
            if (V[i]) {
                free(V[i]);
            }
        }
        free(V);
    }

    // free stack
    if (pStack) {
        deleteStack(pStack);
    }

    // free heap
    if (pHeap) {
        if (pHeap->H) free(pHeap->H);
        free(pHeap);
    }
}

int main(int argc, char* argv[])
{
    // check for correct arg count
    if (argc != 4) {
        printUsageError();
        return 0;
    }

    const char* inputFile  = argv[1];
    const char* graphType  = argv[2];
    int flag               = atoi(argv[3]);

    // check for valid graph type and flag
    if (!isValidGraph(graphType) || !isValidFlag(flag)) {
        printUsageError();
        return 0;
    }

    pVERTEX* V  = nullptr;
    pNODE*   ADJ = nullptr;
    int n = 0, m = 0;

    // allocate mem for placeholders then free mem
    V  = (pVERTEX*)calloc(1, sizeof(pVERTEX));
    ADJ= (pNODE*)  calloc(1, sizeof(pNODE));
    free(V);
    free(ADJ);

    // allocate mem for vertices
    V   = (pVERTEX*)calloc( (1000000), sizeof(pVERTEX) );
    ADJ = (pNODE*)  calloc( (1000000), sizeof(pNODE) );

    // read graph and fill data structure
    buildGraph(inputFile, graphType, flag, V, ADJ, n, m);

    // init heap and stack
    pHEAP  pHeap  = initHeap(n);
    pSTACK pStack = initStack(n);

    // track last states
    int lastSource      = -1;
    int lastDestination = -1;
    bool lastWasSinglePair   = false;
    bool lastWasSingleSource = false;

    char instruction[64];
    // read user instructions until "Stop"
    while (true) {
        if (!(std::cin >> instruction)) {
            break;
        }

        if (strcmp(instruction, "Stop") == 0) {
            break;
        }

        else if (strcmp(instruction, "PrintADJ") == 0) {
            printADJ(ADJ, n);
        }

        else if (strcmp(instruction, "SinglePair") == 0) {
            int s, t;
            if (!(std::cin >> s >> t)) {
                fprintf(stderr, "Invalid instruction.\n");
                continue;
            }

            // reset heap
            pHeap->size = 0; 
            dijkstraSinglePair(V, ADJ, pHeap, n, s, t);

            lastSource       = s;
            lastDestination  = t;
            lastWasSinglePair   = true;
            lastWasSingleSource = false;
        }

        else if (strcmp(instruction, "SingleSource") == 0) {
            int s;
            if (!(std::cin >> s)) {
                fprintf(stderr, "Invalid instruction.\n");
                continue;
            }

            pHeap->size = 0;
            dijkstraSingleSource(V, ADJ, pHeap, n, s);

            lastSource      = s;
            lastDestination = -1;
            lastWasSinglePair   = false;
            lastWasSingleSource = true;
        }

        else if (strcmp(instruction, "PrintLength") == 0) {
            int s, t;
            if (!(std::cin >> s >> t)) {
                fprintf(stderr, "Invalid instruction.\n");
                continue;
            }

            bool valid = false;
            // check that s and t match last
            if (lastWasSinglePair) {
                if (s == lastSource && t == lastDestination) {
                    valid = true;
                }
            }
            else if (lastWasSingleSource) {
                if (s == lastSource) {
                    valid = true;
                }
            }
            if (!valid) {
                fprintf(stderr, "Invalid instruction.\n");
                continue;
            }

            printLength(V, s, t);
        }

        else if (strcmp(instruction, "PrintPath") == 0) {
            int s, t;
            if (!(std::cin >> s >> t)) {
                fprintf(stderr, "Invalid instruction.\n");
                continue;
            }
            bool valid = false;
            // check that s and t match last
            if (lastWasSinglePair) {
                if (s == lastSource && t == lastDestination) {
                    valid = true;
                }
            }
            else if (lastWasSingleSource) {
                if (s == lastSource) {
                    valid = true;
                }
            }
            if (!valid) {
                fprintf(stderr, "Invalid instruction.\n");
                continue;
            }

            // rebuild stack using stack
            pStack->top = 0;
            printPath(V, s, t, pStack);
        }

        else {
            fprintf(stderr, "Invalid instruction.\n");
        }
    }

    // free mem
    freeAll(V, ADJ, n, pHeap, pStack);
    return 0;
}