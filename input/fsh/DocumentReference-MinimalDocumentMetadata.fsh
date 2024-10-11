Profile:        DocumentReferenceMinimalDocumentMetadata
Parent:         https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Id:             DocumentReferenceMinimalDocumentMetadata
Title:          "DocumentReference Minimal Document Metadata"
Description:    """

See [IHE MHD Minimal DocumentReference](https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference)

Documentation only at present - is not currently required in the project.
 """

* identifier 1..* MS
* type from DocumentEntryType
* category from DocumentEntryClass
* context.facilityType from FacilityType
* context.practiceSetting from Specialty

* context.related 1..*

* context.related ^slicing.discriminator.type = #pattern
* context.related ^slicing.discriminator.path = "type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type"
* context.related ^slicing.ordered = false

* context.related contains
  accessionNumber 1..1 MS
* context.related[accessionNumber] only Reference(ServiceRequest)
* context.related[accessionNumber].type 1..1 MS
* context.related[accessionNumber].type = "ServiceRequest"
* context.related[accessionNumber].identifier 1..1
* context.related[accessionNumber].identifier only AccessionNumber

* subject 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* author only Reference(Organization or Practitioner)
* author.identifier only GeneralMedicalPractitionerCode or GeneralMedicalCouncilReferenceNumber or OrganisationCode



