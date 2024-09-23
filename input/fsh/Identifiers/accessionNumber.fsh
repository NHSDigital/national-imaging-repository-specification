Profile:        accessionNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Reference
Id:             accession-number
Title:          "accession Number"
Description:     """
accession Number

"""


* type 1..1 MS
* type = "ServiceRequest"
* identifier 1..1
* identifier.system 1..1
* identifier.system ^short = "uri should be defined and unique supplying organisation."
* identifier.value 1..1
