
#include <iostream>
#include <unistd.h>
#include <cmath>
#include <time.h>

#include "bsv_scemi.h"
#include "SceMiHeaders.h"
#include "ResetXactor.h"

#define u24 unsigned long

typedef u24 word;

bool outdone = false;
FlagType flag;


void out_cb(void* x, const Bool& ready)
{
    if(ready && !outdone){
        outdone = true;
    }
}

void runtest(InportProxyT<Key_Flag>& keyport, Key_Flag kf)
{
    clock_t starttime,endtime;
    int count = 0;
    outdone=false;
    keyport.sendMessage(kf);
    starttime =clock();
    while (!outdone) {
        sleep(0);
        count = count + 1;
    }
    endtime=clock();
    printf("done, duration = %f seconds, count = %d \n",((float) endtime-starttime)/CLOCKS_PER_SEC,count);
}

int main(int argc, char* argv[])
{
    int sceMiVersion = SceMi::Version( SCEMI_VERSION_STRING );
    SceMiParameters params("scemi.params");
    SceMi *sceMi = SceMi::Init(sceMiVersion, &params);

    // Initialize the SceMi inport
    InportProxyT<Bool > inport ("", "scemi_processor_req_inport", sceMi);
    InportProxyT<Key_Flag> setkey ("", "scemi_setkey_inport", sceMi);

    // Initialize the SceMi outport
    OutportProxyT<Bool > outport ("", "scemi_processor_resp_outport", sceMi);
    outport.setCallBack(out_cb, NULL);

    // Initialize the reset port.
    ResetXactor reset("", "scemi", sceMi);

    ShutdownXactor shutdown("", "scemi_shutdown", sceMi);

    // Service SceMi requests
    SceMiServiceThread *scemi_service_thread = new SceMiServiceThread (sceMi);

    // Reset the dut.
    reset.reset();

    /********************************* ENCRYPT *****************************************/
    flag.m_val = FlagType::e_Encrypt;
    Key_Flag kf;
    word enkey[4] = {0x020100, 0x0a0908, 0x121110, 0x1a1918};
    for (int i=0; i<4; i++){
        kf.m_key[i]=enkey[i];
    }
    kf.m_flag = flag;

    // Send in all the data.
    runtest(setkey,kf);

    /********************************* DECRYPT *****************************************/
    flag.m_val = FlagType::e_Decrypt;
    word dekey[4] = {0xcb6915, 0xc6cbb1, 0x4a5369, 0x7f5a9d};
    for (int i=0; i<4; i++){
        kf.m_key[i]=dekey[i];
    }
    kf.m_flag = flag;
    // Reset the dut.
    reset.reset();
    runtest(setkey,kf);
    /********************************* FINISH *****************************************/
    std::cout << "shutting down..." << std::endl;
    shutdown.blocking_send_finish();
    scemi_service_thread->stop();
    scemi_service_thread->join();
    SceMi::Shutdown(sceMi);
    std::cout << "finished" << std::endl;

    return 0;
}
