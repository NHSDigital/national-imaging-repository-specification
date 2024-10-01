Profile:        ServiceRequest
Parent:         http://hl7.org/fhir/StructureDefinition/ServiceRequest
Id:             ServiceRequest-Radiology
Title:          "Radiology ServiceRequest"
Description:    "Ignore, just a collection of notes."

* code ^short = "National Interim Procedure Code (NICIP)"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  accessionNumber 0..1 MS

* identifier[accessionNumber] only AccessionNumber
