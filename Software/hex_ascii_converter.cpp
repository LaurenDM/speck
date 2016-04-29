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

void convert_ascii_to_hex(){
  // open input/output files
  ifstream infile;
  ofstream outfile;
  infile.open("message.txt");
  outfile.open("pt_in.txt");

  // write to output file
  int digit_counter = 0;
  int n;
  string line;
  if (infile.is_open()){
    while (getline(infile,line)){
      for (int char_index=0; char_index < line.length(); char_index++){
	       digit_counter = digit_counter + 1;
         n = (int) line[char_index];
         outfile << hex << n; // regular character write
	       if (digit_counter == num_chars_per_word){
	          outfile << " "; // adding space after first word
	       } else if (digit_counter == 2*num_chars_per_word){
	          outfile << "\n"; // start writing on new line
	          digit_counter = 0;
	       }
      }
      // end of line character
      digit_counter=digit_counter+1;
      outfile << "0a";
      if(digit_counter == num_chars_per_word){
        outfile << " ";
      } else if(digit_counter == 2*num_chars_per_word){
        outfile << "\n";
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
    }
    outfile << "\n";
  }
  outfile << "0 0 \n"; // indicate end of file
  infile.close();
  outfile.close();
}

int main(){
  convert_ascii_to_hex();

  FILE* infile = fopen("pt_in.txt","rb");
  if (infile == NULL) {
      std::cerr << "couldn't open pt_in.txt" << std::endl;
      return 1;
  }
  FILE* outfile = fopen("message_out.txt","wb");
  if (outfile == NULL) {
      std::cerr << "couldn't open message_out.txt" << std::endl;
      return 1;
  }
  bool indone = false;
  word in1, in2;
  word block[2];
  while(!indone){
    fscanf(infile,"%lx %lx",&in1, &in2);
    if(in1==0 && in2==0){
      indone=true;
      fclose(infile);
    }
    else{
      block[0] = in1; block[1] = in2;
      print_ascii_from_hex(outfile,block);
    }
  }
  fclose(outfile);

  return 0;
}
