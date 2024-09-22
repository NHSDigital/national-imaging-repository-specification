Profile:        EventHeader
Parent:         http://hl7.org/fhir/StructureDefinition/MessageHeader
Id:             event-header
Title:          "Event Header"
Description:    "Details to follow"

* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier 1..1
* sender.identifier.system 1..1
* sender.identifier.value 1..1
