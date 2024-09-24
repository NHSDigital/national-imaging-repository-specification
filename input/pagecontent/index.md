
**This is an elaboration of an approach. It is not an official guide**

## Introduction

TODO.


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

> **NHS Number - misidentification**. This is when a patient or person has been incorrectly linked to a NHS Number, normally by mistaken identity. This may require the use of a [Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/) but this topic is not covered here.

<figure>
{%include component-assumptions.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Suggested Terminology and Directory Services</p>
</figure>
<br clear="all">

### Terminology

Where possible/practical UK SNOMED CT will be used (TODO ISN). The following principles will be followed:

- It is the responsibility of the sender or provider of information to perform any code conversions, not the recipient.

To aid with the use of UK SNOMED CT and other terminology, the [Terminology Server](https://digital.nhs.uk/services/terminology-server) is recommended

Alternatively, these services can be created locally. IHE recommendations for these interfaces are shown on the diagram above.


## Dependencies

{% include dependency-table.xhtml %}



