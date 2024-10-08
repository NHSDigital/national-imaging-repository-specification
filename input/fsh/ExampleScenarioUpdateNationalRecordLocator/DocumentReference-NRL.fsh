Instance: DocumentReferenceRadiologyNRL
InstanceOf: DocumentReference
Title: "DocumentReference NRL for Radiology"
Description: "Document Reference IHE - can be in either IHE XDS Document Entry or IHE MHD DocumentReference format"
Usage: #example

* status = #current
* type.coding[+] = https://nicip.nhs.uk#MAULR "MRA Upper limb Rt"

* identifier[+]
  * value = "Y05868.123456789"
  * type.text = "Accession-Number"

* category.coding[+] = $sct#721981007 "Diagnostic studies report"

* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"

* custodian.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* custodian.identifier.value = "RR8"
* custodian.display = "LEEDS TEACHING HOSPITALS NHS TRUST"

* content.attachment[+]
  * contentType = #application/fhir+json
  * url = "https://an-ris-system.org.nhs.uk/some-path/FHIR/R4/DiagnosticReport?_id=c9d0e5e3-ac48-4285-8f9c-af9b30d235f1"
  * title = "Diagnostic Studies Report"
  * creation = "2023-10-22T09:31:45+00:00"
* content.format.code = #apiplatform
* content.format.display = "API Platform"





