#include <exception>
#include <iostream>
#include <fstream>
using namespace std;

//---- define conversion functions -----//
// char convertCharToHex(char character){
//   cout << "got char " << character << endl;
//   char a;
//   a << hex << character;
//   cout << " and " << a;
// }

int main(){
  //define Speck specific numbers
  int num_digits_per_word = 6; //word size is 24, block size=48; each word therefore 6 hex digits; two words per line
  
  // open input/output files
  ifstream infile;
  ofstream outfile;
  infile.open("plaintext_ascii.txt");
  outfile.open("plaintext_hex.txt");

  // write to output file
  int digit_counter = 0;
  string line;
  if (infile.is_open()){
    while (getline(infile,line)){
      for (int char_index=0; char_index < line.length(); char_index++){
	digit_counter = digit_counter + 1;
	//cout << "counter" << digit_counter;
	if (digit_counter!= 6 && digit_counter!=12){
	  outfile << hex << (int)line[char_index]; // regular character write
	}else if (digit_counter == 6){
	  outfile << hex << (int)line[char_index] << " "; // adding space after first word
	}else if (digit_counter == 12){
	  outfile << hex << (int)line[char_index] << "\n"; // start writing on new line
	  digit_counter = 0;
	}
      }
      if (true){
	return 0;
      }
    }
  }else{
    cerr << "Plaintext/ciphertext file could not be found! Exiting..\n";
  }

  infile.close();
  outfile.close();
  return 0;
}
