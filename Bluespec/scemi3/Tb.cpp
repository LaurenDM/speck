
#include <iostream>
#include <unistd.h>
#include <cmath>
#include <time.h>

#include "bsv_scemi.h"
#include "SceMiHeaders.h"
#include "ResetXactor.h"

#define u24 unsigned long

typedef u24 word;
typedef BitT<24> scemiword;

FILE* outfile = NULL;

bool indone = false;
long int putcount = 0;
long int gotcount = 0;


void out_cb(void* x, const BlockType& block)
{
    //printf("receiving output, gotcount = %ld, putcount = %ld \n",gotcount,putcount);
    if (gotcount < putcount) {
        if(block.m_tpl_1.get()!=0 && block.m_tpl_2.get()!=0) {
          fprintf(outfile,"%x %x \n",block.m_tpl_1.get(),block.m_tpl_2.get());
          gotcount++;
        }
    } else if (indone && outfile) {
        //printf("closing outfile \n");
        word end = 0x0;
        fprintf(outfile,"%lx %lx \n",end,end);
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

    /********************************* DECRYPT *****************************************/
    Key_Iv ki;
    word enkey[4] = {0x020100, 0x0a0908, 0x121110, 0x1a1918};
    for (int i=0; i<4; i++){
        ki.m_key[i]=enkey[i];
    }
    ki.m_iv.m_tpl_1 = 0x735e10;
    ki.m_iv.m_tpl_2 = 0xb6445d;
    setkey.sendMessage(ki);
    //printf("enc key = set \n");
    FILE* infile = fopen("pt_in.txt", "rb");
    if (infile == NULL) {
        std::cerr << "couldn't open pt_in.txt" << std::endl;
        return 1;
    }
    outfile = fopen("ct_out.txt", "wb");
    if (outfile == NULL) {
        std::cerr << "couldn't open ct_out.txt" << std::endl;
        return 1;
    }
    // Send in all the data.
    clock_t starttime,endtime;
    starttime = clock();
    runtest(inport,infile);
    endtime = clock();
    printf("encryption done, duration = %f seconds \n",((float) endtime-starttime)/CLOCKS_PER_SEC);

    /********************************* DECRYPT *****************************************/
    // reset
    // Reset the dut.
    reset.reset();
    sleep(10);
    indone = false;
    putcount = 0;
    gotcount = 0;
    setkey.sendMessage(ki); // key and iv stay the same
    infile = fopen("ct_out.txt", "rb");
    if (infile == NULL) {
        std::cerr << "couldn't open ct_out.txt" << std::endl;
        return 1;
    }
    outfile = fopen("pt_out.txt", "wb");
    if (outfile == NULL) {
        std::cerr << "couldn't open pt_out.txt" << std::endl;
        return 1;
    }
    starttime =clock();
    runtest(inport,infile);
    endtime=clock();
    printf("decryption done, duration = %f seconds \n",((float) endtime-starttime)/CLOCKS_PER_SEC);
    /********************************* FINISH *****************************************/
    std::cout << "shutting down..." << std::endl;
    shutdown.blocking_send_finish();
    scemi_service_thread->stop();
    scemi_service_thread->join();
    SceMi::Shutdown(sceMi);
    std::cout << "finished" << std::endl;

    return 0;
}
