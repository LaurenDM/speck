
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

bool outdone = false;
FlagType flag;


void out_cb(void* x, const Bool& ready)
{
    if(ready){
        outdone = true;
    }
}

void runtest()
{
    while (!outdone) {
        sleep(0);
    }
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

    /********************************* DECRYPT *****************************************/
    flag.m_val = FlagType::e_Encrypt;
    Key_Flag kf;
    word enkey[4] = {0x020100, 0x0a0908, 0x121110, 0x1a1918};
    for (int i=0; i<4; i++){
        kf.m_key[i]=enkey[i];
    }
    kf.m_flag = flag;

    // Send in all the data.
    clock_t starttime,endtime;
    starttime = clock();
    setkey.sendMessage(kf);
    endtime = clock();
    printf("encryption done, duration = %f seconds \n",((float) endtime-starttime)/CLOCKS_PER_SEC);

    /********************************* DECRYPT *****************************************/
    // reset
    // Reset the dut.
    reset.reset();
    flag.m_val = FlagType::e_Decrypt;
    word dekey[4] = {0xcb6915, 0xc6cbb1, 0x4a5369, 0x7f5a9d};
    for (int i=0; i<4; i++){
        kf.m_key[i]=dekey[i];
    }
    kf.m_flag = flag;

    starttime =clock();
    setkey.sendMessage(kf);
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
