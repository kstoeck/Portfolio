// Kevin Stoeck 1223480830

#ifndef DATA_STRUCTURES_H
#define DATA_STRUCTURES_H

// defining possible vertex markings
enum COLOR { WHITE, GRAY, BLACK };

typedef struct TAG_VERTEX {
    int     id;             // identification
    COLOR   marker;         // for marking
    double  distance;       // distance from start
    int     last;           // last vertex
    int     current;        // current vertex
} VERTEX;
typedef VERTEX *pVERTEX;

typedef struct TAG_NODE {
    int     edge;          // edge index
    int     start;         // start
    int     end;           // end  
    double  weight;        // weight
    struct TAG_NODE *next; // pointer to next node
} NODE;
typedef NODE *pNODE;



#endif