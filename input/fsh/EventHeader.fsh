Profile:        EventHeader
Parent:         http://hl7.org/fhir/StructureDefinition/MessageHeader
Id:             event-header
Title:          "Event Header"
Description:    "Details to follow"

* event[x] only uri
* event[x] ^short      = "Reference uri to SubscriptionTopic"

* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier 1..1
* sender.identifier.system 1..1
* sender.identifier.value 1..1

* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier 1..1
* destination.receiver.identifier.system 1..1
* destination.receiver.identifier.value 1..1

* reason from http://terminology.hl7.org/ValueSet/v2-0003
