/*
 * Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
 * 
 * On Tue May  3 15:26:13 EDT 2016
 * 
 */
#include "bluesim_primitives.h"
#include "mkDutWrapper.h"


/* Constructor */
MOD_mkDutWrapper::MOD_mkDutWrapper(tSimStateHdl simHdl, char const *name, Module *parent)
  : Module(simHdl, name, parent),
    __clk_handle_0(BAD_CLOCK_HANDLE),
    __clk_handle_1(BAD_CLOCK_HANDLE),
    INST_fromSyncQ(simHdl, "fromSyncQ", this, 32u, 2u, 0u),
    INST_rst_usr(simHdl, "rst_usr", this, 5u, (tUInt8)1u),
    INST_toKeySyncQ(simHdl, "toKeySyncQ", this, 144u, 2u, 0u),
    INST_toSyncQ(simHdl, "toSyncQ", this, 1u, 2u, 0u),
    INST_tpOfb(simHdl, "tpOfb", this),
    PORT_rst_usr$OUT_RST((tUInt8)1u),
    PORT_RST_N((tUInt8)1u),
    DEF_toKeySyncQ_first____d6(144u),
    DEF_toKeySyncQ_first_BITS_143_TO_48___d7(96u)
{
  PORT_EN_dut_request_put = false;
  PORT_EN_dut_response_get = false;
  PORT_EN_setkey_put = false;
  PORT_dut_request_put = false;
  PORT_setkey_put.setSize(144u);
  PORT_setkey_put.clear();
  PORT_RDY_dut_request_put = false;
  PORT_dut_response_get = 0u;
  PORT_RDY_dut_response_get = false;
  PORT_RDY_setkey_put = false;
  INST_rst_usr.set_reset_fn_gen_rst(&static_reset_rst_usr$OUT_RST);
  symbol_count = 26u;
  symbols = new tSym[symbol_count];
  init_symbols_0();
}


/* Symbol init fns */

void MOD_mkDutWrapper::init_symbols_0()
{
  init_symbol(&symbols[0u], "CAN_FIRE_dut_request_put", SYM_DEF, &DEF_CAN_FIRE_dut_request_put, 1u);
  init_symbol(&symbols[1u], "CAN_FIRE_dut_response_get", SYM_DEF, &DEF_CAN_FIRE_dut_response_get, 1u);
  init_symbol(&symbols[2u], "CAN_FIRE_RL_getResponse", SYM_DEF, &DEF_CAN_FIRE_RL_getResponse, 1u);
  init_symbol(&symbols[3u], "CAN_FIRE_RL_putKey", SYM_DEF, &DEF_CAN_FIRE_RL_putKey, 1u);
  init_symbol(&symbols[4u], "CAN_FIRE_setkey_put", SYM_DEF, &DEF_CAN_FIRE_setkey_put, 1u);
  init_symbol(&symbols[5u], "dut_request_put", SYM_PORT, &PORT_dut_request_put, 1u);
  init_symbol(&symbols[6u], "dut_response_get", SYM_PORT, &PORT_dut_response_get, 32u);
  init_symbol(&symbols[7u], "EN_dut_request_put", SYM_PORT, &PORT_EN_dut_request_put, 1u);
  init_symbol(&symbols[8u], "EN_dut_response_get", SYM_PORT, &PORT_EN_dut_response_get, 1u);
  init_symbol(&symbols[9u], "EN_setkey_put", SYM_PORT, &PORT_EN_setkey_put, 1u);
  init_symbol(&symbols[10u], "fromSyncQ", SYM_MODULE, &INST_fromSyncQ);
  init_symbol(&symbols[11u], "RDY_dut_request_put", SYM_PORT, &PORT_RDY_dut_request_put, 1u);
  init_symbol(&symbols[12u], "RDY_dut_response_get", SYM_PORT, &PORT_RDY_dut_response_get, 1u);
  init_symbol(&symbols[13u], "RDY_setkey_put", SYM_PORT, &PORT_RDY_setkey_put, 1u);
  init_symbol(&symbols[14u], "RL_getResponse", SYM_RULE);
  init_symbol(&symbols[15u], "RL_putKey", SYM_RULE);
  init_symbol(&symbols[16u], "rst_usr", SYM_MODULE, &INST_rst_usr);
  init_symbol(&symbols[17u], "setkey_put", SYM_PORT, &PORT_setkey_put, 144u);
  init_symbol(&symbols[18u], "toKeySyncQ", SYM_MODULE, &INST_toKeySyncQ);
  init_symbol(&symbols[19u], "toSyncQ", SYM_MODULE, &INST_toSyncQ);
  init_symbol(&symbols[20u], "tpOfb", SYM_MODULE, &INST_tpOfb);
  init_symbol(&symbols[21u],
	      "WILL_FIRE_dut_request_put",
	      SYM_DEF,
	      &DEF_WILL_FIRE_dut_request_put,
	      1u);
  init_symbol(&symbols[22u],
	      "WILL_FIRE_dut_response_get",
	      SYM_DEF,
	      &DEF_WILL_FIRE_dut_response_get,
	      1u);
  init_symbol(&symbols[23u], "WILL_FIRE_RL_getResponse", SYM_DEF, &DEF_WILL_FIRE_RL_getResponse, 1u);
  init_symbol(&symbols[24u], "WILL_FIRE_RL_putKey", SYM_DEF, &DEF_WILL_FIRE_RL_putKey, 1u);
  init_symbol(&symbols[25u], "WILL_FIRE_setkey_put", SYM_DEF, &DEF_WILL_FIRE_setkey_put, 1u);
}


/* Rule actions */

void MOD_mkDutWrapper::RL_putKey()
{
  tUInt64 DEF_toKeySyncQ_first_BITS_47_TO_0___d8;
  DEF_toKeySyncQ_first____d6 = INST_toKeySyncQ.METH_first();
  wop_primExtractWide(96u,
		      144u,
		      DEF_toKeySyncQ_first____d6,
		      32u,
		      143u,
		      32u,
		      48u,
		      DEF_toKeySyncQ_first_BITS_143_TO_48___d7);
  DEF_toKeySyncQ_first_BITS_47_TO_0___d8 = primExtract64(48u,
							 144u,
							 DEF_toKeySyncQ_first____d6,
							 32u,
							 47u,
							 32u,
							 0u);
  INST_toKeySyncQ.METH_deq();
  INST_tpOfb.METH_setKeyIV(DEF_toKeySyncQ_first_BITS_143_TO_48___d7,
			   DEF_toKeySyncQ_first_BITS_47_TO_0___d8);
}

void MOD_mkDutWrapper::RL_getResponse()
{
  tUInt8 DEF_ab_BIT_32___h1222;
  tUInt32 DEF_x1__h1225;
  tUInt64 DEF_ab__h1210;
  tUInt64 DEF_AVMeth_tpOfb_ready;
  DEF_AVMeth_tpOfb_ready = INST_tpOfb.METH_ready();
  DEF_ab__h1210 = DEF_AVMeth_tpOfb_ready;
  DEF_x1__h1225 = (tUInt32)(DEF_ab__h1210);
  DEF_ab_BIT_32___h1222 = (tUInt8)(DEF_ab__h1210 >> 32u);
  if (DEF_ab_BIT_32___h1222)
    INST_fromSyncQ.METH_enq(DEF_x1__h1225);
}


/* Methods */

void MOD_mkDutWrapper::METH_dut_request_put(tUInt8 ARG_dut_request_put)
{
  PORT_EN_dut_request_put = (tUInt8)1u;
  DEF_WILL_FIRE_dut_request_put = (tUInt8)1u;
  PORT_dut_request_put = ARG_dut_request_put;
  INST_toSyncQ.METH_enq(ARG_dut_request_put);
}

tUInt8 MOD_mkDutWrapper::METH_RDY_dut_request_put()
{
  DEF_CAN_FIRE_dut_request_put = INST_toSyncQ.METH_RDY_enq();
  PORT_RDY_dut_request_put = DEF_CAN_FIRE_dut_request_put;
  return PORT_RDY_dut_request_put;
}

tUInt32 MOD_mkDutWrapper::METH_dut_response_get()
{
  tUInt32 DEF_dut_response_get__avValue1;
  PORT_EN_dut_response_get = (tUInt8)1u;
  DEF_WILL_FIRE_dut_response_get = (tUInt8)1u;
  DEF_dut_response_get__avValue1 = INST_fromSyncQ.METH_first();
  PORT_dut_response_get = DEF_dut_response_get__avValue1;
  INST_fromSyncQ.METH_deq();
  return PORT_dut_response_get;
}

tUInt8 MOD_mkDutWrapper::METH_RDY_dut_response_get()
{
  DEF_CAN_FIRE_dut_response_get = INST_fromSyncQ.METH_RDY_deq() && INST_fromSyncQ.METH_RDY_first();
  PORT_RDY_dut_response_get = DEF_CAN_FIRE_dut_response_get;
  return PORT_RDY_dut_response_get;
}

void MOD_mkDutWrapper::METH_setkey_put(tUWide ARG_setkey_put)
{
  PORT_EN_setkey_put = (tUInt8)1u;
  DEF_WILL_FIRE_setkey_put = (tUInt8)1u;
  PORT_setkey_put = ARG_setkey_put;
  INST_toKeySyncQ.METH_enq(ARG_setkey_put);
}

tUInt8 MOD_mkDutWrapper::METH_RDY_setkey_put()
{
  DEF_CAN_FIRE_setkey_put = INST_toKeySyncQ.METH_RDY_enq();
  PORT_RDY_setkey_put = DEF_CAN_FIRE_setkey_put;
  return PORT_RDY_setkey_put;
}


/* Reset routines */

void MOD_mkDutWrapper::reset_rst_usr$OUT_RST(tUInt8 ARG_rst_in)
{
  PORT_rst_usr$OUT_RST = ARG_rst_in;
  INST_tpOfb.reset_RST_N(ARG_rst_in);
  INST_fromSyncQ.reset_sRST(ARG_rst_in);
}

void MOD_mkDutWrapper::reset_RST_N(tUInt8 ARG_rst_in)
{
  PORT_RST_N = ARG_rst_in;
  INST_toSyncQ.reset_sRST(ARG_rst_in);
  INST_toKeySyncQ.reset_sRST(ARG_rst_in);
  INST_rst_usr.reset_IN_RST(ARG_rst_in);
}


/* Static handles to reset routines */

void MOD_mkDutWrapper::static_reset_rst_usr$OUT_RST(void *my_this, tUInt8 ARG_rst_in)
{
  (((MOD_mkDutWrapper *)(my_this))->reset_rst_usr$OUT_RST)(ARG_rst_in);
}


/* Functions for the parent module to register its reset fns */


/* Functions to set the elaborated clock id */

void MOD_mkDutWrapper::set_clk_0(char const *s)
{
  __clk_handle_0 = bk_get_or_define_clock(sim_hdl, s);
}

void MOD_mkDutWrapper::set_clk_1(char const *s)
{
  __clk_handle_1 = bk_get_or_define_clock(sim_hdl, s);
}


/* State dumping routine */
void MOD_mkDutWrapper::dump_state(unsigned int indent)
{
  printf("%*s%s:\n", indent, "", inst_name);
  INST_fromSyncQ.dump_state(indent + 2u);
  INST_rst_usr.dump_state(indent + 2u);
  INST_toKeySyncQ.dump_state(indent + 2u);
  INST_toSyncQ.dump_state(indent + 2u);
  INST_tpOfb.dump_state(indent + 2u);
}


/* VCD dumping routines */

unsigned int MOD_mkDutWrapper::dump_VCD_defs(unsigned int levels)
{
  vcd_write_scope_start(sim_hdl, inst_name);
  vcd_num = vcd_reserve_ids(sim_hdl, 27u);
  unsigned int num = vcd_num;
  for (unsigned int clk = 0u; clk < bk_num_clocks(sim_hdl); ++clk)
    vcd_add_clock_def(sim_hdl, this, bk_clock_name(sim_hdl, clk), bk_clock_vcd_num(sim_hdl, clk));
  vcd_write_def(sim_hdl, bk_clock_vcd_num(sim_hdl, __clk_handle_1), "CLK_clk_usr", 1u);
  vcd_write_def(sim_hdl, bk_clock_vcd_num(sim_hdl, __clk_handle_0), "CLK", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_1);
  vcd_write_def(sim_hdl, num++, "CAN_FIRE_RL_getResponse", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_1);
  vcd_write_def(sim_hdl, num++, "CAN_FIRE_RL_putKey", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "CAN_FIRE_dut_request_put", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "CAN_FIRE_dut_response_get", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "CAN_FIRE_setkey_put", 1u);
  vcd_write_def(sim_hdl, num++, "RST_N", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_1);
  vcd_write_def(sim_hdl, num++, "WILL_FIRE_RL_getResponse", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_1);
  vcd_write_def(sim_hdl, num++, "WILL_FIRE_RL_putKey", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "WILL_FIRE_dut_request_put", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "WILL_FIRE_dut_response_get", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "WILL_FIRE_setkey_put", 1u);
  vcd_write_def(sim_hdl, num++, "rst_usr$OUT_RST", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_1);
  vcd_write_def(sim_hdl, num++, "toKeySyncQ_first_BITS_143_TO_48___d7", 96u);
  vcd_set_clock(sim_hdl, num, __clk_handle_1);
  vcd_write_def(sim_hdl, num++, "toKeySyncQ_first____d6", 144u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "EN_dut_request_put", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "EN_dut_response_get", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "EN_setkey_put", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "RDY_dut_request_put", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "RDY_dut_response_get", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "RDY_setkey_put", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "dut_request_put", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "dut_response_get", 32u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "setkey_put", 144u);
  num = INST_fromSyncQ.dump_VCD_defs(num);
  num = INST_rst_usr.dump_VCD_defs(num);
  num = INST_toKeySyncQ.dump_VCD_defs(num);
  num = INST_toSyncQ.dump_VCD_defs(num);
  if (levels != 1u)
  {
    unsigned int l = levels == 0u ? 0u : levels - 1u;
    num = INST_tpOfb.dump_VCD_defs(l);
  }
  vcd_write_scope_end(sim_hdl);
  return num;
}

void MOD_mkDutWrapper::dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_mkDutWrapper &backing)
{
  vcd_defs(dt, backing);
  vcd_prims(dt, backing);
  if (levels != 1u)
    vcd_submodules(dt, levels - 1u, backing);
}

void MOD_mkDutWrapper::vcd_defs(tVCDDumpType dt, MOD_mkDutWrapper &backing)
{
  unsigned int num = vcd_num;
  if (dt == VCD_DUMP_XS)
  {
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 96u);
    vcd_write_x(sim_hdl, num++, 144u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 32u);
    vcd_write_x(sim_hdl, num++, 144u);
  }
  else
    if (dt == VCD_DUMP_CHANGES)
    {
      if ((backing.DEF_CAN_FIRE_RL_getResponse) != DEF_CAN_FIRE_RL_getResponse)
      {
	vcd_write_val(sim_hdl, num, DEF_CAN_FIRE_RL_getResponse, 1u);
	backing.DEF_CAN_FIRE_RL_getResponse = DEF_CAN_FIRE_RL_getResponse;
      }
      ++num;
      if ((backing.DEF_CAN_FIRE_RL_putKey) != DEF_CAN_FIRE_RL_putKey)
      {
	vcd_write_val(sim_hdl, num, DEF_CAN_FIRE_RL_putKey, 1u);
	backing.DEF_CAN_FIRE_RL_putKey = DEF_CAN_FIRE_RL_putKey;
      }
      ++num;
      if ((backing.DEF_CAN_FIRE_dut_request_put) != DEF_CAN_FIRE_dut_request_put)
      {
	vcd_write_val(sim_hdl, num, DEF_CAN_FIRE_dut_request_put, 1u);
	backing.DEF_CAN_FIRE_dut_request_put = DEF_CAN_FIRE_dut_request_put;
      }
      ++num;
      if ((backing.DEF_CAN_FIRE_dut_response_get) != DEF_CAN_FIRE_dut_response_get)
      {
	vcd_write_val(sim_hdl, num, DEF_CAN_FIRE_dut_response_get, 1u);
	backing.DEF_CAN_FIRE_dut_response_get = DEF_CAN_FIRE_dut_response_get;
      }
      ++num;
      if ((backing.DEF_CAN_FIRE_setkey_put) != DEF_CAN_FIRE_setkey_put)
      {
	vcd_write_val(sim_hdl, num, DEF_CAN_FIRE_setkey_put, 1u);
	backing.DEF_CAN_FIRE_setkey_put = DEF_CAN_FIRE_setkey_put;
      }
      ++num;
      if ((backing.PORT_RST_N) != PORT_RST_N)
      {
	vcd_write_val(sim_hdl, num, PORT_RST_N, 1u);
	backing.PORT_RST_N = PORT_RST_N;
      }
      ++num;
      if ((backing.DEF_WILL_FIRE_RL_getResponse) != DEF_WILL_FIRE_RL_getResponse)
      {
	vcd_write_val(sim_hdl, num, DEF_WILL_FIRE_RL_getResponse, 1u);
	backing.DEF_WILL_FIRE_RL_getResponse = DEF_WILL_FIRE_RL_getResponse;
      }
      ++num;
      if ((backing.DEF_WILL_FIRE_RL_putKey) != DEF_WILL_FIRE_RL_putKey)
      {
	vcd_write_val(sim_hdl, num, DEF_WILL_FIRE_RL_putKey, 1u);
	backing.DEF_WILL_FIRE_RL_putKey = DEF_WILL_FIRE_RL_putKey;
      }
      ++num;
      if ((backing.DEF_WILL_FIRE_dut_request_put) != DEF_WILL_FIRE_dut_request_put)
      {
	vcd_write_val(sim_hdl, num, DEF_WILL_FIRE_dut_request_put, 1u);
	backing.DEF_WILL_FIRE_dut_request_put = DEF_WILL_FIRE_dut_request_put;
      }
      ++num;
      if ((backing.DEF_WILL_FIRE_dut_response_get) != DEF_WILL_FIRE_dut_response_get)
      {
	vcd_write_val(sim_hdl, num, DEF_WILL_FIRE_dut_response_get, 1u);
	backing.DEF_WILL_FIRE_dut_response_get = DEF_WILL_FIRE_dut_response_get;
      }
      ++num;
      if ((backing.DEF_WILL_FIRE_setkey_put) != DEF_WILL_FIRE_setkey_put)
      {
	vcd_write_val(sim_hdl, num, DEF_WILL_FIRE_setkey_put, 1u);
	backing.DEF_WILL_FIRE_setkey_put = DEF_WILL_FIRE_setkey_put;
      }
      ++num;
      if ((backing.PORT_rst_usr$OUT_RST) != PORT_rst_usr$OUT_RST)
      {
	vcd_write_val(sim_hdl, num, PORT_rst_usr$OUT_RST, 1u);
	backing.PORT_rst_usr$OUT_RST = PORT_rst_usr$OUT_RST;
      }
      ++num;
      if ((backing.DEF_toKeySyncQ_first_BITS_143_TO_48___d7) != DEF_toKeySyncQ_first_BITS_143_TO_48___d7)
      {
	vcd_write_val(sim_hdl, num, DEF_toKeySyncQ_first_BITS_143_TO_48___d7, 96u);
	backing.DEF_toKeySyncQ_first_BITS_143_TO_48___d7 = DEF_toKeySyncQ_first_BITS_143_TO_48___d7;
      }
      ++num;
      if ((backing.DEF_toKeySyncQ_first____d6) != DEF_toKeySyncQ_first____d6)
      {
	vcd_write_val(sim_hdl, num, DEF_toKeySyncQ_first____d6, 144u);
	backing.DEF_toKeySyncQ_first____d6 = DEF_toKeySyncQ_first____d6;
      }
      ++num;
      if ((backing.PORT_EN_dut_request_put) != PORT_EN_dut_request_put)
      {
	vcd_write_val(sim_hdl, num, PORT_EN_dut_request_put, 1u);
	backing.PORT_EN_dut_request_put = PORT_EN_dut_request_put;
      }
      ++num;
      if ((backing.PORT_EN_dut_response_get) != PORT_EN_dut_response_get)
      {
	vcd_write_val(sim_hdl, num, PORT_EN_dut_response_get, 1u);
	backing.PORT_EN_dut_response_get = PORT_EN_dut_response_get;
      }
      ++num;
      if ((backing.PORT_EN_setkey_put) != PORT_EN_setkey_put)
      {
	vcd_write_val(sim_hdl, num, PORT_EN_setkey_put, 1u);
	backing.PORT_EN_setkey_put = PORT_EN_setkey_put;
      }
      ++num;
      if ((backing.PORT_RDY_dut_request_put) != PORT_RDY_dut_request_put)
      {
	vcd_write_val(sim_hdl, num, PORT_RDY_dut_request_put, 1u);
	backing.PORT_RDY_dut_request_put = PORT_RDY_dut_request_put;
      }
      ++num;
      if ((backing.PORT_RDY_dut_response_get) != PORT_RDY_dut_response_get)
      {
	vcd_write_val(sim_hdl, num, PORT_RDY_dut_response_get, 1u);
	backing.PORT_RDY_dut_response_get = PORT_RDY_dut_response_get;
      }
      ++num;
      if ((backing.PORT_RDY_setkey_put) != PORT_RDY_setkey_put)
      {
	vcd_write_val(sim_hdl, num, PORT_RDY_setkey_put, 1u);
	backing.PORT_RDY_setkey_put = PORT_RDY_setkey_put;
      }
      ++num;
      if ((backing.PORT_dut_request_put) != PORT_dut_request_put)
      {
	vcd_write_val(sim_hdl, num, PORT_dut_request_put, 1u);
	backing.PORT_dut_request_put = PORT_dut_request_put;
      }
      ++num;
      if ((backing.PORT_dut_response_get) != PORT_dut_response_get)
      {
	vcd_write_val(sim_hdl, num, PORT_dut_response_get, 32u);
	backing.PORT_dut_response_get = PORT_dut_response_get;
      }
      ++num;
      if ((backing.PORT_setkey_put) != PORT_setkey_put)
      {
	vcd_write_val(sim_hdl, num, PORT_setkey_put, 144u);
	backing.PORT_setkey_put = PORT_setkey_put;
      }
      ++num;
    }
    else
    {
      vcd_write_val(sim_hdl, num++, DEF_CAN_FIRE_RL_getResponse, 1u);
      backing.DEF_CAN_FIRE_RL_getResponse = DEF_CAN_FIRE_RL_getResponse;
      vcd_write_val(sim_hdl, num++, DEF_CAN_FIRE_RL_putKey, 1u);
      backing.DEF_CAN_FIRE_RL_putKey = DEF_CAN_FIRE_RL_putKey;
      vcd_write_val(sim_hdl, num++, DEF_CAN_FIRE_dut_request_put, 1u);
      backing.DEF_CAN_FIRE_dut_request_put = DEF_CAN_FIRE_dut_request_put;
      vcd_write_val(sim_hdl, num++, DEF_CAN_FIRE_dut_response_get, 1u);
      backing.DEF_CAN_FIRE_dut_response_get = DEF_CAN_FIRE_dut_response_get;
      vcd_write_val(sim_hdl, num++, DEF_CAN_FIRE_setkey_put, 1u);
      backing.DEF_CAN_FIRE_setkey_put = DEF_CAN_FIRE_setkey_put;
      vcd_write_val(sim_hdl, num++, PORT_RST_N, 1u);
      backing.PORT_RST_N = PORT_RST_N;
      vcd_write_val(sim_hdl, num++, DEF_WILL_FIRE_RL_getResponse, 1u);
      backing.DEF_WILL_FIRE_RL_getResponse = DEF_WILL_FIRE_RL_getResponse;
      vcd_write_val(sim_hdl, num++, DEF_WILL_FIRE_RL_putKey, 1u);
      backing.DEF_WILL_FIRE_RL_putKey = DEF_WILL_FIRE_RL_putKey;
      vcd_write_val(sim_hdl, num++, DEF_WILL_FIRE_dut_request_put, 1u);
      backing.DEF_WILL_FIRE_dut_request_put = DEF_WILL_FIRE_dut_request_put;
      vcd_write_val(sim_hdl, num++, DEF_WILL_FIRE_dut_response_get, 1u);
      backing.DEF_WILL_FIRE_dut_response_get = DEF_WILL_FIRE_dut_response_get;
      vcd_write_val(sim_hdl, num++, DEF_WILL_FIRE_setkey_put, 1u);
      backing.DEF_WILL_FIRE_setkey_put = DEF_WILL_FIRE_setkey_put;
      vcd_write_val(sim_hdl, num++, PORT_rst_usr$OUT_RST, 1u);
      backing.PORT_rst_usr$OUT_RST = PORT_rst_usr$OUT_RST;
      vcd_write_val(sim_hdl, num++, DEF_toKeySyncQ_first_BITS_143_TO_48___d7, 96u);
      backing.DEF_toKeySyncQ_first_BITS_143_TO_48___d7 = DEF_toKeySyncQ_first_BITS_143_TO_48___d7;
      vcd_write_val(sim_hdl, num++, DEF_toKeySyncQ_first____d6, 144u);
      backing.DEF_toKeySyncQ_first____d6 = DEF_toKeySyncQ_first____d6;
      vcd_write_val(sim_hdl, num++, PORT_EN_dut_request_put, 1u);
      backing.PORT_EN_dut_request_put = PORT_EN_dut_request_put;
      vcd_write_val(sim_hdl, num++, PORT_EN_dut_response_get, 1u);
      backing.PORT_EN_dut_response_get = PORT_EN_dut_response_get;
      vcd_write_val(sim_hdl, num++, PORT_EN_setkey_put, 1u);
      backing.PORT_EN_setkey_put = PORT_EN_setkey_put;
      vcd_write_val(sim_hdl, num++, PORT_RDY_dut_request_put, 1u);
      backing.PORT_RDY_dut_request_put = PORT_RDY_dut_request_put;
      vcd_write_val(sim_hdl, num++, PORT_RDY_dut_response_get, 1u);
      backing.PORT_RDY_dut_response_get = PORT_RDY_dut_response_get;
      vcd_write_val(sim_hdl, num++, PORT_RDY_setkey_put, 1u);
      backing.PORT_RDY_setkey_put = PORT_RDY_setkey_put;
      vcd_write_val(sim_hdl, num++, PORT_dut_request_put, 1u);
      backing.PORT_dut_request_put = PORT_dut_request_put;
      vcd_write_val(sim_hdl, num++, PORT_dut_response_get, 32u);
      backing.PORT_dut_response_get = PORT_dut_response_get;
      vcd_write_val(sim_hdl, num++, PORT_setkey_put, 144u);
      backing.PORT_setkey_put = PORT_setkey_put;
    }
}

void MOD_mkDutWrapper::vcd_prims(tVCDDumpType dt, MOD_mkDutWrapper &backing)
{
  INST_fromSyncQ.dump_VCD(dt, backing.INST_fromSyncQ);
  INST_rst_usr.dump_VCD(dt, backing.INST_rst_usr);
  INST_toKeySyncQ.dump_VCD(dt, backing.INST_toKeySyncQ);
  INST_toSyncQ.dump_VCD(dt, backing.INST_toSyncQ);
}

void MOD_mkDutWrapper::vcd_submodules(tVCDDumpType dt,
				      unsigned int levels,
				      MOD_mkDutWrapper &backing)
{
  INST_tpOfb.dump_VCD(dt, levels, backing.INST_tpOfb);
}
