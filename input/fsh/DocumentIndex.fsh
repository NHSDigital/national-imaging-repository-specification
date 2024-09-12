Profile:        DocumentIndex
Parent:         https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Id:             DocumentIndex
Title:          "NHS England Document Index"
Description:    " "

* identifier 1..* MS
* type from DocumentIndexType
* category from DocumentIndexClass
* context.facilityType from FacilityType
* context.practiceSetting from Specialty

* context.related 1..*

* context.related ^slicing.discriminator.type = #pattern
* context.related ^slicing.discriminator.path = "type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type"
* context.related ^slicing.ordered = false

* context.related contains
  accession 1..1 MS
* context.related[accession].type 1..1 MS
* context.related[accession].type = "ServiceRequest"
* context.related[accession].identifier 1..1
* context.related[accession].identifier.system 1..1
* context.related[accession].identifier.system ^short = "uri should be defined and unique supplying organisation."
* context.related[accession].identifier.value 1..1

