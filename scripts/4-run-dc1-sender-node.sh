cd ../config/dc1
export MY_IP_ADDRESS=`ipconfig getifaddr en0`
$GRIDGAIN_HOME/bin/ignite.sh sender-node.xml