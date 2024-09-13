Profile:        NRLDocumentReference
Parent:         http://hl7.org/fhir/StructureDefinition/DocumentReference
Id:             NRL-DocumentReference
Title:          "NRL DocumentReference"
Description:    """
Built from [National Record Locator - FHIR API v3 - Producer - Create new, or Supersede existing, document pointers](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer#post-/DocumentReference)
 """


* subject.identifier 1..1
* subject.identifier.system 1..1
* subject.identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
* subject.identifier.value 1..1

* custodian.identifier 1..1
* custodian.identifier.system 1..1
* custodian.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* custodian.identifier.value 1..1

* author.identifier 1..1
* author.identifier.system 1..1
* author.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* author.identifier.value 1..1

* category 1..*
* category.coding 1..1
* category.coding.system 1..1
* category.coding.system = "http://snomed.info/sct"
* category.coding.code  1..1

* type 1..1
* type.coding 1..1
* type.coding.system 1..1
* type.coding.system = "http://snomed.info/sct"
* type.coding.code  1..1

* content.format 1..1

* context.related ^slicing.discriminator.type = #pattern
* context.related ^slicing.discriminator.path = "identifier.system"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on identifier.slice"
* context.related ^slicing.ordered = false

* context.related contains
  asid 0..1

* context.related[asid].identifier 1..1
* context.related[asid].identifier.system = "https://fhir.nhs.uk/Id/nhsSpineASID"
* context.related[asid].identifier.value 1..1
