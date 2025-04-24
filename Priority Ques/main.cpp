// Kevin Stoeck 1223480830

#include <iomanip>
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include "main.h"
#include "util.h"
#include "heap.h"
#include "data_structures.h"

using namespace std;

// global variables
ELEMENT **V = NULL; // array element pointer
HEAP *pHeap = NULL; // heap structure pointer
int n = 0;          // number of elements 

int main(int argc, char *argv[]){

    // check for valid argument
    if (argc != 3){
        cerr <<"Usage: ./PJ2 <I-File> <O-File>"<< endl;
        cerr <<"<I-File> is the input file"<< endl;
        cerr <<"<O-File> is the output file"<< endl;
        return 1;
    }

    // read instruction until Stop instruction or error/EOF
    while (true){
        string instruction;
        // error or end of input check
        if (!(cin >> instruction)){
            break;
        }
        // stop
        if (instruction == "Stop") {
            cout <<"Instruction: Stop"<< endl;
            break;
        }
        // read input
        else if (instruction == "Read"){
            cout <<"Instruction: Read"<< endl;
            processRead(argv[1]);
        }
        // print array
        else if (instruction == "PrintArray"){
            cout <<"Instruction: PrintArray"<< endl;
            processPrintArray();
        }
        // print heap
        else if (instruction == "PrintHeap"){
            cout <<"Instruction: PrintHeap"<< endl;
            processPrintHeap();
        }
        // build heap
        else if (instruction == "BuildHeap"){
            cout <<"Instruction: BuildHeap" << endl;
            processBuildHeap();
        }
        // insert element
        else if (instruction == "Insert"){
            int idx;
            cin >> idx;
            cout <<"Instruction: Insert "<<idx<< endl;
            processInsert(idx);
        }
        // extract minimum
        else if (instruction == "ExtractMin"){
            cout <<"Instruction: ExtractMin"<< endl;
            processExtractMin();
        }
        // decrease key
        else if (instruction == "DecreaseKey"){
            int idx;
            double newKey;
            cin >> idx >> newKey;
            cout <<"Instruction: DecreaseKey "<<idx<<" "<<fixed<<setprecision(6)<<newKey<< endl;
            processDecreaseKey(idx, newKey);
        }
        // write output
        else if (instruction == "Write"){
            cout <<"Instruction: Write"<< endl;
            processWrite(argv[2]);
        }
        // bad instruction
        else {
            cout <<"Warning: Invalid instruction"<< endl;
        }
    }

    // free memory before exit
    cleanUpMemory();

    return 0;
}