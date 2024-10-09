Instance: FindingReportsAndImagesIHE
InstanceOf: ExampleScenario
Title:       "Finding Imaging Reports and Images - Federated (IHE)"
Description: """

New method of populating NRL from IHE XDS or like systems


"""
Usage: #definition

* status = #draft
* name = "FindingImagingReportsStudiesAndImagesIHE"

* insert ActorEntity(user, "Document Consumer",         [[The Document Consumer Actor queries for documents meeting certain criteria, and may retrieve selected documents.]])
* insert ActorEntity(xds, "Document Registry", [[The Document Registry Actor maintains metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer actors about documents meeting specific criteria.]])
* insert ActorEntity(docs, "Document Repository",         [[The Document Repository is responsible for both the persistent storage of these documents (e.g. Imaging Report)]])
* insert ActorEntity(image, "Imaging Repository",         [[The Imaging Repository is responsible for both the persistent storage of DICOM Images and Imaging Studies, these may also contain Imaging Reports. This is also known as a PACS.]])

* insert Instance_Empty(IHESearchDocumentEntries,  Bundle,   "Search for Documents", [[ ]])
* insert InstanceVersion(1, "Search Results", MHDSearchResultsDocuments , )

* insert Instance_Empty(IHEViewDiagnosticReport,  DiagnosticReport,   "Retrieve Diagnostic Report", [[ ]])
* insert InstanceVersion(1, "Retrieve Diagnostic Report", DiagnosticReportImagingReportRCR , )

* insert Instance_Empty(IHERetrieveImagingStudy,  Binary,   "Retrieve ImagingStudy ", [[ DICOM KOS ]])

* insert Instance_Empty(IHERetrieveImage,  Binary,  "Retrieve Image", [[ DICOM Image]])


* process[+]
  * title = "Find imaging studies and reports"
  * insert ProcessSearch(1, "Search for Documents", user, xds,, IHESearchDocumentEntries , [[ See [Finding and Retrieving Document Entries (IHE MHD)](CapabilityStatement-FindDocumentsMHD.html) for API base contract ]])
* process[+]
  * title = "Retrieve selected imaging report"
  * insert ProcessRead(1, "Retrieve Imaging Report", user, docs,, IHEViewDiagnosticReport , [[ See [Find and Retrieve Imaging Reports](CapabilityStatement-FindAndRetrieveImagingReports.html) for API overview ]])
* process[+]
  * title = "Retrieve selected imaging study"
  * insert ProcessRead(1, "Retrieve Imaging Study", user, image,, IHERetrieveImagingStudy , [[ See [Retrieve Imaging Study](CapabilityStatement-RetrieveImagingStudy.html) for API overview ]])
* process[+]
  * title = "Retrieve selected image"
  * insert ProcessRead(1, "Retrieve Image", user, image,, IHERetrieveImage , [[ See [Retrieve Image Instances](CapabilityStatement-RetrieveImageInstances.html) for API overview  ]])

Instance: MHDSearchResultsDocuments
InstanceOf: Bundle
Title:       "Bundle - Document Reference Search Results MHD"

Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888]])
* insert EntryMatch(DocumentReference, DocumentReferenceImagingReportIHE)



