Instance: FindingReportsAndImagesCentralRegistry
InstanceOf: ExampleScenario
Title:      "Finding Imaging Reports and Images - Central Registry (NRL)"
Description: """
New method of populating NRL from IHE XDS or like systems
"""
Usage: #definition

* status = #draft
* name = "FindingImagingReportsStudiesAndImagesCentralRegistry"

* insert ActorEntity(user,  "Document Consumer",         [[The Document Consumer Actor queries for documents meeting certain criteria, and may retrieve selected documents.]])
* insert ActorEntity(xds,  "Document Registry", [[The Document Registry Actor maintains metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer actors about documents meeting specific criteria.]])
* insert ActorEntity(docs,  "Document Repository",         [[The Document Repository is responsible for both the persistent storage of these documents (e.g. Imaging Report)]])
* insert ActorEntity(image,  "Imaging Repository",         [[The Imaging Repository is responsible for both the persistent storage of DICOM Images and Imaging Studies, these may also contain Imaging Reports. This is also known as a PACS.]])

* insert Instance_Empty(NRLSearchDocumentEntries,  Binary,   "Query for Document Entries", [[ See [Finding and Retrieving Document Entries (NRL)](CapabilityStatement-FindDocumentsNRL.html) for API base contract. E.g. `GET https://example.nhs.uk/FHIR/R4/DocumentReference?subject:identifier=https://fhir.nhs.uk/Id/nhs-number` ]])
* insert Instance_Empty(NRLReturnDocumentEntries,  Bundle,   "Search Results for Query for Document Entries", [[  ]])
* insert InstanceVersion(1, "Search Results NRL", NRLSearchResultsDocuments , )

* insert Instance_Empty(NRLSearchDiagnosticReports,  Binary,   "Query for DiagnosticReport", [[ See [Find and Retrieve Imaging Reports](CapabilityStatement-FindAndRetrieveImagingReports.html) for API base contract. E.g. `GET https://example.nhs.uk/FHIR/R4/DiagnosticReport?_id=ABCD` ]])
* insert Instance_Empty(NRLReturnDiagnosticReports,  Bundle,   "Return matching DiagnosticReport entries", [[  ]])
* insert InstanceVersion(1, "Search Diagnostic Report by _id ", NRLSearchDiagnosticReports , )

* insert Instance_Empty(NRLRetrieveImagingStudy,        Binary,   "Read ImagingStudy" ,             [[See [Retrieve Imaging Study](CapabilityStatement-RetrieveImagingStudy.html) for API overview ]])
* insert Instance_Empty(NRLRetrieveImagingStudyResult,  Binary,   "Retrieve Imaging Study", [[ DICOM KOS ]])

* insert Instance_Empty(NRLRetrieveImage,       Binary,   "Read Image Instance",            [[See [Retrieve Image Instances](CapabilityStatement-RetrieveImageInstances.html) for API overview ]])
* insert Instance_Empty(NRLRetrieveImageResult,  Binary,   "Retrieve Image", [[ DICOM Image Instance ]])


* process[+]
  * title = "Find imaging studies and reports"
  * insert ProcessSearch(1, "Search for Documents", user, xds, NRLSearchDocumentEntries , NRLReturnDocumentEntries, [[ ]])
* process[+]
  * title = "Option - Retrieve selected imaging report"
  * insert ProcessSearch(1, "Retrieve Imaging Report by searching on a _id ", user, docs, NRLSearchDiagnosticReports, NRLReturnDiagnosticReports , [[  ]])
* process[+]
  * title = "Option - Retrieve selected imaging study"
  * insert ProcessRead(1, "Retrieve Imaging Study", user, image, NRLRetrieveImagingStudy , NRLRetrieveImagingStudyResult , [[  ]])
  * step[+]
    * process[+]
      * title = "Retrieve selected image (optional)"
      * insert ProcessRead(1, "Retrieve Image", user, image, NRLRetrieveImage, NRLRetrieveImageResult , [[  ]])

Instance: NRLSearchResultsDocuments
InstanceOf: Bundle
Title:   "Bundle - Document Reference Search Results NRL"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888]])
* insert EntryMatch(DocumentReference, DocumentReferenceImagingReportNRL)
* insert EntryMatch(DocumentReference, DocumentReferenceImagingStudyNRL)

Instance: NRLSearchDiagnosticReports
InstanceOf: Bundle
Title:   "Bundle - DiagnosticReport Search Results NRL"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DiagnosticReport?_id=ABCD]])
* insert EntryMatch(DiagnosticReport, DiagnosticReportImagingReportNRL)

