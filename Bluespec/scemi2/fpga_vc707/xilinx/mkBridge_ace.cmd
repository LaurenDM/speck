setMode -acecf
addCollection -name "VC707"
addDesign -version 6 -name "cfg6"
addDeviceChain -index 0
setCurrentDesign -version 6
setCurrentDeviceChain -index 0
addDevice -p 1 -file mkBridge.bit
generate -active VC707
quit
