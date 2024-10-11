Instance: FindingImagingReportsStudiesAndImagesFederated
InstanceOf: ExampleScenario
Title:       "Finding Imaging Reports and Images - Federated (IHE)"
Description: """

New method of populating NRL from IHE XDS or like systems


"""
Usage: #definition

* status = #draft
* name = "FindingImagingReportsStudiesAndImagesFederated"

* insert ActorEntity(user, "Document Consumer",         [[The [Document Consumer](ActorDefinition-DocumentConsumer.html) Actor queries for documents meeting certain criteria, and may retrieve selected documents.]])
* insert ActorEntity(xds, "Document Registry", [[The [Document Registry](ActorDefinition-DocumentRegistry.html) Actor maintains metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer actors about documents meeting specific criteria.]])
* insert ActorEntity(xca, "Responding Gateway", [[In NIR this is also known as **Imaging Network**. This is an infrastrcture service which enables federation.]])
* insert ActorEntity(docs, "Document Repository",         [[The [Document Repository](ActorDefinition-DocumentRepository.html) is responsible for both the persistent storage of these documents (e.g. Imaging Report)]])
* insert ActorEntity(image, "Imaging Repository",         [[The [Imaging Repository](ActorDefinition-ImagingRepository.html) is responsible for both the persistent storage of DICOM Images and Imaging Studies, these may also contain Imaging Reports. This is also known as a PACS.]])


* insert Instance_Empty(IHESearchDocumentEntries,  Binary,   "Query for Document Entries", [[ See [Finding and Retrieving Document Entries (IHE MHD)](CapabilityStatement-FindDocumentsMHD.html) for API base contract. E.g. `GET https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888&category=http://snomed.info/sct|721981007,http://snomed.info/sct|4201000179104`\n\nThe equivalent in an IHE XDS environment is [Registry Stored Query [ITI-18]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18)  ]])

* insert Instance_Empty(IHESearchResultsDocumentEntries,  Bundle,   "Return Search Results for Find Document Entries", [[   ]])
* insert InstanceVersion(1, "Search Results", MHDSearchResultsDocuments , )

* insert Instance_Empty(XCAQuery, Binary,   "XCA Queries", [[ See [IHE Cross-Community Access (XCA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html) ]])
* insert Instance_Empty(XCAResponse, Binary,   "XCA Queries Responses", [[  ]])

* insert Instance_Empty(IHEReadDiagnosticReport,  Binary,   "Read DiagnosticReport",    [[ See [Find and Retrieve Imaging Reports](CapabilityStatement-FindAndRetrieveImagingReports.html) for API overview. E.g. `GET https://example.nhs.uk/FHIR/R4//DiagnosticReport/ABCD`. \n\nThe equivalent in an IHE XDS environment is [Retrieve Document Set [ITI-43]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html#3.43) ]])
* insert Instance_Empty(IHEViewDiagnosticReport,  DiagnosticReport,   "Return DiagnosticReport", [[  ]])
* insert InstanceVersion(1, "Retrieve Diagnostic Report", DiagnosticReportImagingReportRCR , )

* insert Instance_Empty(IHEReadImagingStudy,        Binary,   "Read ImagingStudy" ,             [[[IHE WADO Retrieve (WADO-RS)](https://wiki.ihe.net/index.php/Web-based_Image_Access). See also [Retrieve Imaging Study](CapabilityStatement-RetrieveImagingStudy.html) for API overview ]])
* insert Instance_Empty(IHERetrieveImagingStudy,    Binary,   "Return ImagingStudy",            [[[DICOM Key Object Selection (KOS)](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/sup59.pdf) is a manifest, which includes references to images which are used to find and retrieve the DICOM Image Instance ]])

* insert Instance_Empty(IHEReadImageInstance,       Binary,  "Read Image Instance",            [[[IHE WADO Retrieve (WADO-RS)](https://wiki.ihe.net/index.php/Web-based_Image_Access). See also [Retrieve Image Instances](CapabilityStatement-RetrieveImageInstances.html) for API overview ]])
* insert Instance_Empty(IHERetrieveImage,           Binary,  "Return Image Instance",           [[DICOM Image Instance]])



* process[+]
  * title = "Find imaging studies and reports - Imaging studies and reports"
  * insert ProcessSearch(1, "Search for Document Entires", user, xds, IHESearchDocumentEntries,  , [[  ]])
* process[+]
  * title = "Perform Enterprise - Find imaging studies and reports"
  * insert ProcessSearch(1, "Search for Document Entries across the networks", xds, xca, XCAQuery, XCAResponse  , [[  ]])
* process[+]
  * title = "Aggregate and Return Search Results - Imaging studies and reports"
  * insert ProcessSearch(1, "Search for Documents Results", xds, user,, IHESearchResultsDocumentEntries , [[  ]])
* process[+]
  * title = "Option - Retrieve selected imaging report"
  * insert ProcessRead(1, "Retrieve Imaging Report", user, docs,IHEReadDiagnosticReport, IHEViewDiagnosticReport , [[  ]])
* process[+]
  * title = "Option - Retrieve selected imaging study"
  * insert ProcessRead(1, "Retrieve Imaging Study", user, image, IHEReadImagingStudy , IHERetrieveImagingStudy , [[  ]])
  * step[+]
    * process[+]
      * title = "Retrieve selected image - Optional"
      * insert ProcessRead(1, "Retrieve Image", user, image, IHEReadImageInstance, IHERetrieveImage , [[   ]])


Instance: MHDSearchResultsDocuments
InstanceOf: Bundle
Title:       "Bundle - Document Reference Search Results MHD"
Description: """
Example search results for patient with a NHS Number: 9912003888 who has Diagnostic studies reports and Imaging report

`GET https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888&category=http://snomed.info/sct|721981007,http://snomed.info/sct|4201000179104`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888&category=http://snomed.info/sct|721981007,http://snomed.info/sct|4201000179104]])
* insert EntryMatch(DocumentReference, DocumentReferenceImagingReportIHE)
* insert EntryMatch(DocumentReference, DocumentReferenceImagingStudyIHE)



