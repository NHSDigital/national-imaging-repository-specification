Profile:        DocumentEntry
Parent:         https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Id:             DocumentEntry
Title:          "Document Entry"
Description:    """
Based on

 - [IHE Europe Metadata for exchange medical documents and images](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf)
 - [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html)

At present this is not based on [UK Core DocumentReference](https://simplifier.net/hl7fhirukcorer4/ukcore-documentreference) as this is analysis of enterprise entity models but will be at a later date.

 """

* identifier 1..* MS
* type from DocumentEntryType
* category from DocumentEntryClass
* context.facilityType from FacilityType
* context.practiceSetting from Specialty

* context.sourcePatientInfo.identifier only MedicalRecordNumber

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



