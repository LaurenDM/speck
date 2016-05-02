
#include <iostream>
#include <fstream>
#include <unistd.h>
#include <cmath>
#include <time.h>

#include "bsv_scemi.h"
#include "SceMiHeaders.h"
#include "ResetXactor.h"
#include <stdio.h>
#include <stdlib.h>
using namespace std;

#define u24 unsigned long

typedef u24 word;
typedef BitT<24> scemiword;

FILE* outfile = NULL;

bool indone = false;
long int putcount = 0;
long int gotcount = 0;

int num_chars_per_word = 3; // each character is transformed to two hexadecimal digits
int N = 24;

void print_ascii_from_hex(word block[]){
  for(int b=0; b<2; b++){
    for(int i=0; i<num_chars_per_word; i++){
      int n = (block[b]>>(N-8*(i+1)))&0x0000FF; // take 2 hexadecimal digits at a time
      fprintf(outfile,"%c",static_cast<char>(n));
    }
  }
}

void out_cb(void* x, const BlockType& block_in)
{
    word block[2];
    //printf("receiving output, gotcount = %ld, putcount = %ld \n",gotcount,putcount);
    if (gotcount < putcount) {
        if(block_in.m_tpl_1.get()!=0 && block_in.m_tpl_2.get()!=0) {
          block[0] = block_in.m_tpl_1.get(); block[1] = block_in.m_tpl_2.get();
          print_ascii_from_hex(block);
          gotcount++;
        }
    } else if (indone && outfile) {
        //printf("closing outfile \n");
        fclose(outfile);
        outfile = NULL;
    }

}

void runtest(InportProxyT<BlockType >& inport, FILE* infile)
{
    word in1, in2;
    while (outfile) {
        if (!indone) {
            //printf("scanning, gotcount = %ld, putcount= %ld  \n",gotcount,putcount);
            fscanf(infile,"%lx %lx",&in1, &in2);

            if (in1 == 0 && in2 == 0) { // we will use 0's to indicate end of plaintexts/ciphertexts
                //printf("end of file \n");
                indone = true;
                fclose(infile);
                infile = NULL;
            } else {
                //printf("sending input %lx %lx \n",in1,in2);
                BlockType block;
                block.m_tpl_1 = BitT<24>(in1);
                block.m_tpl_2 = BitT<24>(in2);
                putcount++;
                inport.sendMessage(block);
            }
        }
        else{
            BlockType block;
            inport.sendMessage(block);
        }
        sleep(0);
    }
}

void convert_ascii_to_hex(char filename_in[], char filename_out[]){
  // open input/output files
  ifstream infile;
  ofstream outfile;
  infile.open(filename_in);
  outfile.open(filename_out);

  // write to output file
  int digit_counter = 0;
  int n;
  char c;
  string line;
  if (infile.is_open()){
    while (infile.get(c)){
       digit_counter = digit_counter + 1;
       n = (unsigned char) c;
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
  outfile << "0 0 \n"; // indicate end of file
  infile.close();
  outfile.close();
}

int main(int argc, char* argv[])
{
    int sceMiVersion = SceMi::Version( SCEMI_VERSION_STRING );
    SceMiParameters params("scemi.params");
    SceMi *sceMi = SceMi::Init(sceMiVersion, &params);

    // Initialize the SceMi inport
    InportProxyT<BlockType > inport ("", "scemi_processor_req_inport", sceMi);
    InportProxyT<Key_Iv> setkey ("", "scemi_setkey_inport", sceMi);

    // Initialize the SceMi outport
    OutportProxyT<BlockType > outport ("", "scemi_processor_resp_outport", sceMi);
    outport.setCallBack(out_cb, NULL);

    // Initialize the reset port.
    ResetXactor reset("", "scemi", sceMi);

    ShutdownXactor shutdown("", "scemi_shutdown", sceMi);

    // Service SceMi requests
    SceMiServiceThread *scemi_service_thread = new SceMiServiceThread (sceMi);

    // Reset the dut.
    reset.reset();

    convert_ascii_to_hex("in.txt","pt_in.txt");
    /********************************* SET KEYS *****************************************/
    Key_Iv ki;
    FILE* infile = fopen("key.txt","rb");
    word readword;
    for (int i=0; i<4; i++){
        fscanf(infile,"%lx",&readword);
        ki.m_key[i]=readword;
    }
    fclose(infile);
    infile = fopen("iv.txt","rb");
    fscanf(infile, "%lx", &readword);
    ki.m_iv.m_tpl_1 = readword;
    fscanf(infile, "%lx", &readword);
    ki.m_iv.m_tpl_2 = readword;
    fclose(infile);
    setkey.sendMessage(ki);
    //printf("enc key = set \n");
    /********************************* ENCRYPT *****************************************/
    infile = fopen("pt_in.txt", "rb");
    if (infile == NULL) {
        std::cerr << "couldn't open pt_in.txt" << std::endl;
        return 1;
    }
    outfile = fopen("out.txt", "wb");
    if (outfile == NULL) {
        std::cerr << "couldn't open ciphermessage.txt" << std::endl;
        return 1;
    }
    // Send in all the data.
    runtest(inport,infile);

    /********************************* FINISH *****************************************/
    std::cout << "shutting down..." << std::endl;
    shutdown.blocking_send_finish();
    scemi_service_thread->stop();
    scemi_service_thread->join();
    SceMi::Shutdown(sceMi);
    std::cout << "finished" << std::endl;

    return 0;
}
