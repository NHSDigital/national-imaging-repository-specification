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


* insert Instance_Empty(IHESearchDocumentEntries,  Binary,   "Search for Document Entries - Imaging studies and reports", [[ See [Finding and Retrieving Document Entries (IHE MHD)](CapabilityStatement-FindDocumentsMHD.html) for API base contract. E.g. \n```\nGET https://example.nhs.uk/FHIR/R4/DocumentReference?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888&category=http://snomed.info/sct|721981007,http://snomed.info/sct|4201000179104\n```\n\nThe equivalent in an IHE XDS environment is [Registry Stored Query [ITI-18]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18)\n\nNote: At present `category` and `type` which are common search parameters in IHE XDS, MHD and [HL7 IPA](https://build.fhir.org/ig/HL7/fhir-ipa/index.html), are not fully defined in [UKCore-DocumentReference](https://simplifier.net/hl7fhirukcorer4/ukcore-documentreference) for widespread English NHS use, the codes used in the examples are broadly based on the elaboration of [Document Entry](StructureDefinition-DocumentEntry.html) ]])

* insert Instance_Empty(IHESearchResultsDocumentEntries,  Bundle,   "Return Document Entry search results", [[   ]])
* insert InstanceVersion(1, "Search Results", MHDSearchResultsDocuments , )

* insert Instance_Empty(XCAQuery, Binary,   "XCA Query", [[ Example Response [AdHocQueryRequest XML](AdHocQueryRequest.xml) \n\n See [IHE Cross-Community Access (XCA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html) ]])
* insert Instance_Empty(XCAResponse, Binary,   "XCA Query Response", [[ Example Response [AdHocQueryReponse XML](AdHocQueryReponse.xml)  ]])

* insert Instance_Empty(IHEReadDiagnosticReport,  Binary,   "Read DiagnosticReport",    [[ See [Find and Retrieve Imaging Reports](CapabilityStatement-FindAndRetrieveImagingReports.html) for API overview. E.g. \n```\nGET https://example.nhs.uk/FHIR/R4//DiagnosticReport/ABCD\n```\n \n\nThe equivalent in an IHE XDS environment is [Retrieve Document Set [ITI-43]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html#3.43) ]])
* insert Instance_Empty(IHEViewDiagnosticReport,  DiagnosticReport,   "Return DiagnosticReport", [[  ]])
* insert InstanceVersion(1, "Retrieve Diagnostic Report", DiagnosticReportImagingReportRCR , )

* insert Instance_Empty(IHEReadImagingStudy,        Binary,   "Read ImagingStudy" ,             [[[IHE WADO Retrieve (WADO-RS)](https://wiki.ihe.net/index.php/Web-based_Image_Access). See also [Retrieve Imaging Study](CapabilityStatement-RetrieveImagingStudy.html) for API overview ]])
* insert Instance_Empty(IHERetrieveImagingStudy,    Binary,   "Return ImagingStudy",            [[[DICOM Key Object Selection (KOS)](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/sup59.pdf) is a manifest, which includes references to images which are used to find and retrieve the DICOM Image Instance ]])

* insert Instance_Empty(IHEReadImageInstance,       Binary,  "Read Image Instance",            [[[IHE WADO Retrieve (WADO-RS)](https://wiki.ihe.net/index.php/Web-based_Image_Access). See also [Retrieve Image Instances](CapabilityStatement-RetrieveImageInstances.html) for API overview ]])
* insert Instance_Empty(IHERetrieveImage,           Binary,  "Return Image Instance",           [[DICOM Image Instance]])


* process[+]
  * title = "Query for patient image and/or report"
  * description = "IHE XCA implements an [Aggregator](https://www.enterpriseintegrationpatterns.com/patterns/conversation/Aggregator.html) pattern. Each **Responding Gateway** is asked to same query that the **Document Registry** originally received, in our example this is HL7 FHIR RESTful query (this is also IHE MHD - [Find Document References ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html)) and this has been converted to IHE XML as an `AdHocQueryRequest`. [Document Entry](StructureDefinition-DocumentEntry.html) is a FHIR DocumentReference profile based on the NHS Data Dictionary definitions contained in [IHE Europe - Metadata for exchange medical documents and images](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf), this also contains mappings between IHE XDS Document Entry and IHE MHD/HL7 FHIR DocumentReference."
  * step[+]
    * process[+]
      * title = "Search for Document Entries - Imaging studies and reports"
      * insert ProcessSearch(1, "Search for Document Entires", user, xds, IHESearchDocumentEntries,  , [[  ]])
  * step[+]
    * process[+]
      * title = "For each Network/Gateway - Search for Document Entries via IHE XCA Cross-Community Access (XCA)"
      * insert ProcessSearch(1, "Search for Document Entries in other networks", xds, xca, XCAQuery, XCAResponse  , [[  ]])
  * step[+]
    * process[+]
      * title = "Aggregate and Return Search Results - Imaging studies and reports"
      * insert ProcessSearch(1, "Return Document Entry search results", xds, user,, IHESearchResultsDocumentEntries , [[  ]])
* process[+]
  * title = "Option - Retrieve selected imaging report"
  * description = "This is an optional step. The **Document Consumer** may choose to retrieve the **Imaging Report**. At present this is a [Royal College of Radiologists HL7 ORU](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf) converted to a FHIR DiagnosticReport profile as [Imaging Report](StructureDefinition-ImagingReport.html), this also contains mappings between HL7 ORU and FHIR DiagnosticReport. Other options are being discussed by HL7 Europe such as a [EU Medical imaging studies and reports](https://health.ec.europa.eu/document/download/0079ad26-8f8f-435b-9472-3cd8625f4220_en?filename=ehn_mi_guidelines_en.pdf) which is likely to be a derivative of [HL7 IPS](https://build.fhir.org/ig/HL7/fhir-ips/index.html), like the [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/)."
  * insert ProcessRead(1, "Retrieve Imaging Report", user, docs,IHEReadDiagnosticReport, IHEViewDiagnosticReport , [[  ]])
* process[+]
  * title = "Option - Retrieve selected imaging study"
  * description = "This is an optional step. The **Document Consumer** may choose to retrieve the Imaging Study. At present this is a [DICOM KOS](https://dicom.nema.org/dicom/supps/sup59_lb.pdf) which contains DICOM modalities to used for retrieval of the Image Instances. Other options include using FHIR ImagingStudy which is a FHIR version of the DICOM KOS."
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



