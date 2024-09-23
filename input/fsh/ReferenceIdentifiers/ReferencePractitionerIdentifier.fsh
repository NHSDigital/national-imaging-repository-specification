Profile:        ReferencePractitionerIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Reference
Id:             practitioner-identifier
Title:          "Practitioner Identifier"
Description:     """

NHS Data Dictionary [CONSULTANT_CODE](https://www.datadictionary.nhs.uk/data_elements/consultant_code.html)
and [GENERAL MEDICAL PRACTITIONER PPD CODE](https://www.datadictionary.nhs.uk/attributes/general_medical_practitioner_ppd_code.html)
"""

* type = "Practitioner"
* identifier 1..1
* identifier.system 1..1
* identifier.value 1..1
