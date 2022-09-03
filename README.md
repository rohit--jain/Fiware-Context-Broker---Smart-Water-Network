# FIWARE-Context-Broker---Smart-Water-Network
Sample Smart Water Model Network Simulation with FIWARE Scorpio Context Broker


EmergenCity is a research project which "aims to protect smart cities from disasters. For this we are developing resilient infrastructures that save human lives.", check  for more details at: https://emergencity.de. The main idea is to connect different organizations across different countries in Europe through initiative of European Commission's Connecting Europe Facility (CEF Digital), for more details see https://digital-strategy.ec.europa.eu/en/activities/cef-digital

The main concept involves seamless and interoperable data exchange among different infrastructures within a Smart City such as Electricity Power Grid, Water Irrigation & Distribution, Traffic Control, Weather & Air Quality Monitoring, etc. This data exchange is enabled through Context Broker built FIWARE, for more details visit: https://ec.europa.eu/cefdigital/wiki/display/CEFDIGITAL/What+is+Context+Broker. The inoperability for data is enabled through common use of smart data models by data exchanging parties while maintaining their respective privacy policies, for more details visit: https://smartdatamodels.org and https://www.fiware.org/smart-data-models/

This repo presents a sample application which demonstrates use of Smart Data Model with NGSI-LD standard from Water Distribution Management EPANET
For more details see https://github.com/smart-data-models/SmartWater. This Smart Data Model is then fed to FIWARE's Scorpio Context Broker, see more details: https://scorpio.readthedocs.io/en/latest/

Python Application 1 uses pre generated simulated data for following elements of standard water distribution network - junctions, tanks, reservoirs, pipes, pumps, curves and patterns and interacts with Context Broker through REST API

Python Application 2 generates runtime simulated data for 1 Valve and sends to Scorpio Context Broker. This is an adaptation from a real full scale demonstration test rig (see testrig.jpg) with Tank, Reservoir, Pump, Valves, Pressure Guage, etc to send realtime data to our remote Context Broker
