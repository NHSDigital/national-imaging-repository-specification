Instance: FindingReportsAndImagesNRL
InstanceOf: ExampleScenario
Title:      "Finding Imaging Reports and Images - Central Repository (NRL)"
Description: """
New method of populating NRL from IHE XDS or like systems
"""
Usage: #definition

* status = #draft
* name = "FindingImagingReportsStudiesAndImagesNRL"

* insert ActorEntity(user,  "Document Consumer",         [[The Document Consumer Actor queries for documents meeting certain criteria, and may retrieve selected documents.]])
* insert ActorEntity(xds,  "Document Registry", [[The Document Registry Actor maintains metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer actors about documents meeting specific criteria.]])
* insert ActorEntity(docs,  "Document Repository",         [[The Document Repository is responsible for both the persistent storage of these documents (e.g. Imaging Report)]])
* insert ActorEntity(image,  "Imaging Repository",         [[The Imaging Repository is responsible for both the persistent storage of DICOM Images and Imaging Studies, these may also contain Imaging Reports. This is also known as a PACS.]])

* insert Instance_Empty(NRLSearchDocumentEntries,  Bundle,   "Search for Documents", [[ ]])
* insert InstanceVersion(1, "Search Results NRL", NRLSearchResultsDocuments , )

* insert Instance_Empty(NRLSearchDiagnosticReports,  Bundle,   "Retrieve DiagnosticReport", [[ ]])
* insert InstanceVersion(1, "Search Diagnostic Report by _id ", NRLSearchDiagnosticReports , )

* insert Instance_Empty(NRLRetrieveImagingStudy,  Binary,   "Retrieve Imaging Study", [[ DICOM KOS ]])

* insert Instance_Empty(NRLRetrieveImage,  Binary,   "Retrieve Image", [[ DICOM Image ]])


* process[+]
  * title = "Find imaging studies and reports"
  * insert ProcessSearch(1, "Search for Documents", user, xds,, NRLSearchDocumentEntries , [[ See [Finding and Retrieving Document Entries (NRL)](CapabilityStatement-FindDocumentsNRL.html) for API overview   ]])
* process[+]
  * title = "Retrieve selected imaging report (technically a search)"
  * insert ProcessSearch(1, "Retrieve Imaging Report by searching on a _id ", user, docs,, NRLSearchDiagnosticReports , [[ See [Find and Retrieve Imaging Reports](CapabilityStatement-FindAndRetrieveImagingReports.html) for API overview ]])
* process[+]
  * title = "Retrieve selected imaging study"
  * insert ProcessRead(1, "Retrieve Imaging Study", user, image,, NRLRetrieveImagingStudy , [[ See [Retrieve Imaging Study](CapabilityStatement-RetrieveImagingStudy.html) for API overview ]])
* process[+]
  * title = "Retrieve selected image"
  * insert ProcessRead(1, "Retrieve Image", user, image,, NRLRetrieveImage , [[ See [Retrieve Image Instances](CapabilityStatement-RetrieveImageInstances.html) for API overview ]])

Instance: NRLSearchResultsDocuments
InstanceOf: Bundle
Title:   "Bundle - Document Reference Search Results NRL"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888]])
* insert EntryMatch(DocumentReference, DocumentReferenceImagingReportNRL)

Instance: NRLSearchDiagnosticReports
InstanceOf: Bundle
Title:   "Bundle - DiagnosticReport Search Results NRL"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DiagnosticReport?_id=ABCD]])
* insert EntryMatch(DiagnosticReport, DiagnosticReportImagingReportNRL)
