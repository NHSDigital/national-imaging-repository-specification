Instance:  DocumentRegistry
InstanceOf: ActorDefinition
Title:   "Document Registry"
Usage:  #definition

* name = "Document Registry"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
The Document Registry Actor maintains maintains a index of records held in `Document Repositories` and `Form Repositories`, the index metadata is called a Document Entry (or DocumentReference in FHIR)  metadata about each registered document in a document entry. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer actors about documents meeting specific criteria. E.g. XDS System, NRL and is also often found `Clinical Data Repositories`.
"""
* documentation = """
Links to more detailed elaboration on the actors can be found in:

- [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html)
- [IHE Cross-Enterprise Document Sharing (XDS.b)](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1)

"""
