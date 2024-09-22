Profile:        MessageEventNotification
Parent:         http://hl7.org/fhir/StructureDefinition/Bundle
Id:             message-event-notification
Title:          "Message Event Notification"
Description:    "Details to follow"

* identifier 1..1
* type = http://hl7.org/fhir/bundle-type#message
* timestamp 1..1
* entry 1..*
* entry.resource 1..1

* entry ^slicing.discriminator.type = #pattern
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice to Mandate EventHeader profiled MessageHeader"
* entry ^slicing.ordered = false

* entry contains
  eventHeader 1..1 MS

* entry[eventHeader].resource only EventHeader

