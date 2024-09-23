Profile:        NHSNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             nhs-number
Title:          "NHS Number"
Description:     """
Only traced NHS Number may be used.

NHS Data Dictionary [NHS NUMBER](https://www.datadictionary.nhs.uk/data_elements/nhs_number.html)
"""

* system 1..1
* system = "https://fhir.nhs.uk/Id/nhs-number"
* value 1..1
