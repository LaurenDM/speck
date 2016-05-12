# Speck


Tis repository contains a Bluespec implementation for the NSA lightweight crypto family SPECK.\\

For our demo:
- 'cd Bluespec/scemi_gui'
- 'programfpga xilinx/mkBridge.bit'
- './pipeline_speck.sh'
This will start a GUI that allows you to enter messages and keys to encrypt/decrypt.


File structure:
- directory 'Software': implementations in c and cpp (includes reference c implementation of speck from original paper)
- directory 'Bluespec': Bluespec implementations, ScemiLayer and testbenches
  - 'common': bluespec source files
    - 'SpeckTypes.bsv': defines interfaces, constants, etc
    - 'Speck.bsv': encryption and decryption module
    - 'SpeckTest.bsv': unit tests
    - 'Speckunit.bspec': file for BlueSim
    - 'OFB.bsv': module for OFB mode of encryption
    - 'Throughput.bsv': module that feeds inputs to encryption/decryption module from hardware
    - 'Unfolding.bsv': encryption and decryption module of speck using >1 stages in pipeline
    - 'scemi_original': Scemilayer and testbench for SPECK algorithm as is (inputs are files of hexadecimal plaintext blocks)
    - 'scemi_throughput': Scemilayer and testbench for measuring throughput (inputs fed from hardware)
    - 'scemi_ofb': Scemilayer and testbench for SPECK in OFB mode of operation (inputs are message files, encoded and split into blocks before fed to FPGA)
  - 'scemi_ofb_throughput': Scemilayer and testbench for measuring throughput for OFB mode of operation
  - 'scemi_gui': similar to 'scemi_ofb' but with a GUI

note: the implementations are polymorphic, but the constants define for which parameters the implementations are synthesized. In our case, SPECK48/96 was synthesized.
