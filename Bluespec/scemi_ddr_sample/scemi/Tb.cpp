
#include <iostream>
#include <unistd.h>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <semaphore.h>

#include "bsv_scemi.h"
#include "SceMiHeaders.h"
#include "ResetXactor.h"

#define NUM_MESSAGES 256

static int respCnt = 0;
sem_t semDone;

void out_cb(void* x, const BitT<32>& res)
{
  printf("Read DRAM: %x\n", res.get());
  respCnt++;
  if (respCnt == NUM_MESSAGES) {
    sem_post(&semDone);
  }
}


int main(int argc, char* argv[])
{

    int sceMiVersion = SceMi::Version( SCEMI_VERSION_STRING );
    SceMiParameters params("scemi.params");
    SceMi *sceMi = SceMi::Init(sceMiVersion, &params);

    // Initialize the SceMi ports
    InportProxyT<BitT<32> > dataToDut ("", "scemi_datatodut_inport", sceMi);
    OutportProxyT<BitT<32> > dataFromDut ("", "scemi_datafromdut_outport", sceMi);
    InportProxyT<BitT<32> > startRead ("", "scemi_startread_inport", sceMi);
    dataFromDut.setCallBack(out_cb, NULL);

    ResetXactor reset("", "scemi", sceMi);
    ShutdownXactor shutdown("", "scemi_shutdown", sceMi);

    // Initialize done semaphore to 0 since we should wait for out_cb to signal the main thread
    sem_init(&semDone, 0, 0);

    // Service SceMi requests
    SceMiServiceThread *scemi_service_thread = new SceMiServiceThread(sceMi);

    // Reset the dut.
    reset.reset();

    // Send write data
    for (int i=0; i < NUM_MESSAGES; i++) {
      dataToDut.sendMessage(BitT<32>(i));
    }

    // Send start read request
    startRead.sendMessage(BitT<32>(NUM_MESSAGES));

    // Wait for out_cb to signal us it's done
    sem_wait(&semDone);

    std::cout << "shutting down..." << std::endl;
    shutdown.blocking_send_finish();
    scemi_service_thread->stop();
    scemi_service_thread->join();
    SceMi::Shutdown(sceMi);
    std::cout << "finished" << std::endl;

    return 0;
}

