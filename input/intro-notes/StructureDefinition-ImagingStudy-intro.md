## Entity Model

See [DICOM Key Object Selection (KOS)](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/sup59.pdf)

### Overview

| DICOM Module                                                                                                      | Usage | 
|-------------------------------------------------------------------------------------------------------------------|-------|
| Patient                                                                                                           | M     |
| Specimen Identification                                                                                           | C     | 
| General Study                                                                                                     | M     |
| Patient Study                                                                                                     | U     |
| [Key Object Document Series](https://dicom.nema.org/medical/dicom/2020a/output/chtml/part03/sect_C.17.6.html)     | M     | 
| General Equipment                                                                                                 | M     | 
| [Key Object Document Module](https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_c.17.6.2.html) | M     | 
| SR Document Content                                                                                               | M     | 
| SOP Common                                                                                                        | M     |

#### Key Object Document Series

| Attribute Type                      | Tag         | Type | Description                                                                                                                                                                                                                                |
|-------------------------------------|-------------|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Modality                            | (0008,0060) | 1    | Modality type. <br/> Enumerated Value: <br/> KO = Key Object Selection                                                                                                                                                                     |
| Series Instance UID                 | (0020,000E) | 1    | Unique identifier of the Series.<br/> Note: No specific semantics are specified.                                                                                                                                                           |
| Series Number                       | (0020,0011) | 1    | A number that identifies the Series.<br/> Note: No specific semantics are specified.                                                                                                                                                       |
| Referenced Study Component Sequence | (0008,1111) | 2    | Uniquely identifies the Performed Procedure Step SOP Instance for which the Series is created. Only a single Item shall be permitted in this sequence.<br/> Notes: See notes on this attribute in Section C.17.1 SR Document Series Module |
| > Referenced SOP Class UID          | (0008,1150) | 1C   | Uniquely identifies the referenced SOP Class.<br/>Required if Referenced Study Component Sequence (0008,1111) is sent.                                                                                                                     |
| > Referenced SOP Instance UID       | (0008,1155) | 1C   | Uniquely identifies the referenced SOP Instance.<br/> Required if Referenced Study Component Sequence (0008,1111) is sent.                                                                                                                 |

#### Key Object Document Module

| Attribute Name  | Tag         | Type | Description                                     |
|-----------------|-------------|------|-------------------------------------------------|
| Instance Number | (0020,0013) | 1    | A number that identifies the Document.          |
| Content Date    | (0008,0023) | 1    | The date the document content creation started. |
| Content Time    | (0008,0033) | 1    | The time the document content creation started. |
