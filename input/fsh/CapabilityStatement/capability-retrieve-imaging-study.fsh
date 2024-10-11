Instance: RetrieveImagingStudy
InstanceOf: CapabilityStatement
Title: "Retrieve Imaging Study"
Usage: #definition
* description = """
This is a capture of requirements coming from this project.

The actual API is:

- [DICOM Retrieve (WADO-RS)](https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri)
- [IHE Retrieve (WADO-RS)](https://wiki.ihe.net/index.php/Web-based_Image_Access)
- [IHE Radiology (RAD) Technical Framework](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf)

"""
* name = "RetrieveImagingStudy"
* title = "Retrieve Imaging Study"
* status = #draft
* experimental = false
* date = "2024-04-20"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/dicom+json
* rest
  * mode = #server
  * security
    * description = "Recommend [ATNA/NHS England Audits](subdomain-audits.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) plus [SMART-on-FHIR](https://www.hl7.org/fhir/smart-app-launch/)"

* insert Resource(#Binary, Binary)

* rest.resource[=]
  * documentation = """
   ### Read
   This use of the FHIR Binary resource is not intended here and this is only for documentation purposes.

  ```
  GET /{url}
  ```

  #### Example

  TODO
  """
* insert Interaction(#read)



