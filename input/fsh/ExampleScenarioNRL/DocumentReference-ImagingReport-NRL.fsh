Instance: DocumentReferenceImagingReportNRL
InstanceOf: NRLDocumentReference
Title: "DocumentReference NRL for a Imaging Report"
Description: "Document Reference NRL"
Usage: #example

* status = #current
* type.coding[+] = https://nicip.nhs.uk#MAULR "MRA Upper limb Rt"

* identifier[+]
  * value = "Y05868.123456789"
  * type.text = "Accession-Number"

* category.coding[+] = $sct#4201000179104 "Imaging report"


* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"

* custodian.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* custodian.identifier.value = "RR8"
* custodian.display = "LEEDS TEACHING HOSPITALS NHS TRUST"

* content.attachment[+]
  * contentType = #application/fhir+json
  * url = "https://example.nhs.uk/FHIR/R4/DocumentReference?_id=DiagnosticReportRadiologyPlatforms"
  * title = "Imaging Report"
  * creation = "2023-10-22T09:31:45+00:00"
* content.format.code = #apiplatform
* content.format.display = "API Platform"





