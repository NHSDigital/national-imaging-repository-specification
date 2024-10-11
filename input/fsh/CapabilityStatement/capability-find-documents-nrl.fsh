Instance: FindDocumentsNRL
InstanceOf: CapabilityStatement
Title: "Finding and Retrieving Document Entries NRL"
Usage: #definition
* description = """
This is a local version of

- [National Record Locator - FHIR API v3 - Retrieve document pointers (GET)](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer#get-/DocumentReference)
- [National Record Locator - FHIR API v3 - Get a single document pointer](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer#get-/DocumentReference/-id-)

for documentation purposes.

"""
* name = "FindDocumentsNRL"
* title = "Finding and Retrieving Document Entries NRL"
* status = #draft
* experimental = false
* date = "2024-04-20"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * security
    * description = "See NRL API Documentation"

* insert Resource(#DocumentReference, NRLDocumentReference)
* insert WithSupportedProfile(https://fhir.hl7.org.uk/StructureDefinition/UKCore-DocumentReference)
* rest.resource[=]
  * documentation = """
  ### Read

  ```
  GET /DocumentReference/{id}
  ```

  #### Example

  ```
  GET /DocumentReference/5678
  ```

  Example API response:

  - [DocumentReference NRL for Radiology](DocumentReference-DocumentReferenceRadiologyNRL.html)

  ### Search

  ```
  GET /DocumentReference?{parameters}
  ```

  #### Example

  ```
  GET /DocumentReference?subject:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888
  ```

  Example response:
  - [Document Reference Search Results NRL](Bundle-NRLSearchResultsDocuments.html)

  Implementers **SHALL** also conform to [UKCore-DocumentReference](https://simplifier.net/hl7fhirukcorer4/ukcore-documentreference) and conformance to all profiles **SHOULD** be tested via [FHIR Validation](https://hl7.org/fhir/R4/validation.html).


  """
* insert Interaction(#read)
* insert Interaction(#search-type)

* insert SearchParam(subject:identifier, #token)
* insert WithSearchParamDocumentation(An Identifier for Who/what is the subject of the document)

