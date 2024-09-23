Profile:        ReferenceAccessionNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Reference
Id:             accession-number
Title:          "Accession Number"
Description:     """
NHS Data Dictionary [RADIOLOGICAL ACCESSION NUMBER](https://www.datadictionary.nhs.uk/data_elements/radiological_accession_number.html)

"""

* type 1..1 MS
* type = "ServiceRequest"
* identifier 1..1
* identifier.system 1..1
* identifier.system ^short = "uri should be defined and unique supplying organisation."
* identifier.value 1..1
