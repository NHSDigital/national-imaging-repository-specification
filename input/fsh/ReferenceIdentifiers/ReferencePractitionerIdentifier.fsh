Profile:        ReferencePractitionerIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Reference
Id:             practitioner-identifier
Title:          "Practitioner Identifier"
Description:     """

NHS Data Dictionary [CONSULTANT_CODE](https://www.datadictionary.nhs.uk/data_elements/consultant_code.html)
and [GENERAL MEDICAL PRACTITIONER PPD CODE](https://www.datadictionary.nhs.uk/attributes/general_medical_practitioner_ppd_code.html)

Note: this needs to be reviewed

| FHIR identifier                                | Format           | Description                                                                                                                                                                                                     |
|------------------------------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `https://fhir.hl7.org.uk/Id/gmp-number`        | G[1234589]NNNNNN | General Medical Practitioner Code [GENERAL MEDICAL PRACTITIONER PPD CODE](https://datadictionary.nhs.uk/attributes/general_medical_practitioner_ppd_code.html). Formerly called GP General National Code (GNC). |
| `https://fhir.hl7.org.uk/Id/gmc-number`        | CNNNNNNN         | General Medical Council Code [CONSULTANT_CODE](https://datadictionary.nhs.uk/attributes/consultant_code.html)                                                                                                   |
| `https://fhir.hl7.org.uk/Id/nmc-number`        | NNANNNNA         | Nursing and Midwifery Council Code                                                                                                                                                                              |
| `https://fhir.hl7.org.uk/Id/gphc-number`       | NNNNNNN          | General Pharmaceutical Council Code                                                                                                                                                                             |
| `https://fhir.hl7.org.uk/Id/hcpc-number`       | AANNNNNN     | Health and Care Professional Council Code                                                                                                                                                                       |

"""

* type = "Practitioner"
* identifier 1..1
* identifier.system 1..1
* identifier.value 1..1
