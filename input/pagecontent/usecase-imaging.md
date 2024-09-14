
## Problem Statement

NHS Radiology faces significant challenges in enabling inter-organisational access to patients' historical diagnostic images and reports, which is crucial for ensuring continuity of care. The current reliance on the Image Exchange Portal (IEP) to share imaging studies across Trusts or Imaging Networks is fraught with inefficiencies, leading to delays and frustration for clinicians. These limitations result in unnecessary patient re-imaging and resource wastage, costing approximately £4 million annually. A solution is needed to provide seamless access to historical radiological imaging studies across all hospital sites, regardless of where the study was originally conducted.

## Definitions

| Term | Definition                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DICOM | 	Digital Imaging and Communications in Medicine is the global standard for medical images developed by American College of Radiology (ACR) and National Electrical Manufacturers Association (NEMA).                                                                                                                                                                                                                                                                                             |
| Imaging Report | An imaging report reflects the observations and interpretations of one or more imaging studies. It usually contains elements such as the reason why the study is requested, relevant contextual medical information, the used modality and its settings, procedures and body localisations that were used, a description of the observations and findings, exposure information, conclusion and advice.                                                                                          |
|Imaging Study | 	An imaging study comprises a set of objects, including images and other objects, that were made for a specific purpose and usually in response to a request from a healthcare provider. The Imaging Study does not include the Imaging Report as defined in this guideline. Imaging Study in this context does not refer to the FHIR Resource ImagingStudy - FHIR v4.0.1 (hl7.org)                                                                                                              |
| PACS | Picture Archiving and Communication System. \n\n A PACS consists of three major components: a secure network for the transmission of imaging and patient information, workstations for interpreting and reviewing images, and archives for the storage and retrieval of images and reports. Combined with web technology, a PACS has the ability to deliver timely and efficient access to images, interpretations, and related data. A PACS is usually linked to a Hospital Information System. |
| RIS  | Radiology Information System. \n\n The main functions of a RIS are the patient scheduling, resource management, examination performance tracking, reporting, results distribution, and procedure billing. Typically, it is integrated in the HIS and the PACS.                                                                                                                                                                                                                                   |

## Searching and Retrieving an Image Study or Report

<img style="max-width: 50%" alt="Imaging Workflow" src="finding-imaging-workflow.png"/>
<br clear="all"/>

<img style="max-width: 50%" alt="Imaging Workflow Activity" src="imaging-workflow-bpmn.png"/>
<br clear="all"/>

<figure>
{%include sequence-finding-image.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Sequence Diagram</p>
</figure>
<br clear="all">

## Interfaces

### NRL Interface Alpha

<figure>
{%include component-health-document-nrl-actual.svg%}
<p id="fX.X.X.X-X" class="figureTitle">NRL Interface Alpha</p>
</figure>
<br clear="all">

This health document query interface diagram is describing steps 1 and 2 from Diagram 1. The client application searches the document registry via the health document query interface to retrieve a list of image studies / reports.



The health document post interface defines how entries in the document registry are populated and maintained. The use case for this is not present.

### Radiology Integration 

<figure>
{%include component-entity-imagingstudy.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Radiology Integration</p>
</figure>
<br clear="all">

The client application will call the imaging study or report interface which will return either DICOM KOS or imaging report via an interface defined in IHE MHD Retrieve Document [ITI-68].

If the user has chosen to retrieve a DICOM KOS / Imaging Study they can use this to retrieve DICOM images via IHE Web-based Image Access (WIA).

## Assumptions

### Identifiers

It is assumed entity identifiers specified in the NHS Data Dictionary will be used (TODO ISN?) and the following principles will be followed:

- It is the responsibility of the sender or provider to ensure these identifiers are correct, not the recipient. 
- Only verified/traced NHS Numbers should be be used, untraced NHS Numbers can be used when verifying or tracing them via PDS, DBS, etc.
- Other identifiers may be used but NHS England identifiers should take precedence.

If details of these entities such as Patient, Practitioner or Organisation are required, then the following services can be used:

- [Personal Demographics Service (PDS)](https://digital.nhs.uk/services/personal-demographics-service)
- [Organisation Data Service (ODS)](https://digital.nhs.uk/services/organisation-data-service)
- **Healthcare Worker API** (in development)```

Alternatively, these services can be created locally. IHE recommendations for these interfaces are shown on the diagram below.

<figure>
{%include component-assumptions.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Suggested Terminology and Directory Services</p>
</figure>
<br clear="all">

## Terminology

Where possible/practical UK SNOMED CT will be used (TODO ISN). The following principles will be followed:

- It is the responsibility of the sender or provider of information to perform any code conversions, not the recipient.

To aid with the use of UK SNOMED CT and other terminology, the [Terminology Server](https://digital.nhs.uk/services/terminology-server) is recommended

Alternatively, these services can be created locally. IHE recommendations for these interfaces are shown on the diagram above.
