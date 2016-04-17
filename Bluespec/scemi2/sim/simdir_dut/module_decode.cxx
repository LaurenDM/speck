/*
 * Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
 * 
 * On Sat Mar 12 13:28:57 EST 2016
 * 
 */
#include "bluesim_primitives.h"
#include "module_decode.h"


/* Constructor */
MOD_module_decode::MOD_module_decode(tSimStateHdl simHdl, char const *name, Module *parent)
  : Module(simHdl, name, parent), DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203(67u)
{
  PORT_decode_inst = 0u;
  PORT_decode.setSize(75u);
  PORT_decode.clear();
  PORT_RDY_decode = false;
  symbol_count = 4u;
  symbols = new tSym[symbol_count];
  init_symbols_0();
}


/* Symbol init fns */

void MOD_module_decode::init_symbols_0()
{
  init_symbol(&symbols[0u], "CAN_FIRE_decode", SYM_DEF, &DEF_CAN_FIRE_decode, 1u);
  init_symbol(&symbols[1u], "decode", SYM_PORT, &PORT_decode, 75u);
  init_symbol(&symbols[2u], "decode_inst", SYM_PORT, &PORT_decode_inst, 32u);
  init_symbol(&symbols[3u], "RDY_decode", SYM_PORT, &PORT_RDY_decode, 1u);
}


/* Rule actions */


/* Methods */

tUWide MOD_module_decode::METH_decode(tUInt32 ARG_decode_inst)
{
  tUInt32 DEF_x__h1823;
  tUInt32 DEF_x__h1712;
  tUInt32 DEF_x__h1600;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100011_6___d90;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b11_3___d106;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100111_5___d105;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1101111_4___d104;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10111_3___d103;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110111_2___d102;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110011___d101;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10011___d100;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1110011_7___d107;
  tUInt8 DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b100011_5___d128;
  tUInt8 DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d85;
  tUInt8 DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d88;
  tUInt8 DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_IF__ETC___d75;
  tUInt8 DEF_decode_inst_BITS_14_TO_12_EQ_0b10___d7;
  tUInt8 DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64;
  tUInt8 DEF_decode_inst_BITS_11_TO_7_8_EQ_0___d39;
  tUInt8 DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b1_2_THEN_IF__ETC___d45;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b100011___d35;
  tUInt8 DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d32;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b10111___d23;
  tUInt8 DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b110011___d3;
  tUInt8 DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d21;
  tUInt8 DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54;
  tUInt8 DEF_IF_decode_inst_BIT_30_5_THEN_8_ELSE_9___d56;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b110111___d22;
  tUInt8 DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d139;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b1110011___d37;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b10011___d2;
  tUInt32 DEF_immS__h24;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b11___d33;
  tUInt32 DEF_immB__h25;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b1100011___d26;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b1100111___d25;
  tUInt32 DEF_immJ__h27;
  tUInt8 DEF_decode_inst_BITS_6_TO_0_EQ_0b1101111___d24;
  tUInt32 DEF_immU__h26;
  tUInt32 DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199;
  tUInt8 DEF_decode_inst_BIT_30___d55;
  tUInt8 DEF_decode_inst_BIT_31___d178;
  tUInt8 DEF_funct3__h19;
  tUInt8 DEF_decode_inst_BITS_11_TO_7___d38;
  tUInt8 DEF_rs1__h20;
  tUInt8 DEF_decode_inst_BITS_24_TO_20___d155;
  tUInt8 DEF_opcode__h17;
  tUInt32 DEF_x__h1491;
  tUInt32 DEF_immI__h23;
  tUInt32 DEF_immI_BITS_11_TO_0___h1517;
  PORT_decode_inst = ARG_decode_inst;
  DEF_x__h1491 = (tUInt32)(ARG_decode_inst >> 20u);
  DEF_immI__h23 = primSignExt32(32u, 12u, (tUInt32)(DEF_x__h1491));
  DEF_immI_BITS_11_TO_0___h1517 = (tUInt32)(4095u & DEF_immI__h23);
  DEF_opcode__h17 = (tUInt8)((tUInt8)127u & ARG_decode_inst);
  DEF_rs1__h20 = (tUInt8)((tUInt8)31u & (ARG_decode_inst >> 15u));
  DEF_decode_inst_BITS_24_TO_20___d155 = (tUInt8)((tUInt8)31u & (ARG_decode_inst >> 20u));
  DEF_decode_inst_BITS_11_TO_7___d38 = (tUInt8)((tUInt8)31u & (ARG_decode_inst >> 7u));
  DEF_funct3__h19 = (tUInt8)((tUInt8)7u & (ARG_decode_inst >> 12u));
  DEF_decode_inst_BIT_31___d178 = (tUInt8)(ARG_decode_inst >> 31u);
  DEF_decode_inst_BIT_30___d55 = (tUInt8)((tUInt8)1u & (ARG_decode_inst >> 30u));
  DEF_immU__h26 = ((tUInt32)(ARG_decode_inst >> 12u)) << 12u;
  DEF_decode_inst_BITS_6_TO_0_EQ_0b1101111___d24 = DEF_opcode__h17 == (tUInt8)111u;
  DEF_decode_inst_BITS_6_TO_0_EQ_0b1100111___d25 = DEF_opcode__h17 == (tUInt8)103u;
  DEF_decode_inst_BITS_6_TO_0_EQ_0b1100011___d26 = DEF_opcode__h17 == (tUInt8)99u;
  DEF_decode_inst_BITS_6_TO_0_EQ_0b11___d33 = DEF_opcode__h17 == (tUInt8)3u;
  DEF_decode_inst_BITS_6_TO_0_EQ_0b10011___d2 = DEF_opcode__h17 == (tUInt8)19u;
  DEF_decode_inst_BITS_6_TO_0_EQ_0b110111___d22 = DEF_opcode__h17 == (tUInt8)55u;
  DEF_decode_inst_BITS_6_TO_0_EQ_0b1110011___d37 = DEF_opcode__h17 == (tUInt8)115u;
  switch (DEF_opcode__h17) {
  case (tUInt8)55u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d139 = (tUInt8)0u;
    break;
  default:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d139 = DEF_rs1__h20;
  }
  DEF_IF_decode_inst_BIT_30_5_THEN_8_ELSE_9___d56 = DEF_decode_inst_BIT_30___d55 ? (tUInt8)8u : (tUInt8)9u;
  switch (DEF_funct3__h19) {
  case (tUInt8)0u:
  case (tUInt8)1u:
  case (tUInt8)2u:
  case (tUInt8)3u:
  case (tUInt8)4u:
  case (tUInt8)5u:
  case (tUInt8)6u:
  case (tUInt8)7u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d21 = (tUInt8)1u;
    break;
  default:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d21 = (tUInt8)0u;
  }
  DEF_decode_inst_BITS_6_TO_0_EQ_0b110011___d3 = DEF_opcode__h17 == (tUInt8)51u;
  switch (DEF_funct3__h19) {
  case (tUInt8)0u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = DEF_decode_inst_BIT_30___d55 ? (tUInt8)1u : (tUInt8)0u;
    break;
  case (tUInt8)2u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = (tUInt8)5u;
    break;
  case (tUInt8)3u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = (tUInt8)6u;
    break;
  case (tUInt8)7u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = (tUInt8)2u;
    break;
  case (tUInt8)6u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = (tUInt8)3u;
    break;
  case (tUInt8)4u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = (tUInt8)4u;
    break;
  case (tUInt8)1u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = (tUInt8)7u;
    break;
  default:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66 = DEF_IF_decode_inst_BIT_30_5_THEN_8_ELSE_9___d56;
  }
  DEF_decode_inst_BITS_6_TO_0_EQ_0b10111___d23 = DEF_opcode__h17 == (tUInt8)23u;
  switch (DEF_funct3__h19) {
  case (tUInt8)0u:
  case (tUInt8)1u:
  case (tUInt8)4u:
  case (tUInt8)5u:
  case (tUInt8)6u:
  case (tUInt8)7u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d32 = (tUInt8)6u;
    break;
  default:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d32 = (tUInt8)0u;
  }
  DEF_decode_inst_BITS_6_TO_0_EQ_0b100011___d35 = DEF_opcode__h17 == (tUInt8)35u;
  DEF_decode_inst_BITS_11_TO_7_8_EQ_0___d39 = DEF_decode_inst_BITS_11_TO_7___d38 == (tUInt8)0u;
  switch (DEF_funct3__h19) {
  case (tUInt8)1u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b1_2_THEN_IF__ETC___d45 = DEF_decode_inst_BITS_11_TO_7_8_EQ_0___d39 ? (tUInt8)8u : (tUInt8)0u;
    break;
  case (tUInt8)2u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b1_2_THEN_IF__ETC___d45 = DEF_rs1__h20 == (tUInt8)0u ? (tUInt8)7u : (tUInt8)0u;
    break;
  default:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b1_2_THEN_IF__ETC___d45 = (tUInt8)0u;
  }
  switch (DEF_funct3__h19) {
  case (tUInt8)0u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = (tUInt8)0u;
    break;
  case (tUInt8)2u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = (tUInt8)5u;
    break;
  case (tUInt8)3u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = (tUInt8)6u;
    break;
  case (tUInt8)7u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = (tUInt8)2u;
    break;
  case (tUInt8)6u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = (tUInt8)3u;
    break;
  case (tUInt8)4u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = (tUInt8)4u;
    break;
  case (tUInt8)1u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = (tUInt8)7u;
    break;
  default:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64 = DEF_IF_decode_inst_BIT_30_5_THEN_8_ELSE_9___d56;
  }
  DEF_decode_inst_BITS_14_TO_12_EQ_0b10___d7 = DEF_funct3__h19 == (tUInt8)2u;
  switch (DEF_opcode__h17) {
  case (tUInt8)19u:
  case (tUInt8)51u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d21;
    break;
  case (tUInt8)55u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = (tUInt8)1u;
    break;
  case (tUInt8)23u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = (tUInt8)9u;
    break;
  case (tUInt8)111u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = (tUInt8)4u;
    break;
  case (tUInt8)103u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = (tUInt8)5u;
    break;
  case (tUInt8)99u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d32;
    break;
  case (tUInt8)3u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = DEF_decode_inst_BITS_14_TO_12_EQ_0b10___d7 ? (tUInt8)2u : (tUInt8)0u;
    break;
  case (tUInt8)35u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = DEF_decode_inst_BITS_14_TO_12_EQ_0b10___d7 ? (tUInt8)3u : (tUInt8)0u;
    break;
  case (tUInt8)115u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b1_2_THEN_IF__ETC___d45;
    break;
  default:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54 = (tUInt8)0u;
  }
  switch (DEF_opcode__h17) {
  case (tUInt8)19u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_IF__ETC___d75 = DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_0_ELS_ETC___d64;
    break;
  case (tUInt8)51u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_IF__ETC___d75 = DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_THEN_IF_de_ETC___d66;
    break;
  default:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_IF__ETC___d75 = (tUInt8)0u;
  }
  switch (DEF_funct3__h19) {
  case (tUInt8)0u:
  case (tUInt8)1u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d85 = DEF_funct3__h19;
    break;
  case (tUInt8)4u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d85 = (tUInt8)2u;
    break;
  case (tUInt8)6u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d85 = (tUInt8)3u;
    break;
  case (tUInt8)5u:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d85 = (tUInt8)4u;
    break;
  default:
    DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d85 = (tUInt8)5u;
  }
  switch (DEF_opcode__h17) {
  case (tUInt8)103u:
  case (tUInt8)111u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d88 = (tUInt8)6u;
    break;
  case (tUInt8)99u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d88 = DEF_IF_decode_inst_BITS_14_TO_12_EQ_0b0_OR_decode__ETC___d85;
    break;
  default:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d88 = (tUInt8)7u;
  }
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b100011_5___d128 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b100011___d35;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1110011_7___d107 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b1110011___d37;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10011___d100 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b10011___d2;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110011___d101 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b110011___d3;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110111_2___d102 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b110111___d22;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10111_3___d103 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b10111___d23;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1101111_4___d104 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b1101111___d24;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100111_5___d105 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b1100111___d25;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b11_3___d106 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b11___d33;
  DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100011_6___d90 = !DEF_decode_inst_BITS_6_TO_0_EQ_0b1100011___d26;
  DEF_x__h1600 = 2097151u & (((((((tUInt32)(DEF_decode_inst_BIT_31___d178)) << 20u) | (((tUInt32)((tUInt8)((tUInt8)255u & (ARG_decode_inst >> 12u)))) << 12u)) | (((tUInt32)((tUInt8)((tUInt8)1u & (ARG_decode_inst >> 20u)))) << 11u)) | (((tUInt32)(1023u & (ARG_decode_inst >> 21u))) << 1u)) | (tUInt32)((tUInt8)0u));
  DEF_immJ__h27 = primSignExt32(32u, 21u, (tUInt32)(DEF_x__h1600));
  DEF_x__h1712 = 8191u & (((((((tUInt32)(DEF_decode_inst_BIT_31___d178)) << 12u) | (((tUInt32)((tUInt8)((tUInt8)1u & (ARG_decode_inst >> 7u)))) << 11u)) | (((tUInt32)((tUInt8)((tUInt8)63u & (ARG_decode_inst >> 25u)))) << 5u)) | (((tUInt32)((tUInt8)((tUInt8)15u & (ARG_decode_inst >> 8u)))) << 1u)) | (tUInt32)((tUInt8)0u));
  DEF_immB__h25 = primSignExt32(32u, 13u, (tUInt32)(DEF_x__h1712));
  DEF_x__h1823 = 4095u & ((((tUInt32)((tUInt8)(ARG_decode_inst >> 25u))) << 5u) | (tUInt32)(DEF_decode_inst_BITS_11_TO_7___d38));
  DEF_immS__h24 = primSignExt32(32u, 12u, (tUInt32)(DEF_x__h1823));
  switch (DEF_opcode__h17) {
  case (tUInt8)3u:
  case (tUInt8)19u:
  case (tUInt8)103u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199 = DEF_immI__h23;
    break;
  case (tUInt8)23u:
  case (tUInt8)55u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199 = DEF_immU__h26;
    break;
  case (tUInt8)111u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199 = DEF_immJ__h27;
    break;
  case (tUInt8)99u:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199 = DEF_immB__h25;
    break;
  default:
    DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199 = DEF_immS__h24;
  }
  DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203.set_bits_in_word(DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d88,
										 2u,
										 0u,
										 3u).build_concat(!DEF_decode_inst_BITS_11_TO_7_8_EQ_0___d39 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b10011___d2 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b110011___d3 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b110111___d22 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b10111___d23 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1101111___d24 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100111___d25 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100011_6___d90 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b11___d33 || DEF_decode_inst_BITS_6_TO_0_EQ_0b1110011___d37)))))))),
												  63u,
												  1u).set_bits_in_word(DEF_decode_inst_BITS_11_TO_7_8_EQ_0___d39 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10011___d100 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110011___d101 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110111_2___d102 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10111_3___d103 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1101111_4___d104 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100111_5___d105 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100011___d26 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b11_3___d106 && DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1110011_7___d107)))))))) ? DEF_decode_inst_BITS_11_TO_7___d38 : DEF_decode_inst_BITS_11_TO_7___d38,
														       1u,
														       26u,
														       5u).set_bits_in_word(DEF_decode_inst_BITS_6_TO_0_EQ_0b10011___d2 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b110011___d3 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b110111___d22 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10111_3___d103 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1101111_4___d104 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100111___d25 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100011___d26 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b11___d33 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b100011___d35 || DEF_decode_inst_BITS_6_TO_0_EQ_0b1110011___d37)))))))),
																	    1u,
																	    25u,
																	    1u).set_bits_in_word(DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10011___d100 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110011___d101 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110111_2___d102 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b10111___d23 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1101111___d24 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100111_5___d105 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100011_6___d90 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b11_3___d106 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b100011_5___d128 && DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1110011_7___d107)))))))) ? DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d139 : DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d139,
																				 1u,
																				 20u,
																				 5u).set_bits_in_word(DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10011___d100 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b110011___d3 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110111_2___d102 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10111_3___d103 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1101111_4___d104 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100111_5___d105 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100011___d26 || DEF_decode_inst_BITS_6_TO_0_EQ_0b100011___d35)))))),
																						      1u,
																						      19u,
																						      1u).set_bits_in_word(DEF_decode_inst_BITS_6_TO_0_EQ_0b10011___d2 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110011___d101 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b110111___d22 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b10111___d23 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1101111___d24 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100111___d25 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100011_6___d90 && DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b100011_5___d128)))))) ? DEF_decode_inst_BITS_24_TO_20___d155 : DEF_decode_inst_BITS_24_TO_20___d155,
																									   1u,
																									   14u,
																									   5u).set_bits_in_word(DEF_decode_inst_BITS_6_TO_0_EQ_0b1110011___d37,
																												1u,
																												13u,
																												1u).set_bits_in_word(DEF_decode_inst_BITS_6_TO_0_EQ_0b1110011___d37 ? DEF_immI_BITS_11_TO_0___h1517 : DEF_immI_BITS_11_TO_0___h1517,
																														     1u,
																														     1u,
																														     12u).set_bits_in_word(DEF_decode_inst_BITS_6_TO_0_EQ_0b10011___d2 || (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110011___d101 && ((DEF_decode_inst_BITS_6_TO_0_EQ_0b110111___d22 || DEF_decode_inst_BITS_6_TO_0_EQ_0b10111___d23) || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1101111___d24 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100111___d25 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b1100011___d26 || (DEF_decode_inst_BITS_6_TO_0_EQ_0b11___d33 || DEF_decode_inst_BITS_6_TO_0_EQ_0b100011___d35)))))),
																																	   1u,
																																	   0u,
																																	   1u).set_whole_word(DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10011___d100 && (DEF_decode_inst_BITS_6_TO_0_EQ_0b110011___d3 || ((DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b110111_2___d102 && DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b10111_3___d103) && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1101111_4___d104 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100111_5___d105 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b1100011_6___d90 && (DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b11_3___d106 && DEF_NOT_decode_inst_BITS_6_TO_0_EQ_0b100011_5___d128)))))) ? DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199 : DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_SEX_ETC___d199,
																																			      0u);
  PORT_decode.set_bits_in_word(2047u & (((((tUInt32)(DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d54)) << 7u) | (((tUInt32)(DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_THEN_IF__ETC___d75)) << 3u)) | (tUInt32)(DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203.get_bits_in_word8(2u,
																																					    0u,
																																					    3u))),
			       2u,
			       0u,
			       11u).set_whole_word(DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203.get_whole_word(1u),
						   1u).set_whole_word(DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203.get_whole_word(0u),
								      0u);
  return PORT_decode;
}

tUInt8 MOD_module_decode::METH_RDY_decode()
{
  DEF_CAN_FIRE_decode = (tUInt8)1u;
  PORT_RDY_decode = DEF_CAN_FIRE_decode;
  return PORT_RDY_decode;
}


/* Reset routines */


/* Static handles to reset routines */


/* Functions for the parent module to register its reset fns */


/* Functions to set the elaborated clock id */


/* State dumping routine */
void MOD_module_decode::dump_state(unsigned int indent)
{
}


/* VCD dumping routines */

unsigned int MOD_module_decode::dump_VCD_defs(unsigned int levels)
{
  vcd_write_scope_start(sim_hdl, inst_name);
  vcd_num = vcd_reserve_ids(sim_hdl, 5u);
  unsigned int num = vcd_num;
  for (unsigned int clk = 0u; clk < bk_num_clocks(sim_hdl); ++clk)
    vcd_add_clock_def(sim_hdl, this, bk_clock_name(sim_hdl, clk), bk_clock_vcd_num(sim_hdl, clk));
  vcd_write_def(sim_hdl, num++, "CAN_FIRE_decode", 1u);
  vcd_write_def(sim_hdl, num++, "IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203", 67u);
  vcd_write_def(sim_hdl, num++, "RDY_decode", 1u);
  vcd_write_def(sim_hdl, num++, "decode", 75u);
  vcd_write_def(sim_hdl, num++, "decode_inst", 32u);
  vcd_write_scope_end(sim_hdl);
  return num;
}

void MOD_module_decode::dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_module_decode &backing)
{
  vcd_defs(dt, backing);
}

void MOD_module_decode::vcd_defs(tVCDDumpType dt, MOD_module_decode &backing)
{
  unsigned int num = vcd_num;
  if (dt == VCD_DUMP_XS)
  {
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 67u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 75u);
    vcd_write_x(sim_hdl, num++, 32u);
  }
  else
    if (dt == VCD_DUMP_CHANGES)
    {
      if ((backing.DEF_CAN_FIRE_decode) != DEF_CAN_FIRE_decode)
      {
	vcd_write_val(sim_hdl, num, DEF_CAN_FIRE_decode, 1u);
	backing.DEF_CAN_FIRE_decode = DEF_CAN_FIRE_decode;
      }
      ++num;
      if ((backing.DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203) != DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203)
      {
	vcd_write_val(sim_hdl, num, DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203, 67u);
	backing.DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203 = DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203;
      }
      ++num;
      if ((backing.PORT_RDY_decode) != PORT_RDY_decode)
      {
	vcd_write_val(sim_hdl, num, PORT_RDY_decode, 1u);
	backing.PORT_RDY_decode = PORT_RDY_decode;
      }
      ++num;
      if ((backing.PORT_decode) != PORT_decode)
      {
	vcd_write_val(sim_hdl, num, PORT_decode, 75u);
	backing.PORT_decode = PORT_decode;
      }
      ++num;
      if ((backing.PORT_decode_inst) != PORT_decode_inst)
      {
	vcd_write_val(sim_hdl, num, PORT_decode_inst, 32u);
	backing.PORT_decode_inst = PORT_decode_inst;
      }
      ++num;
    }
    else
    {
      vcd_write_val(sim_hdl, num++, DEF_CAN_FIRE_decode, 1u);
      backing.DEF_CAN_FIRE_decode = DEF_CAN_FIRE_decode;
      vcd_write_val(sim_hdl, num++, DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203, 67u);
      backing.DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203 = DEF_IF_decode_inst_BITS_6_TO_0_EQ_0b10011_OR_decod_ETC___d203;
      vcd_write_val(sim_hdl, num++, PORT_RDY_decode, 1u);
      backing.PORT_RDY_decode = PORT_RDY_decode;
      vcd_write_val(sim_hdl, num++, PORT_decode, 75u);
      backing.PORT_decode = PORT_decode;
      vcd_write_val(sim_hdl, num++, PORT_decode_inst, 32u);
      backing.PORT_decode_inst = PORT_decode_inst;
    }
}
