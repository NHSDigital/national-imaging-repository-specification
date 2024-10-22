Profile:        AccessionNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             accession-number
Title:          "Radiological Accession Number"
Description:     """

| Data Item | Standard | Data Type | Value |
|----------|-------|-------|-------|
| Radiological Accession Number | NHS Data Dictionary | | [RADIOLOGICAL ACCESSION NUMBER](https://www.datadictionary.nhs.uk/data_elements/radiological_accession_number.html) |
| | DICOM | (0008,0050) | {value} |
| |HL7 FHIR | Identifier.value | {value} |
| |IHE XDS  | DocumentEntry.referenceIdList | {value} using HL7 v2 CX format? |
|  | HL7 v2  | CX.1 | {value} |
| Identifier type | HL7 v2 | CX.5 | ACSN |
|  |HL7 FHIR | Identifier.type | http://terminology.hl7.org/CodeSystem/v2-0203#ACSN |
| Assigning Facility | HL7 v2  | CX.6 | ODS Code |
| | HL7 FHIR | Identifier.assigner.identifier | https://fhir.nhs.uk/Id/ods-organization-code#{ODS Code} |

"""
* type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* system 1..1
* system ^short = "uri should be defined and unique supplying organisation."
* value 1..1
