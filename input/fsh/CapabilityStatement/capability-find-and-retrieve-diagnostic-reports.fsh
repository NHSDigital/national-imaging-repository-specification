Instance: FindAndRetrieveImagingReports
InstanceOf: CapabilityStatement
Title: "Find and Retrieve Imaging Reports"
Usage: #definition
* description = """
This is a capture of requirements coming from this project.

Although this is classed here as a [Document Repository](ActorDefinition-DocumentRepository.html), it may often be implemented as a [Clinical Data Repository](ActorDefinition-ClinicalDataRepository.html) and so the actual API may be more expressive e.g. [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html#234441214-diagnostic-reports-option-search-parameters).
"""
* name = " FindAndRetrieveImagingReports"
* title = "Find and Retrieve Imaging Reports"
* status = #draft
* experimental = false
* date = "2024-04-20"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * security
    * description = "Recommend [ATNA/NHS England Audits](subdomain-audits.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) plus [SMART-on-FHIR](https://www.hl7.org/fhir/smart-app-launch/)"

* insert Resource(#DiagnosticReport, ImagingReport)
* insert WithSupportedProfile(https://fhir.hl7.org.uk/StructureDefinition/UKCore-DiagnosticReport)
* rest.resource[=]
  * documentation = """
   ### Read

  ```
  GET /DiagnosticReport/{id}
  ```

  #### Example

  ```
  GET /DiagnosticReport/ABCD
  ```

  Example API response:
  - [Imaging Report - Royal College of Radiologist](DiagnosticReport-DiagnosticReportRadiologyRCR.html)
  - [Imaging Report - NHS England Alpha Specification](DiagnosticReport-DiagnosticReportRadiologyPlatforms.html)

  ### Search

  ```
  GET /DiagnosticReport?{parameters}
  ```

  #### Example

  ```
  GET /DiagnosticReport?_id=ABCD
  ```

  Example response:
  - [Document Reference Search Results NRL](Bundle-NRLSearchDiagnosticReports.html)

  Implementers **SHALL** also conform to [UKCore-DocumentReference](https://simplifier.net/hl7fhirukcorer4/ukcore-documentreference) and conformance to all profiles **SHOULD** be tested via [FHIR Validation](https://hl7.org/fhir/R4/validation.html).

  """
* insert Interaction(#read)
* insert Interaction(#search-type)

* insert SearchParam(_id, #token)
* insert WithSearchParamDocumentation(logical identifier of resource)

