#include<iostream>
#include<cstring>
#include<memory>

using namespace std;

void worstfit(int bsize[], int lenb, int psize[], int lenp) {
    int alloc[lenp];
    memset(alloc, -1, sizeof(alloc));

    cout << "\nProcess No.\tProcess Size\tBlock No.\tSize Left\n";

    for(int i=0; i<lenp; i++) {
        cout << " " << i+1 << "\t\t" << psize[i] << "\t\t";

        for(int j=0; j<lenb; j++) {
            if(bsize[j] >= psize[i]) {
                alloc[i] = j;
                bsize[j] -= psize[i];
                break;
            }
        }

        if(alloc[i] != -1) {
           cout << alloc[i] + 1 << "\t\t";
           cout << bsize[alloc[i]]; 
        } else {
           cout << "Not Allocated";
        }
        cout << endl;
    }
}


void bestfit(int bsize[], int lenb, int psize[], int lenp) {
    int alloc[lenp];
    memset(alloc, -1, sizeof(alloc));

    for(int i=0; i<lenp; i++) {
        int bestfitID = -1;
        for(int j=0; j<lenb; j++) {
            if(bsize[j] >= psize[i])
                if(bestfitID == -1 || bsize[bestfitID] > bsize[j])
                    bestfitID = j;
        }

        if(bestfitID != -1) {
            alloc[i] = bestfitID;
            bsize[bestfitID] -= psize[i];
        }
    }

    cout << "\nProcess No.\tProcess Size\tBlock No.\tSize Left\n";

    for(int i=0; i<lenp; i++) {
        cout << " " << i+1 << "\t\t" << psize[i] << "\t\t";
        if(alloc[i] != -1) {
            cout << alloc[i] + 1 << "\t\t";
            cout << bsize[alloc[i]];
        } else {
            cout << "Not Allocated";
        }
        cout << endl;
    }
}


int main(int argc, char *argv[]) {
    int blockSize[] = {100, 500, 200, 300, 600};
    int processSize[] = {212, 417, 112, 426};

    int lenb = sizeof(blockSize)/sizeof(blockSize[0]);
    int lenp = sizeof(processSize)/sizeof(processSize[0]);

    //best fit algrithm to allocate the memory 
    cout << "---- Best Fit Algrithm ----";
    bestfit(blockSize, lenb, processSize, lenp);

    int blockSize2[] = {100, 500, 200, 300, 600};
    int processSize2[] = {212, 417, 112, 426};

    //worst fit algrithm to allocate the memory
    cout << endl << "---- Worst Fit Algrithm ----";
    worstfit(blockSize2, lenb, processSize2, lenp);

    return 0;
}
