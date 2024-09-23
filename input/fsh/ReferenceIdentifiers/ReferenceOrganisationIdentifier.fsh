Profile:        ReferenceOrganisationIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Reference
Id:             organisation-identifier
Title:          "Organisation Identifier"
Description:     """
NHS Data Dictionary [ORGANISATION_CODE](https://www.datadictionary.nhs.uk/attributes/organisation_code.html)
"""

* type = "Organization"
* identifier 1..1
* identifier.system 1..1
* identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier.value 1..1
