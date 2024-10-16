Instance: FindingImagingReportsStudiesAndImagesCentralRegistry
InstanceOf: ExampleScenario
Title:      "Finding Imaging Reports and Images - Central Registry (NRL)"
Description: """
New method of populating NRL from IHE XDS or like systems
"""
Usage: #definition

* status = #draft
* name = "FindingImagingReportsStudiesAndImagesCentralRegistry"

* insert ActorEntity(user,  "Document Consumer",   [[The [Document Consumer](ActorDefinition-DocumentConsumer.html) Actor queries for documents meeting certain criteria, and may retrieve selected documents.]])
* insert ActorEntity(xds,  "Document Registry", [[The [Document Registry](ActorDefinition-DocumentRegistry.html) Actor maintains metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer actors about documents meeting specific criteria.]])
* insert ActorEntity(docs,  "Document Repository",   [[The [Document Repository](ActorDefinition-DocumentRepository.html) is responsible for both the persistent storage of these documents (e.g. Imaging Report)]])
* insert ActorEntity(image,  "Imaging Repository",   [[The [Imaging Repository](ActorDefinition-ImagingRepository.html) is responsible for both the persistent storage of DICOM Images and Imaging Studies, these may also contain Imaging Reports. This is also known as a PACS.]])

* insert Instance_Empty(NRLSearchDocumentEntries,  Binary,   "Query for Document Entries", [[ See [Finding and Retrieving Document Entries (NRL)](CapabilityStatement-FindDocumentsNRL.html) for API base contract. E.g. \n```\nGET https://example.nhs.uk/FHIR/R4/DocumentReference?subject:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888\n```\n ]])
* insert Instance_Empty(NRLReturnDocumentEntries,  Bundle,   "Return Document Entry results", [[  ]])
* insert InstanceVersion(1, "Search Results NRL", NRLSearchResultsDocuments , )

* insert Instance_Empty(NRLSearchDiagnosticReports,  Binary,   "Query for DiagnosticReport", [[ See [Find and Retrieve Imaging Reports](CapabilityStatement-FindAndRetrieveImagingReports.html) for API base contract. E.g. \n```\nGET https://example.nhs.uk/FHIR/R4/DiagnosticReport?_id=ABCD\n```\n ]])
* insert Instance_Empty(NRLReturnDiagnosticReports,  Bundle,   "Return DiagnosticReport results", [[  ]])
* insert InstanceVersion(1, "Search Diagnostic Report by _id ", NRLSearchDiagnosticReports , )

* insert Instance_Empty(NRLRetrieveImagingStudy,        Binary,   "Read ImagingStudy" ,             [[See [Retrieve Imaging Study](CapabilityStatement-RetrieveImagingStudy.html) for API overview ]])
* insert Instance_Empty(NRLRetrieveImagingStudyResult,  Binary,   "Return Imaging Study", [[ DICOM KOS ]])

* insert Instance_Empty(NRLRetrieveImage,       Binary,   "Read Image Instance",            [[See [Retrieve Image Instances](CapabilityStatement-RetrieveImageInstances.html) for API overview ]])
* insert Instance_Empty(NRLRetrieveImageResult,  Binary,   "Return Image", [[ DICOM Image Instance ]])


* process[+]
  * title = "Query patient image and/or report"
  * insert ProcessSearch(1, "Search for Documents", user, xds, NRLSearchDocumentEntries , NRLReturnDocumentEntries, [[ ]])
* process[+]
  * title = "Option - Retrieve selected imaging report"
  * description = "This is an optional step. The **Document Consumer** may choose to retrieve the **Imaging Report**. At present this is a [Royal College of Radiologists HL7 ORU](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf) converted to a FHIR DiagnosticReport profile as [Imaging Report](StructureDefinition-ImagingReport.html), this also contains mappings between HL7 ORU and FHIR DiagnosticReport. \n\n Other options are being discussed by HL7 Europe such as a [EU Medical imaging studies and reports](https://health.ec.europa.eu/document/download/0079ad26-8f8f-435b-9472-3cd8625f4220_en?filename=ehn_mi_guidelines_en.pdf) which is likely to be a derivative of [HL7 IPS](https://build.fhir.org/ig/HL7/fhir-ips/index.html), like the [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/)."
  * insert ProcessSearch(1, "Retrieve Imaging Report by searching on a _id ", user, docs, NRLSearchDiagnosticReports, NRLReturnDiagnosticReports , [[  ]])
* process[+]
  * title = "Option - Retrieve selected imaging study"
  * description = "This is an optional step. The **Document Consumer** may choose to retrieve the Imaging Study. At present this is a [DICOM KOS](https://dicom.nema.org/dicom/supps/sup59_lb.pdf) which contains DICOM modalities to used for retrieval of the Image Instances. \n\nOther options include using FHIR ImagingStudy which is a FHIR version of the DICOM KOS."
  * insert ProcessRead(1, "Retrieve Imaging Study", user, image, NRLRetrieveImagingStudy , NRLRetrieveImagingStudyResult , [[  ]])
  * step[+]
    * process[+]
      * title = "Retrieve selected image (optional)"
      * insert ProcessRead(1, "Retrieve Image", user, image, NRLRetrieveImage, NRLRetrieveImageResult , [[  ]])



Instance: NRLSearchResultsDocuments
InstanceOf: Bundle
Title:   "Bundle - Document Reference Search Results NRL"
Description: """
Example search results for patient with a NHS Number: 9912003888

`GET https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888]])
* insert EntryMatch(DocumentReference, DocumentReferenceImagingReportNRL)
* insert EntryMatch(DocumentReference, DocumentReferenceImagingStudyNRL)



Instance: NRLSearchDiagnosticReports
InstanceOf: Bundle
Title:   "Bundle - DiagnosticReport Search Results NRL"
Description: """
Example search results for Imaging Report with an id of ABCD

`GET https://example.nhs.uk/FHIR/R4/DiagnosticReport?_id=ABCD`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/DiagnosticReport?_id=ABCD]])
* insert EntryMatch(DiagnosticReport, DiagnosticReportImagingReportNRL)

