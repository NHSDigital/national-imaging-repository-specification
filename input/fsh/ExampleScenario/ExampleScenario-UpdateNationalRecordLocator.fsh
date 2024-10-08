Instance: UpdateNationalRecordLocator
InstanceOf: ExampleScenario
Title:       "Update National Record Locator"
Description: """
New method of populating NRL from IHE XDS or like systems
"""
Usage: #definition

* status = #draft
* name = "PatientAuditRecord"

* insert ActorEntity(xds,  "Document Registry - IHE ", [[IHE XDS, MHD or MHDS System]])
* insert ActorEntity(translation,  "Transformation Service",         [[Converts IHE Document Entry or IHE FHIR Document Reference to NRL version]])
* insert ActorEntity(nrl,  "Document Registry - NHS England NRL",         [[NHS England National Record Locator]])


* insert Instance_Empty(IHETransactionFeed, Bundle,   "IHE ITI-65", [[ This may be a [IHE DSUBm Resource Notify [ITI-112]](https://profiles.ihe.net/ITI/DSUBm/ITI-112.html), [IHE MHD - Provide Document Bundle [ITI-65] minimal document metadata](https://profiles.ihe.net/ITI/MHD/ITI-65.html) or similar [event-message](https://en.wikipedia.org/wiki/Event-driven_messaging). ]])
* insert InstanceVersion(1, "Bundle", IHETransactionBundle,  )

* insert Instance_Empty(NRLTransactionFeed, Bundle,   "NRL version of IHE ITI-65", [[  ]])
* insert InstanceVersion(1, "Bundle", NRLTransactionBundle,  )

* process[+]
  * title = "Document Entry Update Feed"
  * insert ProcessCreate(1, "IHE Transaction Feed",  xds, translation, IHETransactionFeed, ,         [[ This may also be a [IHE DSUBm Resource Notify [ITI-112]](https://profiles.ihe.net/ITI/DSUBm/ITI-112.html) or similar [event-messaging](https://en.wikipedia.org/wiki/Event-driven_messaging) ]])
* process[+]
  * title = "Update NRL"
  * insert ProcessCreate(1, "NRL Transaction Feed",  translation, nrl, NRLTransactionFeed, ,         [[ This is a [FHIR Transaction](https://hl7.org/fhir/R4/http.html#transaction) not containing a List/SubmissionSet, a document (Binary) and neither a document attached to the DocumentReference ]])


Instance: ListExample
InstanceOf: List
* status = #current
* mode = #working
* entry[+].item.reference = Canonical(DocumentReferenceRadiologyIHE)

Instance: IHETransactionBundle
InstanceOf: Bundle
Title:       "IHE MHD Provide Document Bundle Example"
Description:  """
IHE MHD [Provide Document Bundle [ITI-65]](https://profiles.ihe.net/ITI/MHD/4.2.1/ITI-65.html) [minimal metadata](https://profiles.ihe.net/ITI/MHD/4.2.1/StructureDefinition-IHE.MHD.Minimal.ProvideBundle.html) option
"""
Usage: #example
* insert TransactionBundle("2023-10-22T09:31:45+00:00")
* insert AddTransactionEntry(DocumentReference, DocumentReferenceRadiologyIHE, "DocumentReference")
* insert AddTransactionEntry(List, ListExample,"List")


Instance: NRLTransactionBundle
InstanceOf: Bundle
Title:       "NRL Version of the transaction Bundle"
Description:  ""
Usage: #example
* insert TransactionBundle("2023-10-22T09:31:45+00:00")
* insert AddTransactionEntry(DocumentReference, DocumentReferenceRadiologyNRL, "DocumentReference")

