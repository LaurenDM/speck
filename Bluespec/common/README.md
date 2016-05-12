- 'SpeckTypes.bsv': defines interfaces, constants, etc
- 'Speck.bsv': encryption and decryption module
- 'SpeckTest.bsv': unit tests
- 'Speckunit.bspec': file for BlueSim
- 'OFB.bsv': module for OFB mode of encryption
- 'Throughput.bsv': module that feeds inputs to encryption/decryption module from hardware
- 'Unfolding.bsv': encryption and decryption module of speck using >1 stages in pipeline

note: the implementations are polymorphic, but the constants define for which parameters the implementations are synthesized. In our case, SPECK48/96 was synthesized.
