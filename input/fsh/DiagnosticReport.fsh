Profile:        DiagnosticReport
Parent:         http://hl7.org/fhir/StructureDefinition/DiagnosticReport
Id:             DiagnosticReport
Title:          "Diagnostic Report"
Description:    """
DiagnosticReport based on

- [Royal College of Radiologists - Understanding the Technical Options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)
- [IHE Interactive Multimedia Report (IMR)](https://profiles.ihe.net/RAD/IMR)

At present this is not based on [UK Core DiagnosticReport](https://simplifier.net/hl7fhirukcorer4/ukcore-diagnosticreport) as this is analysis of several enterprise entity models but will be at a later date.

"""

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

* subject.identifier 1..1
* subject.identifier.system 1..1
* subject.identifier.value 1..1

* performer.extension contains
      http://hl7.org/fhir/StructureDefinition/event-performerFunction named performerFunction 0..1
