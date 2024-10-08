Instance: UpdateNationalRecordLocator
InstanceOf: ExampleScenario
Title:       "Update National Record Locator"
Description: """
New method of populating NRL from IHE XDS or like systems
"""
Usage: #definition

* status = #draft
* name = "PatientAuditRecord"

* insert ActorEntity(xds,  "Document Registry (IHE) ",[[IHE XDS, MHD or MHDS System]])
* insert ActorEntity(translation,  "Transformation Service",         [[Converts IHE Document Entry or IHE FHIR Document Reference to NRL version]])
* insert ActorEntity(nrl,  "Document Registry (NRL)",         [[NHS England National Record Locator]])

* process[+]
  * title = "Document Entry Update Feed"
* process[+]
  * title = "Transform IHE or FHIR to NRL"
* process[+]
  * title = "Update NRL"

