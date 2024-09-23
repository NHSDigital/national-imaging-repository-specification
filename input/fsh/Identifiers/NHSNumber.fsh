Profile:        NHSNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Reference
Id:             nhs-number
Title:          "NHS Number"
Description:     """
Only traced NHS Number may be used.

NHS Data Dictionary [NHS NUMBER](https://www.datadictionary.nhs.uk/data_elements/nhs_number.html)
"""

* identifier 1..1
* identifier.system 1..1
* identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier.value 1..1
