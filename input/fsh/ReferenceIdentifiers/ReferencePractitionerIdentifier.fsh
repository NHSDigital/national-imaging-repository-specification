Profile:        ReferencePractitionerIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Reference
Id:             practitioner-identifier
Title:          "Practitioner Identifier"
Description:     """

NHS Data Dictionary [CONSULTANT_CODE](https://www.datadictionary.nhs.uk/data_elements/consultant_code.html)
and [GENERAL MEDICAL PRACTITIONER PPD CODE](https://www.datadictionary.nhs.uk/attributes/general_medical_practitioner_ppd_code.html)
"""

* type = "Practitioner"
* identifier 1..1
* identifier.system 1..1
* identifier.value 1..1

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #closed
* identifier contains
  gmp-number 0..1 and
  gmc-number 0..1 and
  nmc-number 0..1 and
  gphc-number 0..1 and
  hcpc-number 0..1 and
  din-number 0..1 and
  sds-user-id 0..1 and
  gmc-reference-number 0..1 and
  professional-code 0..1

* identifier[gmp-number].system = "https://fhir.hl7.org.uk/Id/gmp-number"
* identifier[gmp-number] ^short = "General Medical Practitioner Code [GENERAL MEDICAL PRACTITIONER PPD CODE](https://www.datadictionary.nhs.uk/attributes/general_medical_practitioner_ppd_code.html). Formerly called GP General National Code (GNC)."
* identifier[gmc-number].system = "https://fhir.hl7.org.uk/Id/gmc-number"
* identifier[gmc-number] ^short = "General Medical Council Code [CONSULTANT_CODE](https://www.datadictionary.nhs.uk/attributes/consultant_code.html)"
* identifier[nmc-number].system = "https://fhir.hl7.org.uk/Id/nmc-number"
* identifier[nmc-number] ^short = "Nursing and Midwifery Council Code"
* identifier[gphc-number].system = "https://fhir.hl7.org.uk/Id/gphc-number"
* identifier[gphc-number] ^short = "General Pharmaceutical Council Code"
* identifier[hcpc-number].system = "https://fhir.hl7.org.uk/Id/hcpc-number"
* identifier[hcpc-number] ^short = "Health and Care Professional Council Code"
* identifier[din-number].system = "https://fhir.hl7.org.uk/Id/din-number"
* identifier[din-number] ^short = "[DOCTOR INDEX NUMBER](https://www.datadictionary.nhs.uk/attributes/doctor_index_number.html)"
* identifier[sds-user-id].system = "https://fhir.nhs.uk/Id/sds-user-id"
* identifier[sds-user-id] ^short = "SDS User ID. For NHS England services compatibility only"
* identifier[gmc-reference-number].system = "https://fhir.nhs.uk/Id/gmc-reference-number"
* identifier[gmc-reference-number] ^short = "[GMC Reference Number](https://www.datadictionary.nhs.uk/attributes/general_medical_council_reference_number.html)"
* identifier[professional-code].system = "https://fhir.hl7.org.uk/Id/professional-code"
* identifier[professional-code] ^short = "Use when GMC or GMP distinction is unclear. Use correct system when possible"
