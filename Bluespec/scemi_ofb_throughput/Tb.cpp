
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


void out_cb(void* x, const BitT<32>& cycles)
{
    if(!outdone){
      outdone = true;
      printf("cycles = %d \n",cycles.get());
    }
}

void runtest(InportProxyT<Key_Iv>& keyport, Key_Iv ki)
{
    clock_t starttime,endtime;
    outdone=false;
    printf("sending \n");
    keyport.sendMessage(ki);
    starttime =clock();
    while (!outdone) {
        sleep(0);
    }
    endtime=clock();
    printf("done, duration = %f seconds \n",((float) endtime-starttime)/CLOCKS_PER_SEC);
}

int main(int argc, char* argv[])
{
    int sceMiVersion = SceMi::Version( SCEMI_VERSION_STRING );
    SceMiParameters params("scemi.params");
    SceMi *sceMi = SceMi::Init(sceMiVersion, &params);

    // Initialize the SceMi inport
    InportProxyT<Bool > inport ("", "scemi_processor_req_inport", sceMi);
    InportProxyT<Key_Iv> setkey ("", "scemi_setkey_inport", sceMi);

    // Initialize the SceMi outport
    OutportProxyT<BitT<32> > outport ("", "scemi_processor_resp_outport", sceMi);
    outport.setCallBack(out_cb, NULL);

    // Initialize the reset port.
    ResetXactor reset("", "scemi", sceMi);

    ShutdownXactor shutdown("", "scemi_shutdown", sceMi);

    // Service SceMi requests
    SceMiServiceThread *scemi_service_thread = new SceMiServiceThread (sceMi);

    // Reset the dut.
    reset.reset();

    /********************************* ENCRYPT *****************************************/
    Key_Iv ki;
    word enkey[4] = {0x020100, 0x0a0908, 0x121110, 0x1a1918};
    for (int i=0; i<4; i++){
        ki.m_key[i]=enkey[i];
    }
    ki.m_iv.m_tpl_1 = 0x735e10;
    ki.m_iv.m_tpl_2 = 0xb6445d;

    // Send in all the data.
    runtest(setkey,ki);

    /********************************* FINISH *****************************************/
    std::cout << "shutting down..." << std::endl;
    shutdown.blocking_send_finish();
    scemi_service_thread->stop();
    scemi_service_thread->join();
    SceMi::Shutdown(sceMi);
    std::cout << "finished" << std::endl;

    return 0;
}
