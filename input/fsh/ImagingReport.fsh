Profile:        ImagingReport
Parent:         http://hl7.org/fhir/StructureDefinition/DiagnosticReport
Id:             ImagingReport
Title:          "Imaging Report (FHIR DiagnosticReport)"
Description:    """
DiagnosticReport based on

- [Royal College of Radiologists - Understanding the Technical Options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf) HL7 v2 ORU
- [UK Core DiagnosticReport](https://simplifier.net/hl7fhirukcorer4/ukcore-diagnosticreport)

Users should also review this analysis in conjunction with [IHE Interactive Multimedia Report (IMR) - IMR DiagnosticReport](https://profiles.ihe.net/RAD/IMR/1.1.0/StructureDefinition-imr-diagnosticreport.html)
"""

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

* code from ImagingCodeNICIP (preferred)
* category from Modality (preferred)

* subject 1..1
* subject.identifier 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* performer.identifier 1..1
* performer.identifier.system 1..1
* performer.identifier.value 1..1
* performer.type 1..1
* performer.extension contains
      http://hl7.org/fhir/StructureDefinition/event-performerFunction named performerFunction 0..1
* performer ^slicing.discriminator.type = #pattern
* performer ^slicing.discriminator.path = "type"
* performer ^slicing.rules = #open
* performer ^slicing.description = "Slice based on the type"
* performer ^slicing.ordered = false
* performer contains
  organisation 1..1 and operator 0..*

* performer[organisation] only Reference(Organization)
* performer[organisation].identifier only OrganisationCode

* performer[operator] only Reference(Practitioner)
* performer[operator].identifier only GeneralMedicalPractitionerCode or GeneralMedicalCouncilReferenceNumber
* performer[operator].extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SPRF

* resultsInterpreter.identifier 1..1
* resultsInterpreter.identifier.system 1..1
* resultsInterpreter.identifier.value 1..1
* resultsInterpreter.type 1..1
* resultsInterpreter.extension contains
      http://hl7.org/fhir/StructureDefinition/event-performerFunction named performerFunction 0..1

* resultsInterpreter ^slicing.discriminator.type = #pattern
* resultsInterpreter ^slicing.discriminator.path = "extension[performerFunction].valueCodeableConcept.coding.code"
* resultsInterpreter ^slicing.rules = #open
* resultsInterpreter ^slicing.description = "Slice based on the type"
* resultsInterpreter ^slicing.ordered = false
* resultsInterpreter contains
  primaryReporter 0..* and
  secondaryReporter 0..*

* resultsInterpreter[primaryReporter].extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF
* resultsInterpreter[primaryReporter] only Reference(Practitioner)
* resultsInterpreter[primaryReporter].identifier only GeneralMedicalPractitionerCode or GeneralMedicalCouncilReferenceNumber
* resultsInterpreter[secondaryReporter].extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SPRF
* resultsInterpreter[secondaryReporter] only Reference(Practitioner)
* resultsInterpreter[secondaryReporter].identifier only GeneralMedicalPractitionerCode or GeneralMedicalCouncilReferenceNumber
