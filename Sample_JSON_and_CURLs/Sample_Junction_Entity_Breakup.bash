

curl 192.168.101.115:9090/ngsi-ld/v1/entities -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
"id": "urn:ngsi:Junction:10",
"type": "Junction",
"location": {
"type": "Point",
"coordinates": [
20.0,
70.0
]
},
"initialQuality": {
"value": 0.0005
},
"name": "10",
"elevation": 216.40800000000002,
"@context": [
"https://raw.githubusercontent.com/smart-data-models/dataModel.WaterDistributionManagementEPANET/master/context.jsonld"
]
}
EOF

curl 192.168.101.115:9090/ngsi-ld/v1/entities -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
"id": "urn:ngsi:Junction:11",
"type": "Junction",
"name": "10",
"@context": [
"https://raw.githubusercontent.com/smart-data-models/dataModel.WaterDistributionManagementEPANET/master/context.jsonld"
]
}
EOF

curl 192.168.101.115:9090/ngsi-ld/v1/entities -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
"id": "urn:ngsi:Junction:12",
"type": "Junction",
"name": "10",
"@context": [
"https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
]
}
EOF


http://192.168.101.115:9090/ngsi-ld/v1/entities/urn:ngsi:Junction:10