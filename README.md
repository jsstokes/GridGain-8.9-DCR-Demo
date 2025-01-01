# GridGain-8.9-DCR-Demo

## Purpose
This repo is intended to provide directions and artifacts required to setup
& demonstrate GridGain Ultimates's Data Center Replication feature.

At the end of this tutorial you will have:
1. Created and configured 4 __LOCAL__ GridGain nodes:
    * DC1 Data Node
    * DC1 Sender Node
    * DC2 Data Node
    * DC2 Sender Node
2. Used GridGain Control Center (or GridGain Nebula) to create data in DC1 
3. Used GridGain Control Center be able
to see the data replicated to DC2 

## Prerequisites
1. GridGain Ultimate Edition v8.9.15 (_any version of 8.9 should work, but this was tested with 8.9.15_) 
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
4. In the terminal where you will be executing the DC1 Sender Node, please set an environment variable name MY_IP_ADDRESS to 
the value of your machines IP Address.  The following command works on Mac OS v14.7.1 (Sonoma)
```
   export MY_IP_ADDRESS=`ipconfig getifaddr en0`
```
__NOTE:__ Note that the above command use back ticks (backquote, grave, or grave accent)

## Starting the instances
__<u>BEFORE PROCEEDING:</u>__ Make sure that GridGain is configured properly and that the $GRIDGAIN_HOME 
environment variable is properly set.

### Start the DC1 Data Instance
1. Open a terminal prompt and cd to the __config/dc1__ directory in this project
2. Start the Data Node for DC1
```
   % $GRIDGAIN_HOME/bin/ignite.sh data-node.xml
```
3. Copy the Control Center Token when it is displayed
4. Add the Cluster to Control Center and rename it to DC1 se that it's easier to find

### Start the DC2 Data Instance & Receiver Node
1. Open a terminal prompt and cd to the __config/dc2__ directory in this project
2. Start the Data Node for DC2
```
   % $GRIDGAIN_HOME/bin/ignite.sh data-node.xml
```
3. Copy the Control Center Token when it is displayed
4. Add the Cluster to Control Center and rename it to DC2 se that it's easier to find

3. Start the receiver node for DC2
```
   % $GRIDGAIN_HOME/bin/ignite.sh receiver-node.xml
```

### Start the Sender Node for DC1
1. Open a terminal prompt and cd to the __config/dc1__ directory in this project
2. Start the receiver node for DC2
```
   % $GRIDGAIN_HOME/bin/ignite.sh sender-node.xml
```

### Testing the Replication

Now that your environment is setup & running, it's time to test it out.

1. Open Control Center and switch to DC1
2. On the Queries tab, you will be able to see the PERSON_CACHE and the PERSON table schema
3. Execute the following query
```
SELECT * FROM "PERSON" 
```
You should see no rows returned because we don't have any data yet
4. Create some data in DC1.  As each of these are inserted into DC1, they will also be replicated in DC2.  
Feel free to switch to the DC2 cluster and execute the SELECT statement above to see the records are being 
replicated properly.<br/><br/>
_I chose to use the names of cartoon characters but feel free to use any names you like as long as 
the PERSONID is unique._
```
insert into PERSON_CACHE.PERSON (PERSONID,FIRSTNAME,LASTNAME) VALUES ('1','Fred','Flintstone');
insert into PERSON_CACHE.PERSON (PERSONID,FIRSTNAME,LASTNAME) VALUES ('2','Wilma','Flintstone');
insert into PERSON_CACHE.PERSON (PERSONID,FIRSTNAME,LASTNAME) VALUES ('3','Barney','Rubble');
insert into PERSON_CACHE.PERSON (PERSONID,FIRSTNAME,LASTNAME) VALUES ('4','Betty','Rubble');
```

