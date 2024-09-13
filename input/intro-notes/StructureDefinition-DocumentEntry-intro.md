
## Entity Model

This is based on both FHIR [DocumentReference](https://hl7.org/fhir/R4/documentreference.html) and IHE (Europe) [Document Metadata](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf) (this contains references to NHS England terminology)


<figure>
{%include entity-document-entry.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Entity Document Entry</p>
</figure>
<br clear="all">

## Entity Mapping and Description

For HL7 v2 MDM see [HL7 v2 Mapping](https://hl7.org/fhir/R4/documentreference-mappings.html#v2) 

| IHE XDS Document Entry                | IHE MHD FHIR DocumentReference | Use                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                         | 
|---------------------------------------|--------------------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| uniqueId                              | masterIdentifier               | Primary Query       | The globally unique identifier assigned by the document creator to this document. This unique identifier may be used in the body of other documents to reference this document. The structure and format of this Id is consistent with the document content Interoperability Specification, in particular with the formatCode attribute. Has a single value.                                                                        |        
| entryUUID                             | identifier                     | Technical           | This globally unique identifier is primarily intended foruse as a document registry management identifier. It is not meant to be an external reference (outside of the Document Registry) for documents (e.g., in links within other documents)                                                                                                                                                                                     |       	  
| availabilityStatus	                   | status                         | Primary Query       |                                                                                                                                                                                                                                                                                                                                                                                                                                     |          
| type                                  | type                           | Secondary Filtering | The code specifying the precise type of document from the user perspective  (e.g. Pulmonary History and Physical, Discharge Summary, Ultrasound Report).                                                                                                                                                                                                                                                                            |
| class	                                | category	                      | Primary Query       | The code specifying the high-level use classification of the document type (e.g., Report, Summary, Images, Treatment Plan, Patient Preferences, Workflow). The code specifying the particular kind of document. Shall have a single value. Coded with a coarse level of granularity.                                                                                                                                                |          
| patientId                             | subject                        | Primary Query       | The patientId represents the subject of care of the document. It contains the Health ID with its two parts: Authority Domain Id (OID/System Uri enforced by the Registry) An Id in the above domain issued by the PDQ Supplier Actor (NHS England PAS)                                                                                                                                                                              |          
| author	                               | author                         | Secondary Filtering | The humans and/or machines that authored the document.                                                                                                                                                                                                                                                                                                                                                                              |
| creationTime                          | content.attachment.date        | Secondary Filtering |                                                                                                                                                                                                                                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                 
| title                                 | content.attachment.title       | Secondary Filtering | Represents the title of the document                                                                                                                                                                                                                                                                                                                                                                                                |
| comments                              | description                    | Secondary Filtering | Comments associated with the Document.                                                                                                                                                                                                                                                                                                                                                                                              |           
| confidentialityCode                   | securityLabel                  | Primary Query       | The code specifying the level of confidentiality of the document. Has one or more values.                                                                                                                                                                                                                                                                                                                                           |           
| eventCodeList                         | context.event                  | Primary Query       | This list of codes represents the main clinical “key words” for queries specific to certain document content (e.g. test panel code for laboratory results).The value chosen shall not conflict with the values selected in the classCode, practiceSettingCode or typeCode, as such a conflict would create an ambiguous situation. This value list may have zero or more values.                                                    |          
| serviceStartTime and serviceStopTime  | context.period                 | Primary Query       | Represents the start and stop time the service being documented took place (clinically significant, but not necessarily when the document was produced or approved).                                                                                                                                                                                                                                                                |          
| practiceSettingCode                   | context.practiceSetting        | Primary Query       | This code represents the type of organizational setting of the clinical encounter during which the documented act occurred. The code specifying the clinical specialty where the act that resulted in the document was performed (e.g., Intensive care, Laboratory, Radiology). Coarse level of granularity. Has a single value                                                                                                     |
| healthcareFacilityTypeCode            | context.facilityType           | Primary Query       | This code represents the type of organization where the clinical encounter during which the documented act occurred. The value chosen in the value set needs to avoid conflict with the value used in the typeCode, as such a conflict would create an ambiguous situation. Has a single value.                                                                                                                                    |
| sourcePatientInfo and sourcePatientId | context.sourcePatientInfo      |                     | The sourcePatientId represents the subject of care medical record Identifier (e.g., Patient Id) in the local patientIdentifier Domain of the Document Source. If used, it contains two parts:Authority Domain Id (System Uri/OID) and an Id in the local domain (e.g., Patient Id). It is only intended as an audit/checking mechanism and has occasional use for Document Consumer Actors.                                         |
| referenceIdList                       | context.related                | Primary Query       | This list contains zero or more Identifiers. These Identifiers may be internal or external identifiers, E.g., Identifiers may be Accession Numbers, Order Numbers, Referral Request Identifiers, XDW Workflow, Instance Identifiers, etc.                                                                                                                                                                                           |                                                                                                                                                                     
| mimeType                              | content.attachment.contentType | Technical           | MIME type of the document in the Repository. Shall have a single value                                                                                                                                                                                                                                                                                                                                                              |          
| URI                                   | content.attachment.uri         | Technical           | The URI for the document                                                                                                                                                                                                                                                                                                                                                                                                            |
| languageCode                          | content.attachment.language    |                     | Specifies the human language of character data in the document. The values of the attribute are language identifiers as described by the IETF (Internet Engineering Task Force) RFC 3066. Has a single value.                                                                                                                                                                                                                       |          
| formatCode                            | content.format                 | Technical           | Code globally uniquely specifying the format of the document. Along with the typeCode, it provides sufficient information to allow any potential Document Consumer to know if it will be able to process/display the document by identifying an encoding, structure and template                                                                                                                                                    |          
| hash                                  | content.attachment.hash        | Technical           | Hash key of the document itself. This value is computed by the Document Repository and used by the Document Registry for detecting tampering or the improper resubmission of documents .Has a single value                                                                                                                                                                                                                          |
| size                                  | content.attachment.size        | Technical           | Size in bytes of the byte stream of the document                                                                                                                                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                  
| legalAuthenticator	                   | authenticator                  |                     | Represents a participant within an authorInstitution who has legally authenticated or attested the document. Represents a participant who has legally authenticated or attested the document within the authorInstitution. Legal authentication implies that a document has been signed manually or electronically by the legalAuthenticator. This attribute may be absent if not applicable. If present, shall have a single value |
| Associations	                         | relatesTo                      |                     | Relationships to other documents                                                                                                                                                                                                                                                                                                                                                                                                    |          
| Associations type                     | relatesTo.code                 |                     |                                                                                                                                                                                                                                                                                                                                                                                                                                     |          
| Associations reference                | relatesTo.target               |                     |                                                                                                                                                                                                                                                                                                                                                                                                                                     |           
| objectType                            |                                |                     | The type of DocumentEntry (e.g. On-Demand DocumentEntry)                                                                                                                                                                                                                                                                                                                                                                            |

Internal NHS England link to DocumentReference elaboration https://nhsd-confluence.digital.nhs.uk/display/CLP/Category+vs+Type#CategoryvsType-FHIRdefinitionofClass/Category

Links to other countries Document Metadata definitions:

* Switzerland [CH MHD DocumentReference Comprehensive](https://build.fhir.org/ig/ehealthsuisse/ch-epr-fhir/StructureDefinition-ch-mhd-documentreference-comprehensive.html)
* France [PDSm Comprehensive DocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-document-reference.html)
* [Digital Health and Care Scotland - (EH4001) CLINICAL DOCUMENT INDEXING STANDARDS ](https://www.digihealthcare.scot/app/uploads/2024/05/CDI-Standard-V4.5-FINAL.pdf)
* [HL7 UK Core](https://simplifier.net/hl7fhirukcorer4/ukcore-documentreference)

### Document Type and Category

A summary of the current definitions of DocumentCategory and DocumentType is shown below with examples based on Care Plans:

<figure>
{%include datamodel-document-metadata-code-relationships.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Relationships between Document Metadata Type and Category and Composition Types</p>
</figure>
<br clear="all">

The example are from
- NHS England National Record Locator 
- [Switzerland DocumentEntry.typeCode](https://fhir.ch/ig/ch-term/3.0.0/ValueSet-DocumentEntry.typeCode.html)
- [UKCore DocumentType](https://simplifier.net/HL7FHIRUKCoreR4/ValueSet-UKCore-DocumentType), NHS England Terminology Browser [Refset 1127551000000109](https://termbrowser.nhs.uk/?perspective=full&conceptId1=1127551000000109&edition=uk-edition&release=v20240731&server=https://termbrowser.nhs.uk/sct-browser-api/snomed&langRefset=999001261000000100,999000691000001104)

#### Imaging Document Type and Category 

<figure>
{%include datamodel-document-metadata-code-imaging.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Relationships between Document Metadata Type and Category and Composition Types Imaging</p>
</figure>
<br clear="all">

See  

- section 3.2.3.2 (page 25) of IHE (Europe) [Document Metadata](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf)
- NHS England Data Dictionary [IMAGING CODE (SNOMED CT)](https://www.datadictionary.nhs.uk/data_elements/imaging_code__snomed_ct_.html) 
  - NHS England Terminology Browser [Refset 999001111000000105](https://termbrowser.nhs.uk/?perspective=full&conceptId1=999001111000000105&edition=uk-edition&release=v20240731&server=https://termbrowser.nhs.uk/sct-browser-api/snomed&langRefset=999001261000000100,999000691000001104)
- NHS England [National Interim Clinical Imaging Procedure code set](https://nhsengland.kahootz.com/t_c_home/view?objectID=45878224) which mentions a **ConceptMap** to SNOMED CT (according Data Dictionary for Care (DD4C) NICIP, and the SNOMED refset are all referring to the same procedures)

NICIP in both native and SNOMED versions contains several thousand codes, this may not be suitable for general searches from non radiologists. 
Also, DICOM Categories may be suitable for searching (for non radiologists) but is not included in IHE Europe documentations, need to find out if this has been considered.

**Note this probably requires a ConceptMap**


### Practice Setting

Both IHE and HL7 refer to clinical specialty where the event took place. UK Core has taken a Service route using SNOMED CT codes.

#### Option 1 Service 

TODO - This is referring to [NHS Data Model and Dictionary - TREATMENT FUNCTION CODE](https://www.datadictionary.nhs.uk/attributes/treatment_function_code.html)
and [UKCoreCareSettingType](https://simplifier.net/hl7fhirukcorer4/valueset-ukcore-caresettingtype)

NHS England is probably creating a new CodeSystem on the Ontology Server

**Note this probably requires a ConceptMap**

#### Option 2 Specialty

In FHIR this would also be available via author.PractitionerRole.specialty

This is referring to [MAIN SPECIALTY CODE](https://www.datadictionary.nhs.uk/attributes/main_specialty_code.html) and [UKCorePracticeSettingCode](https://simplifier.net/hl7fhirukcorer4/valueset-ukcore-practicesettingcode)

Note this appears to be a source of confusion as practiceSetting is being linked to treatment-function-codes elsewhere.

NHS England is probably creating a new CodeSystem on the Ontology Server

**Note this probably requires a ConceptMap**




