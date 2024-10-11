Instance: UpdateNationalRecordLocator
InstanceOf: ExampleScenario
Title:       "Update National Record Locator"
Description: """
New method of populating NRL from IHE XDS or like systems
"""
Usage: #definition

* status = #draft
* name = "UpdateNationalRecordLocator"

//* insert ActorEntity(docSource, "Document Source", [[The Document Source is the producer and publisher of Document Content to a Document Recipient.]])
* insert ActorEntity(docRecipient, "Document Recipient/Repository XDS", [[The **Document Recipient** receives documents and metadata sent by the Document Source. The [Document Repository](ActorDefinition-DocumentRepository.html) is responsible for both the persistent storage of these documents as well as for their registration with the appropriate Document Registry. It assigns a uniqueId to documents for subsequent retrieval by a Document Consumer. ]])
//* insert ActorEntity(docRegistry, "Document Registry - IHE XDS/MHD", [[The [Document Registry](ActorDefinition-DocumentRegistry.html) maintains metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer Actors about documents meeting specific criteria. It also enforces some healthcare specific technical policies at the time of document registration.]])
* insert ActorEntity(translation,  "Transformation Service",         [[This provides conversion between the different data models used in each [context](https://martinfowler.com/bliki/BoundedContext.html). This may include filtering events, code conversions - concept mapping, data model mapping, removing elements from the model, etc.]])
* insert ActorEntity(nrl,  "Document Registry - NHS England NRL",         [[NHS England National Record Locator, a [Document Registry](ActorDefinition-DocumentRegistry.html) ]])

* insert Instance_Empty(IHEStoreDocument, Bundle,   "IHE MHD ITI-65 minimal document metadata", [[ [IHE MHD - Provide Document Bundle [ITI-65] minimal document metadata](https://profiles.ihe.net/ITI/MHD/ITI-65.html)  ]])
* insert InstanceVersion(1, "Bundle", IHETransactionBundle,  )

* insert Instance_Empty(IHETransactionFeed, Bundle, "Event Feed", [[ Feed type is not specified, this is for illustration purposes. ITI-65 generally contains the actual documents, so [IHE DSUBm - Resource Notify [ITI-112]](https://profiles.ihe.net/ITI/DSUBm/ITI-112.html) or  [IHE Document Metadata Subscription (DSUB)](https://profiles.ihe.net/ITI/TF/Volume1/ch-26.html) may be more suitable. ]])

* insert Instance_Empty(NRLTransactionFeed, Bundle,   "NRL version of IHE ITI-65", [[ This is a [FHIR Transaction](https://hl7.org/fhir/R4/http.html#transaction) version of [NRL FHIR API - Create document pointers with a specific id](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer#put-/DocumentReference). It has been designed with ITI-65 minimal metadata compatability in mind, but does not containing a List/SubmissionSet, a document (Binary) and neither an embedded document in the DocumentReference.  ]])
* insert InstanceVersion(1, "Bundle", NRLTransactionBundle,  )

* insert Instance_Empty(NRLRegisterDocument, DocumentReference,  "Register Document Entry", [[  ]])
* insert InstanceVersion(1, "DocumentReference", DocumentReferenceImagingReportIHE ,  )

/*
* process[+]
  * title = "Store Document (XDS Provide and Register)"
  * insert ProcessCreate(1, "IHE MHD Provide Document Bundle",  docSource, docRecipient, IHEStoreDocument, ,         [[ ]])
* process[+]
  * title = "Update Document Registry (XDS Register Document Set)"
  * insert ProcessCreate(1, "Update Document Registry",  docRecipient, docRegistry, NRLRegisterDocument, ,         [[  ]])
*/
* process[+]
  * title = "Document Entry Event Feed"
  * insert ProcessCreateEvent(1, "Event Feed e.g. IHE DSUBm Resource Notify",  docRecipient, translation, IHETransactionFeed, ,         [[  ]])
* process[+]
  * title = "Update NRL"
  * insert ProcessCreate(1, "NRL Transaction Feed",  translation, nrl, NRLTransactionFeed, ,         [[  ]])

Instance: ListExample
InstanceOf: List
* status = #current
* mode = #working
* entry[+].item.reference = Canonical(DocumentReferenceImagingReportIHE)

Instance: IHETransactionBundle
InstanceOf: Bundle
Title:       "IHE MHD Provide Document Bundle Example"
Description:  """
Example of IHE MHD [Provide Document Bundle [ITI-65]](https://profiles.ihe.net/ITI/MHD/4.2.1/ITI-65.html) [minimal metadata](https://profiles.ihe.net/ITI/MHD/4.2.1/StructureDefinition-IHE.MHD.Minimal.ProvideBundle.html).
This is a FHIR Transaction Bundle containing a DocumentReference for an Imaging Stufy (which is referenced via a url/pointer) to the study) and a Document SubmissionSet (FHIR List)
`POST https://example.nhs.uk/FHIR/R4/`
"""
Usage: #example
* insert TransactionBundle("2023-10-22T09:31:45+00:00")
* insert AddTransactionEntry(DocumentReference, DocumentReferenceImagingStudyMinimalMetadata, "DocumentReference")
* insert AddTransactionEntry(List, ListExample,"List")


Instance: NRLTransactionBundle
InstanceOf: Bundle
Title:       "NRL Version of the transaction Bundle"
Description: """
Example sending of a FHIR Transaction Bundle containing a DocumentReference for an Imaging Report

`POST https://example.nhs.uk/FHIR/R4/`
"""
Usage: #example
* insert TransactionBundle("2023-10-22T09:31:45+00:00")
* insert AddTransactionEntry(DocumentReference, DocumentReferenceImagingReportNRL, "DocumentReference")

