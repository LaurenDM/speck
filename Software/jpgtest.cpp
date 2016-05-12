#include <exception>
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

#define u24 unsigned long
int num_chars_per_word = 3;
typedef u24 word;
int N=24;

void print_ascii_from_hex(FILE* outfile, word block[]){
  for(int b=0; b<2; b++){
    for(int i=0; i<num_chars_per_word; i++){
      int n = (block[b]>>(N-8*(i+1)))&0x0000FF; // take 2 hexadecimal digits at a time
      fprintf(outfile,"%c",static_cast<char>(n));
    }
  }
}

void convert_ascii_to_hex(char infilename[], char outfilename[]){
  // open input/output files
  ifstream infile;
  ofstream outfile;
  infile.open(infilename,std::ios::binary);
  outfile.open(outfilename);

  // write to output file
  int digit_counter = 0;
  unsigned int n;
  char c;
  if (infile.is_open()){
    while (infile.get(c)){
       n = (unsigned char) c;
       digit_counter = digit_counter + 1;
       if(n<16){ // only one hexadecimal digit
          outfile << "0"; // we need two digits for every character
       }
       outfile << hex << n; // regular character write
       if (digit_counter == num_chars_per_word){
           outfile << " "; // adding space after first word
       } else if (digit_counter == 2*num_chars_per_word){
          outfile << "\n"; // start writing on new line
          digit_counter = 0;
       }
    }
  } else{
    cerr << "Plaintext/ciphertext file could not be found! Exiting..\n";
  }
  // pad with zeros to get full blocks
  if(digit_counter !=0){
    while(digit_counter < 2*num_chars_per_word){
      outfile << "00";
      digit_counter=digit_counter+1;
      if(digit_counter==num_chars_per_word){
        outfile << " ";
      }
    }
    outfile << "\n";
  }
  infile.close();
  outfile.close();
}

int main() {
    ifstream in;
    ofstream out;
    in.open("apple.jpg",std::ios::binary);
    out.open("test.txt");
    char c;
    while (in.get(c)){
       out << c;
    }
    return 0;

    convert_ascii_to_hex("iceland.jpg","test.txt");

    ifstream infile;
    infile.open("test.txt",std::ios::binary);
    FILE* outfile = fopen("out.jpg","wb");
    if(!infile.is_open()){
      std::cerr << "couldn't open test.txt" << std::endl;
      return 1;
    }
    if(outfile == NULL){
      std::cerr << "couldn't open out.jpg" << std::endl;
      return 1;
    }

    bool indone=false;
    word in1, in2;
    word block[2];
    while(!indone){
      if(infile >> std::hex>> in1){
        block[0] = in1;
        infile >> std::hex >> in2;
        block[1] = in2;
        print_ascii_from_hex(outfile,block);
      }
      else{
        indone=true;
        infile.close();
      }
    }
    fclose(outfile);

    return 0;
}
