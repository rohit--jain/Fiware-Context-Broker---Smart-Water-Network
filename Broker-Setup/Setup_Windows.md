# Steps for Setting Up FIWARE Broker on Windows

## Prequisities
Windows 10 or 8

## Step 1: Install WSL 
To install WSL on Windows follow the steps mention in Microsoft's website: https://docs.microsoft.com/en-us/windows/wsl/install

## Step 2: Get Debian App from Windows Store
Go to Windows Store and Search "Debian", that should direct you to Debian app as shown in Screenshot "DebianWindowsStore.JPG". Install it & open it -> this may take few minutes

## Step 3: Update Packages in Debian App
In command shell of Debian app run **sudo apt update**
In case you encounter network inaccessibility issues you will have to follow 2 steps:
[1] Restart your Debian app
[2] 

## Step 4: Install Broker from GitHub
Usually Debian comes with pre installed Git. Since our implementation specifically focuses on NGSI-LD version, you can read more about it at:  https://github.com/FIWARE/tutorials.Getting-Started/tree/NGSI-LD.
To install follow steps at https://github.com/FIWARE/tutorials.Getting-Started/tree/NGSI-LD#start-up and run these commands in your Debian app

## Step 5: Start Broker
Restart your Debian app and run **sudo ./services scorpio**
 
## Step 6: Test your Broker with a Test Entity 
In Debian app command shell use following CURL command:
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
If it runs correctly there should be blank response and no error message in output. **Note:** If you executed this CURL command in past you will get error message about entity already exists, which still indicates normal functioning of Broker.

## Known Issue 1: Too much RAM consumption > 5GB!
When broker is setup initially it consumes several GBs of RAM, however much of the RAM gets freed during prolonged usage or after restart of app

## Known Issue 2: After Debian App restart Broker doesn't start because Docker doesn't start without Systemd in WSL
There are many ways to fix this problem. Most frequently **sudo service docker start** enables Docker running as a background service.
Another issue can be Fstab complain, for this checkout: https://stackoverflow.com/questions/49397435/docker-start-failed-because-etc-fstab-not-found 

## Known Issue 3: How to safely shutdown Broker
Inside command shell of Debian type **sudo ./services stop**
That should stop all running docker containers for Broker.
Once done, go to your windows command prompt and type **wsl --shutdown**