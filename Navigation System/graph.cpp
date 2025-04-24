// Kevin Stoeck 1223480830

#include "graph.h"
#include <cstdio>
#include <cfloat>
#include <cstdlib>
#include <cstring>

// create a new adjacency-list node
pNODE createNode(int edgeIndex, int start, int end, double weight) {
    pNODE newNode = (pNODE)calloc(1, sizeof(NODE));
    if (!newNode) {
        fprintf(stderr, "Error: cannot allocate memory for adjacency node.\n");
        exit(EXIT_FAILURE);
    }
    newNode->edge   = edgeIndex;
    newNode->start  = start;
    newNode->end    = end;
    newNode->weight = weight;
    newNode->next   = NULL;
    return newNode;
}

// insert a node at the front of a linked list
pNODE insertFront(pNODE pHEAD, pNODE pNEW) {
    pNEW->next = pHEAD;
    return pNEW;
}

// insert a node at the rear of a linked list
pNODE insertRear(pNODE pHEAD, pNODE pNEW) {
    if (!pHEAD) {
        return pNEW;
    }
    pNODE temp = pHEAD;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    temp->next = pNEW;
    return pHEAD;
}

// read a graph from a file and build adjacency list
void buildGraph(const char* filename, const char* graphType, int flag,
                pVERTEX *V, pNODE *ADJ, int &n, int &m)
{
    FILE* fp = fopen(filename, "r");
    if (!fp) {
        fprintf(stderr, "Error: cannot open file %s.\n", filename);
        exit(EXIT_FAILURE);
    }

    fscanf(fp, "%d %d", &n, &m);

    // init the vertex array and adjacency list
    for (int i = 1; i <= n; i++) {
        V[i] = (pVERTEX)calloc(1, sizeof(VERTEX));
        if (!V[i]) {
            fprintf(stderr, "Error: cannot allocate memory for V[%d].\n", i);
            exit(EXIT_FAILURE);
        }
        // can initialize them here if needed:
        V[i]->id       = i;
        V[i]->marker   = WHITE;
        V[i]->distance = DBL_MAX;
        V[i]->last     = -1;
        V[i]->current  = 0;
        ADJ[i] = NULL;
    }

    // read edges and fill adjacency list
    for (int i = 0; i < m; i++) {
        int edgeIndex, u, v;
        double w;
        fscanf(fp, "%d %d %d %lf", &edgeIndex, &u, &v, &w);

        pNODE newNode = createNode(edgeIndex, u, v, w);

        if (strcmp(graphType, "DirectedGraph") == 0) {
            if (flag == 1) {
                ADJ[u] = insertRear(ADJ[u], newNode);
            } else {
                ADJ[u] = insertFront(ADJ[u], newNode);
            }
        }
        else if (strcmp(graphType, "UndirectedGraph") == 0) {
            // for undirected, insert both (u->v) and (v->u)
            pNODE newNode2 = createNode(edgeIndex, v, u, w);
            if (flag == 1) {
                ADJ[u] = insertRear(ADJ[u], newNode);
                ADJ[v] = insertRear(ADJ[v], newNode2);
            } else {
                ADJ[u] = insertFront(ADJ[u], newNode);
                ADJ[v] = insertFront(ADJ[v], newNode2);
            }
        }
        else {
            fprintf(stderr, "Error: invalid graph type: %s.\n", graphType);
            fclose(fp);
            exit(EXIT_FAILURE);
        }
    }

    fclose(fp);
}

// print the adjacency list
void printADJ(pNODE *ADJ, int n) {
    for (int i = 1; i <= n; i++) {
        printf("ADJ[%d]:", i);
        pNODE temp = ADJ[i];
        while (temp != NULL) {
            // show [start end: weight]
            printf("-->[%d %d: %4.2lf]", temp->start, temp->end, temp->weight);
            temp = temp->next;
        }
        printf("\n");
    }
}

// dijkstra for single pair (s -> t)
void dijkstraSinglePair(pVERTEX *V, pNODE *ADJ, pHEAP pHeap, int n, int s, int t) {
    // initialize vertices
    for (int i = 1; i <= n; i++) {
        V[i]->id       = i;
        V[i]->marker   = WHITE;
        V[i]->distance = DBL_MAX;
        V[i]->last     = -1;
        V[i]->current  = 0; 
    }
    // start vertex
    V[s]->distance = 0.0;
    V[s]->marker   = GRAY;
    insert(pHeap, V[s]);

    while (pHeap->size > 0) {
        pVERTEX u = extractMin(pHeap);
        if (u->id == t) {
            // if t extracted, stop early
            break;
        }
        pNODE adjNode = ADJ[u->id];
        while (adjNode != NULL) {
            pVERTEX v = V[adjNode->end];
            double newDist = u->distance + adjNode->weight;
            if (v->marker == WHITE) {
                v->marker   = GRAY;
                v->distance = newDist;
                v->last     = u->id;
                insert(pHeap, v);
            }
            else if (v->marker == GRAY) {
                if (newDist < v->distance) {
                    v->distance = newDist;
                    v->last     = u->id;
                    decreaseKey(pHeap, v->current, newDist);
                }
            }
            adjNode = adjNode->next;
        }
        u->marker = BLACK;
    }
}

// dijkstra for single source (s -> all)
void dijkstraSingleSource(pVERTEX *V, pNODE *ADJ, pHEAP pHeap, int n, int s) {
    // init vertices
    for (int i = 1; i <= n; i++) {
        V[i]->id       = i;
        V[i]->marker   = WHITE;
        V[i]->distance = DBL_MAX;
        V[i]->last     = -1;
        V[i]->current  = 0; 
    }
    // start vertex
    V[s]->distance = 0.0;
    V[s]->marker   = GRAY;
    insert(pHeap, V[s]);

    while (pHeap->size > 0) {
        pVERTEX u = extractMin(pHeap);
        pNODE adjNode = ADJ[u->id];
        while (adjNode != NULL) {
            pVERTEX v = V[adjNode->end];
            double newDist = u->distance + adjNode->weight;
            if (v->marker == WHITE) {
                v->marker   = GRAY;
                v->distance = newDist;
                v->last     = u->id;
                insert(pHeap, v);
            }
            else if (v->marker == GRAY) {
                if (newDist < v->distance) {
                    v->distance = newDist;
                    v->last     = u->id;
                    decreaseKey(pHeap, v->current, newDist);
                }
            }
            adjNode = adjNode->next;
        }
        u->marker = BLACK;
    }
}

// print the path from s to t based on pred links
void printPath(pVERTEX *V, int s, int t, pSTACK pStack) {
    if (t < 1) return;

    if (V[t]->distance == DBL_MAX) {
        printf("There is no path from %d to %d.\n", s, t);
        return;
    }

    int cur = t;
    while (cur != -1) {
        push(pStack, cur);
        cur = V[cur]->last;
    }

    printf("The shortest path from %d to %d is:\n", s, t);

    bool first = true;
    while (!isEmpty(pStack)) {
        int vIndex = pop(pStack);
        if (first) {
            printf("[%d: %7.2lf]", vIndex, V[vIndex]->distance);
            first = false;
        } else {
            printf("-->[%d: %7.2lf]", vIndex, V[vIndex]->distance);
        }
    }
    printf(".\n");
}

// print the distance of path from s to t
void printLength(pVERTEX *V, int s, int t) {
    if (V[t]->distance == DBL_MAX) {
        printf("There is no path from %d to %d.\n", s, t);
        return;
    }
    printf("The length of the shortest path from %d to %d is:     %4.2lf\n",
           s, t, V[t]->distance);
}

