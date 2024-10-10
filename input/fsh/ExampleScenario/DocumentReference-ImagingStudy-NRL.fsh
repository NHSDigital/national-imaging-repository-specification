Instance: DocumentReferenceImagingStudyNRL
InstanceOf: NRLDocumentReference
Title: "DocumentReference NRL for a Imaging Study"
Description: "DocumentReference NRL for a Imaging Study"
Usage: #example

* status = #current
* type.coding[+] = https://nicip.nhs.uk#MAULR "MRA Upper limb Rt"

* identifier[+]
  * value = "Y05868.123456789"
  * type.text = "Accession-Number"

* category.coding[+] = $sct#721981007 "Diagnostic studies report"
* type.coding = $sct#418062002 "MRA upper limb artery"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"

* custodian.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* custodian.identifier.value = "RR8"
* custodian.display = "LEEDS TEACHING HOSPITALS NHS TRUST"

* content.attachment[+]
  * contentType = #application/dicom+json
  * url = "https://a-pacs-system.org.nhs.uk/some-path/wado-rs/studies/7a530b22-688e-4623-876f-48d0037007ba/metadata"
  * title = "Diagnostic Studies Report"
  * creation = "2023-10-22T09:31:45+00:00"
* content.format.code = #direct
* content.format.display = "Direct"





