#include <exception>
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

int main() {

    ifstream infile;
    ofstream outfile;
    infile.open("Tux.jpg");
    outfile.open("test.jpg");

    char c;
    unsigned int n;
    int digit_counter = 0;
    while (infile.get(c)){
       digit_counter = digit_counter + 1;
       n = (unsigned char) c;
       outfile <<c;
    }
}
