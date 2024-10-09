Instance: DiagnosticReportImagingReportNRL
InstanceOf: DiagnosticReport
Title: "Radiology DiagnosticReport based on National Imaging Registry Alpha Specification"



* identifier[+]
  * type = #Accession-Number
  * value = "Y05868.123456789"

* identifier[+]
  * type = #Version-Identifier
  * value = "1.0"


* status = #final
* category = $sct#16310003 "Ultrasound"

* code.coding[+] = $sct#371525003 "Clinical procedure report (record artifact)"

* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"
* subject.display = "Richard SMITH"

* issued = "2023-09-07T11:45:41+11:00"

* performer[+]
  * identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
  * identifier.value = "RR8"
  * display = "LEEDS TEACHING HOSPITALS NHS TRUST"

* resultsInterpreter[+]
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"

* conclusion = "Normal - no action"
