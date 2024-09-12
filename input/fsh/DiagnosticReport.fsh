Profile:        DiagnosticReport
Parent:         http://hl7.org/fhir/StructureDefinition/DiagnosticReport
Id:             DiagnosticReport
Title:          "NHS England DiagnosticReport"
Description:    "NHS England DiagnosticReport Entity Model, based on data model [HL7 IPS DiagnosticReport](https://build.fhir.org/ig/HL7/fhir-ips/StructureDefinition-DiagnosticReport-uv-ips.html)"

* identifier 1..* MS

* basedOn ^slicing.discriminator.type = #pattern
* basedOn ^slicing.discriminator.path = "type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the type"
* basedOn ^slicing.ordered = false
* basedOn contains
  accession 0..1 MS

* basedOn[accession].type 1..1 MS
* basedOn[accession].type = "ServiceRequest"
* basedOn[accession].identifier 1..1
* basedOn[accession].identifier.system 1..1
* basedOn[accession].identifier.system ^short = "uri should be defined and unique supplying organisation."
* basedOn[accession].identifier.value 1..1
