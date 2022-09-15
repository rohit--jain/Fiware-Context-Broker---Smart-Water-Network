**Python package perquisities:**

1. requests
2. tqdm

**Application Parameters**

python water-simulation.py --endpoint [broker-ip-address]:9090 --scenario [dummy-non-existent-scenario-name] [sample-test-data].json<br>
  
**endpoint** - Fiware Context Broker IP address & port number (For Scorpio 9090)<br>

**scenario** - Depricated legacy parameter for Scenario can be any dummy or non-existant value - new version of application doesn't use it anymore<br>
  
**sample test data** - EPANET Simulation Test Data for Water Network Simulation - JSON file containing sample simulated values for Pumps, Junctions, Reservoir, Tanks, Pipes, Curves, Patterns and Networks<br>

  
