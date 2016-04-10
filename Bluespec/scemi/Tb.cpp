
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
FlagType flag;

bool indone = false;
long int putcount = 0;
long int gotcount = 0;


void out_cb(void* x, const Block_Flag& block)
{
    printf("receiving output, gotcount = %ld, putcount = %ld \n",gotcount,putcount);
    if (gotcount < putcount) {
        printf("printing out \n");
        fprintf(outfile,"%x %x \n",block.m_block.m_tpl_1.get(),block.m_block.m_tpl_2.get());
        gotcount++;
    } else if (indone && outfile) {
        printf("closing outfile \n");
        word end = 0x0;
        fprintf(outfile,"%lx %lx \n",end,end);
        fclose(outfile);
        outfile = NULL;
    }

}

void runtest(InportProxyT<Block_Flag >& inport, FILE* infile)
{
    word in1, in2;
    while (outfile) {
        if (!indone) {
            printf("scanning, gotcount = %ld, putcount= %ld  \n",gotcount,putcount);
            fscanf(infile,"%lx %lx",&in1, &in2);

            if (in1 == 0 && in2 == 0) { // we will use 0's to indicate end of plaintexts/ciphertexts
                printf("end of file \n");
                indone = true;
                fclose(infile);
                infile = NULL;
            } else {
                printf("sending input \n");
                Block_Flag bf;
                bf.m_block.m_tpl_1 = BitT<24>(in1);
                bf.m_block.m_tpl_2 = BitT<24>(in2);
                bf.m_flag = flag;
                putcount++;
                inport.sendMessage(bf);
            }
        }
        else{
            Block_Flag bf;
            inport.sendMessage(bf);
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
    InportProxyT<Block_Flag > inport ("", "scemi_processor_req_inport", sceMi);
    InportProxyT<Key_Flag> setkey ("", "scemi_setkey_inport", sceMi);

    // Initialize the SceMi outport
    OutportProxyT<Block_Flag > outport ("", "scemi_processor_resp_outport", sceMi);
    outport.setCallBack(out_cb, NULL);

    // Initialize the reset port.
    ResetXactor reset("", "scemi", sceMi);

    ShutdownXactor shutdown("", "scemi_shutdown", sceMi);

    // Service SceMi requests
    SceMiServiceThread *scemi_service_thread = new SceMiServiceThread (sceMi);

    // Reset the dut.
    reset.reset();

    /********************************* DECRYPT *****************************************/
    flag.m_val = FlagType::e_Encrypt;
    Key_Flag kf;
    word enkey[4] = {0x020100, 0x0a0908, 0x121110, 0x1a1918};
    for (int i=0; i<4; i++){
        kf.m_key[i]=enkey[i];
    }
    kf.m_flag = flag;
    setkey.sendMessage(kf);
    printf("enc key = set \n");
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
    indone = false;
    putcount = 0;
    gotcount = 0;
    flag.m_val = FlagType::e_Decrypt;
    word dekey[4] = {0xcb6915, 0xc6cbb1, 0x4a5369, 0x7f5a9d};
    for (int i=0; i<4; i++){
        kf.m_key[i]=dekey[i];
    }
    kf.m_flag = flag;
    setkey.sendMessage(kf);
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
