Profile:        AccessionNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             accession-number
Title:          "Accession Number"
Description:     """
NHS Data Dictionary [RADIOLOGICAL ACCESSION NUMBER](https://www.datadictionary.nhs.uk/data_elements/radiological_accession_number.html)

"""

* system 1..1
* system ^short = "uri should be defined and unique supplying organisation."
* value 1..1
