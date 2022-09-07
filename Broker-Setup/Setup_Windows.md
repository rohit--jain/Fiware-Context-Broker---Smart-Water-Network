# Steps for Setting Up FIWARE Broker on Windows

## Prequisities
Windows 10

## Step 1: Install WSL 
Basic step to install, is to open command prompt as administrator and type : ```wsl --install```
This will take some minutes to install and then require restart to complete full installation with Ubuntu app, wherein you would be prompted to setting user name and password.<br>For more details follow the steps mention in Microsoft's website: https://docs.microsoft.com/en-us/windows/wsl/install


## Step 2: Get Debian App from Windows Store
Go to Windows Store and Search "Debian", that should direct you to Debian app as shown in Screenshot "DebianWindowsStore.JPG". Install it & open it -> this may take few minutes. At the end you would be prompted to setup Username & Password. After setup type "exit" and close and then reopen the Debian app again.

## Step 3: Update Packages in Debian App
[1] In command shell of Debian app run : ```sudo apt update```<br>
[2] Then upgrade all packages with : ```sudo apt upgrade -y``` <br>
[3] Type "exit" and close and then reopen the Debian app again <br>

## Step 4: Install Docker in Debian App
Follow the instructions at: https://docs.docker.com/engine/install/debian/<br>
If the Docker **Hello World** fails to run, check out **"Known Issue 2"** section in this page below
 
## Step 5: Install Broker from GitHub
Usually Debian comes with pre installed Git. Since our implementation specifically focuses on NGSI-LD version, you can read more about it at:  https://github.com/FIWARE/tutorials.Getting-Started/tree/NGSI-LD.<br>
To install follow steps at https://github.com/FIWARE/tutorials.Getting-Started/tree/NGSI-LD#start-up and run these commands in your Debian app

## Step 6: Start Broker
Restart your Debian app and run : ```sudo ./services scorpio```<br>
This will takes few minutes to setup on first time and after installation and startup, it stays as a background service and you should be able to access back to your command console automatically.

## Step 7: Get your Broker's IP address
For the first time setup you may need to install **net-tools** package with command : ```sudo apt install net-tools```<br>
After installation you should be able to run command : ```ifconfig```. <br>
In the command trace you can locate **"eth0:"** which will contain **"inet"** with the mention of the IP-address.<br>
IP-address would be required for connecting apps outside Debian to your broker with path: **http://[Broker-IP-address]:9090/** <br>
Note that IP-address gets changed after every reboot of the Debian app.<br>

## Step 8: Test Broker from Browser
Open any browser and type in address bar: **http://[Broker-IP-address]:9090/** and you should see white webpage with heading **"Whitelabel Error Page"** with current date and time in the next lines. This indicates that the Broker is up and running and accessible outside Debian app on Windows.

## Step 9: Test your Broker with a Test Entity 
In Debian app command shell use following CURL command:<br>
```
curl http://localhost:9090/ngsi-ld/v1/entities -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
  "id": "house2:smartrooms:room2",
  "type": "Room",
  "temperature": {
        "value": 21,
        "unitCode": "CEL",
        "type": "Property",
        "providedBy": {
                "type": "Relationship",
                "object": "smartbuilding:house2:sensor4711"
        }
  },
  "isPartOf": {
        "type": "Relationship",
        "object": "smartcity:houses:house2"
  },
  "@context": [{"Room": "urn:mytypes:room", "temperature": "myuniqueuri:temperature", "isPartOf": "myuniqueuri:isPartOf"},"https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"]
}
EOF
```
If it runs correctly there should be blank response and no error message in output.<br>
**Note [1]:** If you executed this CURL command in past you will get error message about entity already exists, which still indicates normal functioning of Broker.<br>
**Note [2]:** You can replace localhost with Broker-IP-Address for running outside Debian app.<br>

## Step 10: To delete a pre-existing entity
Suppose you want to delete the previous inserted entity, you can use the following CURL command: <br>
```
curl http://[Broker-IP-address]:9090/ngsi-ld/v1/entities/house2:smartrooms:room2 -X DELETE 
```

## Step 11: Checking Scorpio Broker logs
In Debian app run the following command: : ```sudo docker compose logs scorpio```

## Known Issue 1: Too much RAM consumption > 5GB!
When broker is setup initially it consumes several GBs of RAM, however much of the RAM gets freed (probably garbage collected over time from JAVA SpringBoot components of Broker) during prolonged usage or after restart of app

## Known Issue 2: After Debian App restart Broker doesn't start because Docker doesn't start without Systemd in WSL
There are many ways to fix this problem. Most frequently : ```sudo service docker start``` enables Docker running as a background service.<br>
Another issue can be Fstab complain, for this checkout: https://stackoverflow.com/questions/49397435/docker-start-failed-because-etc-fstab-not-found 

## Known Issue 3: How to safely shutdown Broker
Inside command shell of Debian type : ```sudo ./services stop```<br>
That should stop all running docker containers for Broker.<br>
Once done, go to your windows command prompt and type : ```wsl --shutdown```

## Reference Tutorials
The tutorials for NGSI-LD and FIWARE are here: https://ngsi-ld-tutorials.readthedocs.io/en/latest/<br>
More information on Scorpio Broker: https://github.com/ScorpioBroker/ScorpioBroker
