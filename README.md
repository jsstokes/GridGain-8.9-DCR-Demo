# GridGain-8.9-DCR-Demo

## Purpose
This repo is intended to provide directions and artifacts required to setup
& demonstration GridGain Ultimates's Data Center Replication feature.

At the end of this tutorial you will have:
1. Created and configured 4 GridGain nodes
    * DC1 Data Node
    * DC1 Sender Node
    * DC2 Data Node
    * DC2 Sender Node
2. Used GridGain Control Center (or GridGain Nebula) to create data in DC1 
3. Used GridGain Control Center be able
to see the data replicated to DC2 

## Prerequisites
1. GridGain Ultimate Edition v8.9.15
    * a GridGain Ultimate License key is required
2. GridGain Control Center
    * a Control Center license is required if running Control Center locally
    * GridGain Nebula may also be used 
      - a free trial con be obtained at
      [GridGain Nebula](https://portal.gridgain.com/)

## Setup
1. Request a license keys for
   * Ultimate Edition
   * Control Control Center (if not using Nebula)
   * GridGain employees can submit the license requests here [GridGain IT Support Portal](https://it.gridgain.com/portal/22)
     * Select "License Requests" -> "License Request"
   * External Users can use [Contact Us](https://www.gridgain.com/contact) and submit a request to the sales team
2. Download [GridGain Ultimate Edition](https://www.gridgain.com/media/gridgain-ultimate-8.9.15.zip)
2. Unzip the downloaded file and move to your desired location
    * I typically keep these on my Desktop
3. Download and Install [Control Center](https://www.gridgain.com/media/control-center/gridgain-control-center-on-premise-2024.4.zip)
4. Alter the dc1/hub-node.xml file - update the value of the receiverAddresses line to reflect your local IP address<br/>
replace xxx.xxx.xxx.xxx below with your actual local ipaddress

Note: Simply using localhost or 127.0.0.1 does __NOT__ work 

`<property name="receiverAddresses" value="xxx.xxx.xxx.xxx:50000"/>`


## Starting the instances
__<u>BEFORE PROCEEDING:</u>__ Make sure that GridGain is configured properly and that the $GRIDGAIN_HOME 
environment variable is properly set.

### Start the DC1 Instance
1. Open a terminal prompt and cd to the _config_ directory in this project
2. Start the Data Node for DC1
```
   % $GRIDGAIN_HOME/bin/ignite.sh data-node.xml
```
3. 
 
