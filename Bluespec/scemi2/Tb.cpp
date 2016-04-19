
#include <iostream>
#include <unistd.h>
#include <cmath>
#include <cstdio>
#include <cstdlib>

#include "bsv_scemi.h"
#include "SceMiHeaders.h"
#include "ResetXactor.h"


// Initialize the memories from the given vmh file.
bool mem_init(const char *filename, InportProxyT<WideMemInit>& mem)
{
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "could not open VMH file %s.\n", filename);
        return false;
    }

	   // read @0
	  char line[100];
	  fscanf(file, "%s", line);
	  if(strcmp(line, "@0") != 0) {
		    fprintf(stderr, "VMH file starts with %s, not @0\n", line);
		    fclose(file);
		    return false;
	  }

	  // read data
	  WideMemInit msg;
    uint32_t ddr3_addr = 0;
    uint32_t word_index = 0;
	  const uint32_t max_word_index = 15;
    BitT<512> wide_data;
	  uint32_t word = 0;

	   while(fscanf(file, "%x", &word) > 0) {
		     wide_data.setWord(word_index, word);
		    word_index++;
		    // send message
		    if(word_index > max_word_index) {
			       msg.the_tag = WideMemInit::tag_InitLoad;
			       msg.m_InitLoad.m_addr = ddr3_addr;
			       msg.m_InitLoad.m_data = wide_data;
			       mem.sendMessage(msg);
			      // incr addr & reset index
			      ddr3_addr++;
			      word_index = 0;
		    }
	    }

	    // write done msg
	    if(word_index != 0) {
		      fprintf(stderr, "VMH file unalign\n");
		      fclose(file);
		      return false;
	    }
      msg.the_tag = WideMemInit::tag_InitDone;
      mem.sendMessage(msg);

      fclose(file);
	    return true;
}

int main(int argc, char* argv[])
{
    if (argc < 2) {
        fprintf(stderr, "usage: TestDriver <vmh-file>\n");
        return 1;
    }

    int sceMiVersion = SceMi::Version( SCEMI_VERSION_STRING );
    SceMiParameters params("scemi.params");
    SceMi *sceMi = SceMi::Init(sceMiVersion, &params);

    // Initialize the SceMi ports
    InportProxyT<WideMemInit> mem("", "scemi_mem_inport", sceMi);
    OutportQueueT<ToHost> tohost("", "scemi_tohost_outport", sceMi);
    InportProxyT<FromHost> fromhost("", "scemi_fromhost_inport", sceMi);
    ResetXactor reset("", "scemi", sceMi);
    ShutdownXactor shutdown("", "scemi_shutdown", sceMi);

    // Service SceMi requests
    SceMiServiceThread *scemi_service_thread = new SceMiServiceThread(sceMi);

    // Reset the dut.
    reset.reset();

    // Get the VMH file to load.
    char* vmh = "pt_int.vmh"; //TODO

    // Initialize the memories.
    if (!mem_init(vmh, mem)) {
            fprintf(stderr, "Failed to load memory\n");
            std::cout << "shutting down..." << std::endl;
            shutdown.blocking_send_finish();
            scemi_service_thread->stop();
            scemi_service_thread->join();
            SceMi::Shutdown(sceMi);
            std::cout << "finished" << std::endl;
            return 1;
    }

    //TODO set key

    // Start the core: start PC = 0x200
    fromhost.sendMessage(0x200);

    // Handle tohost requests.
		uint32_t print_int = 0; // integer to print
    while (true) {
      ToHost msg = tohost.getMessage();
			CpuToHostType::E_CpuToHostType type = msg.m_c2hType.m_val;
      uint16_t data = msg.m_data;

			if(type == CpuToHostType::e_ExitCode) {
				    if(data == 0) {
					         fprintf(stderr, "PASSED\n");
				    } else {
					         fprintf(stderr, "FAILED: exit code = %d\n", data);
				    }
				break;
			} else if(type == CpuToHostType::e_PrintChar) {
				fprintf(stderr, "%c", (char)data);
			} else if(type == CpuToHostType::e_PrintIntLow) {
				print_int = uint32_t(data);
			} else if(type == CpuToHostType::e_PrintIntHigh) {
				print_int |= uint32_t(data) << 16;
				fprintf(stderr, "%d", print_int);
			}
    }
		fprintf(stderr, "\n");
    }

    // Reset the dut.
    reset.reset();

    //TODO set decryption key

    // Start the core: start PC = 0x200
    fromhost.sendMessage(0x200); //TODO change to pc where you wrote ciphertext

    // Handle tohost requests.
		uint32_t print_int = 0; // integer to print
    while (true) {
      ToHost msg = tohost.getMessage();
			CpuToHostType::E_CpuToHostType type = msg.m_c2hType.m_val;
      uint16_t data = msg.m_data;

			if(type == CpuToHostType::e_ExitCode) {
				    if(data == 0) {
					         fprintf(stderr, "PASSED\n");
				    } else {
					         fprintf(stderr, "FAILED: exit code = %d\n", data);
				    }
				break;
			} else if(type == CpuToHostType::e_PrintChar) {
				fprintf(stderr, "%c", (char)data);
			} else if(type == CpuToHostType::e_PrintIntLow) {
				print_int = uint32_t(data);
			} else if(type == CpuToHostType::e_PrintIntHigh) {
				print_int |= uint32_t(data) << 16;
				fprintf(stderr, "%d", print_int);
			}
    }
		fprintf(stderr, "\n");
    }

    shutdown.blocking_send_finish();
    scemi_service_thread->stop();
    scemi_service_thread->join();
    SceMi::Shutdown(sceMi);

    return 0;
}
