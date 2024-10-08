Instance: FindingReportsAndImages
InstanceOf: ExampleScenario
Title:       "Finding Imaging Reports and Images"
Description: """

New method of populating NRL from IHE XDS or like systems



"""
Usage: #definition

* status = #draft
* name = "FindingImagingReportsStudiesAndImages"

* insert ActorEntity(user,  "Document Consumer",         [[The Document Consumer Actor queries for documents meeting certain criteria, and may retrieve selected documents.]])
* insert ActorEntity(xds,  "Document Registry", [[The Document Registry Actor maintains metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer actors about documents meeting specific criteria.]])
* insert ActorEntity(docs,  "Document Repository",         [[The Document Repository is responsible for both the persistent storage of these documents (e.g. Imaging Report)]])
* insert ActorEntity(image,  "Imaging Repository",         [[The Imaging Repository is responsible for both the persistent storage of DICOM Images and Imaging Studies, these may also contain Imaging Reports. This is also known as a PACS.]])


* insert Instance_Empty(NIRSearchDocumentEntries,  Bundle,   "Search for Documents", [[ ]])
* insert InstanceVersion(1, "Search Results IHE MHD", MHDSearchResultsDocuments , )
* insert InstanceVersion(1, "Search Results NRL", NRLSearchResultsDocuments , )

* insert Instance_Empty(NIRViewDiagnosticReport,  DiagnosticReport,   "View Diagnostic Report", [[ ]])
* insert InstanceVersion(1, "View Diagnostic Report IHE MHD version", DiagnosticReportRadiologyRCR , )

* insert Instance_Empty(NIRSearchDiagnosticReports,  Bundle,   "Search for DiagnosticReport", [[ ]])
* insert InstanceVersion(1, "Search Diagnostic Report NIR by _id ", MHDSearchResultsDiagnosticReports , )

* insert Instance_Empty(NIRRetrieveImagingStudy,  Binary,   "DICOM KOS", [[ ]])


* insert Instance_Empty(NIRRetrieveImage,  Binary,   "DICOM Image", [[ ]])


* process[+]
  * title = "Retrieve selected imaging studies and reports"
  * insert ProcessSearch(1, "Search for Documents", user, xds,, NIRSearchDocumentEntries , [[ For details see [IHE MHD - Find Document References [ITI-67]](https://profiles.ihe.net/ITI/MHD/ITI-67.html) and [National Record Locator - FHIR API v3 - Retrieve document pointers (GET)](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer#get-/DocumentReference)   ]])
* process[+]
  * title = "Retrieve selected imaging report IHE MHD version"
  * insert ProcessRead(1, "Retrieve Imaging Report", user, docs,, NIRSearchDocumentEntries , [[ ]])
* process[+]
  * title = "Retrieve selected imaging report NRL Version"
  * insert ProcessSearch(1, "Retrieve Imaging Report by searching on a _id ", user, docs,, NIRSearchDiagnosticReports , [[ ]])
* process[+]
  * title = "Retrieve selected imaging study"
  * insert ProcessRead(1, "Retrieve Imaging Study", user, image,, NIRRetrieveImagingStudy , [[ ]])
* process[+]
  * title = "Retrieve selected imaging studies and image"
  * insert ProcessRead(1, "Retrieve Image", user, image,, NIRRetrieveImage , [[ ]])

Instance: MHDSearchResultsDocuments
InstanceOf: Bundle
Title:       "Bundle 'Search Set' - Documents"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888]])
* insert EntryMatch(DocumentReference, DocumentReferenceRadiologyIHE)

Instance: MHDSearchResultsDiagnosticReports
InstanceOf: Bundle
Title:       "Bundle 'Search Set' - Diagnostic Reports"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?_id=DiagnosticReportRadiologyPlatforms]])
* insert EntryMatch(DiagnosticReport, DiagnosticReportRadiologyPlatforms)

Instance: NRLSearchResultsDocuments
InstanceOf: Bundle
Title:   "Bundle 'Search Set' - Documents"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888]])
* insert EntryMatch(DocumentReference, DocumentReferenceRadiologyNRL)
