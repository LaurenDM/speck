#include "scemilink.h"
#include "bluesim_kernel_api.h"
#include "mkBridge.h"

void scemi_setup(tSimStateHdl simHdl)
{
  MOD_mkBridge *top;
  top = (MOD_mkBridge *)(bk_get_model_instance(simHdl));
  
  /* Set TCP port number */
  (top->INST_scemi_tcp_port_number).METH_write(3375u);
}
void scemi_shutdown(tSimStateHdl simHdl)
{
}
