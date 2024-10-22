Profile:        ImagingStudy
Parent:         http://hl7.org/fhir/StructureDefinition/ImagingStudy
Id:             ImagingStudy
Title:          "Imaging Study"
Description:    "Ignore, just a collection of notes."

* identifier 1..* MS

* basedOn ^slicing.discriminator.type = #pattern
* basedOn ^slicing.discriminator.path = "type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the type"
* basedOn ^slicing.ordered = false
* basedOn contains
  accessionNumber 0..1 MS

* basedOn[accessionNumber] only Reference(ServiceRequest)
* basedOn[accessionNumber] ^short = "Created by Imaging Test Order Workflow"
* basedOn[accessionNumber].type 1..1 MS
* basedOn[accessionNumber].type = "ServiceRequest"
* basedOn[accessionNumber].identifier 1..1
* basedOn[accessionNumber].identifier only AccessionNumber

