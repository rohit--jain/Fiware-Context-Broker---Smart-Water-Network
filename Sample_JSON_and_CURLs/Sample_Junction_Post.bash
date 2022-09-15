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
	"type": "property",
	"value": 0.0005
},
"name": {
	"value":"10",
	"
"elevation": 216.40800000000002,
"@context": [
"https://raw.githubusercontent.com/smart-data-models/dataModel.WaterDistributionManagementEPANET/master/context.jsonld"
]
}
EOF