Instance:  ClinicalDataRepository
InstanceOf: ActorDefinition
Title:   "Clinical Data Repository"
Usage:  #definition

* name = "ClinicalDataRepository"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
The Clinical Data Repository is responsible for the persistent storage of clinical data items (observations, conditions, immunisations, etc). E.g. PHR, EHR and EPR
"""
* documentation = """
Links to more detailed elaboration on the actors can be found in:

- [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/volume-1.html#1181-qedm-actors-transactions-and-content-modules) note IHE `Clinical Data Source` is renamed here to `Clinical Data Repository`

System examples include:
- [Electronic Patient Record(EPR) or Electronic Health Record(EHR)](https://en.wikipedia.org/wiki/Electronic_health_record)
- [Personal Health Record(PHR)](https://en.wikipedia.org/wiki/Personal_health_record)


"""
