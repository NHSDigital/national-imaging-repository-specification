Instance: DocumentReferenceImagingStudyIHE
InstanceOf: DocumentEntry
Title: "DocumentReference IHE for a Imaging Study"
Description: "DocumentReference IHE for a Imaging Study - can be also be in IHE XDS Document Entry format"
Usage: #example


* status = #current
* type.coding[+] = https://nicip.nhs.uk#MAULR "MRA Upper limb Rt"
* type.coding[+] = $sct#418062002 "MRA upper limb artery"

* identifier[+].value = "f3f7920b-3b91-4e3e-afdc-8791e2095fbe"
* masterIdentifier.system = "https://tools.ietf.org/html/rfc4122"
* masterIdentifier.value = "f3f7920b-3b91-4e3e-afdc-8791e2095fbe"

* category.coding[+] = $sct#721981007 "Diagnostic studies report"
//* category.coding[+] = $sct#113091000 "Magnetic resonance imaging (procedure)"

* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#NH
* subject.display = "Richard SMITH"

* custodian.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* custodian.identifier.value = "RR8"
* custodian.display = "LEEDS TEACHING HOSPITALS NHS TRUST"

* content.attachment[+]
  * contentType = #application/dicom+json
  * url = "https://a-pacs-system.org.nhs.uk/some-path/wado-rs/studies/7a530b22-688e-4623-876f-48d0037007ba/metadata"
  * creation = "2023-10-22T09:31:45+00:00"
  * language = urn:ietf:bcp:47#en-GB
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:rad "Radiology Domain"

* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#U

* context.practiceSetting = https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode#810
* context.facilityType = #E02

* context.sourcePatientInfo.identifier.system = "https://fhir.leedsth.nhs.uk/Id/MR"
* context.sourcePatientInfo.identifier.value = "A123435"
* context.sourcePatientInfo.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* context.sourcePatientInfo.identifier.assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* context.sourcePatientInfo.identifier.assigner.identifier.value = "RR8"

* context.related[accessionNumber]
  * type = "ServiceRequest"
  * identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
  * identifier.system = "https://fhir.leedsth.nhs.uk/Id/AccessionNumber"
  * identifier.value = "123456789"
  * identifier.assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
  * identifier.assigner.identifier.value = "RR8"


