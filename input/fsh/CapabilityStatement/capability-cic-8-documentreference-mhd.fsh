Instance: NHSE-CIC-8-MHD
InstanceOf: CapabilityStatement
Title: "Finding and Retrieving Document Entries"
Usage: #definition
* description = """
Finding and Retrieving Document Entries

Based on[IHE Mobile access to Health Documents (MHD) - Find Document References ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html)
"""
* name = "NHSE-CIC-8-MHD"
* title = "Finding and Retrieving Document Entries"
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
    * description = "Recommend [ATNA/NHS England Audits](subdomain-audits.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) plus [SMART-on-FHIR](https://www.hl7.org/fhir/smart-app-launch/)"

* insert Resource(#DocumentReference, DocumentEntry)
* insert WithSupportedProfile(https://fhir.hl7.org.uk/StructureDefinition/UKCore-DocumentReference)
* rest.resource[=]
  * documentation = "`GET /DocumentReference/{id}` \n\n `GET /DocumentReference?{parameters}` \n\nImplementers **SHALL** also conform to [UKCore-DocumentReference](https://simplifier.net/hl7fhirukcorer4/ukcore-documentreference) and conformance to all profiles **SHOULD** be tested via [FHIR Validation](https://hl7.org/fhir/R4/validation.html). "
* insert Interaction(#read)
* insert Interaction(#search-type)

* insert SearchParam(_id, #token)
* insert WithSearchParamDocumentation(Logical id of this artifact)

* insert SearchParam(_lastupdated, #date)
* insert WithSearchParamDocumentation(When the resource version last changed)

* insert SearchParam(author.given, #string)
* insert WithSearchParamDocumentation()

* insert SearchParam(author.family, #string)
* insert WithSearchParamDocumentation()

* insert SearchParam(category, #token)
* insert WithSearchParamDocumentation(Categorization of document)

* insert SearchParam(creation, #date)
* insert WithSearchParamDocumentation(When this document was created)
* insert WithSearchParamDefinition(https://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation)

* insert SearchParam(date, #date)
* insert WithSearchParamDocumentation(When this document reference was created)

* insert SearchParam(event, #token)
* insert WithSearchParamDocumentation(Main clinical acts documented)

* insert SearchParam(facility, #token)
* insert WithSearchParamDocumentation(Kind of facility where patient was seen)

* insert SearchParam(format, #token)
* insert WithSearchParamDocumentation(Format/content rules for the document)

* insert SearchParam(identifier, #token)
* insert WithSearchParamDocumentation(The identifier for this DocumentReference)

* insert SearchParam(patient, #reference)
* insert WithSearchParamDocumentation(Who/what is the subject of the document)

* insert SearchParam(patient.identifier, #reference)
* insert WithSearchParamDocumentation(An Identifier for Who/what is the subject of the document)

* insert SearchParam(period, #date)
* insert WithSearchParamDocumentation(Time of service that is being documented)

* insert SearchParam(related, #reference)
* insert WithSearchParamDocumentation(Related Resource)

* insert SearchParam(security-label, #token)
* insert WithSearchParamDocumentation(Document security-tags)

* insert SearchParam(setting, #token)
* insert WithSearchParamDocumentation(Additional details about where the content was created - e.g. clinical specialty)

* insert SearchParam(status, #token)
* insert WithSearchParamDocumentation(current | superseded | entered-in-error)

* insert SearchParam(type, #token)
* insert WithSearchParamDocumentation(Kind of document)
