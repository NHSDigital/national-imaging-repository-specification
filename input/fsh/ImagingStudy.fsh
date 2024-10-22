Profile:        ImagingStudy
Parent:         http://hl7.org/fhir/StructureDefinition/ImagingStudy
Id:             ImagingStudy
Title:          "Imaging Study"
Description:    "Ignore, just a collection of notes."

* identifier 1..* MS

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  accessionNumber 0..1 MS

* identifier[accessionNumber] only Reference(ServiceRequest)
* identifier[accessionNumber] ^short = "Created by Imaging Test Order Workflow"
* identifier[accessionNumber].type 1..1 MS
* identifier[accessionNumber].type = "ServiceRequest"
* identifier[accessionNumber].identifier 1..1
* identifier[accessionNumber].identifier only AccessionNumber

* subject 1..1
* subject.identifier 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* procedureCode from ImagingCodeNICIP (preferred)

