
## Interfaces

### NRL Interface Alpha

<figure>
{%include component-health-document-nrl-nir.svg%}
<p id="fX.X.X.X-X" class="figureTitle">NRL Interface for NIR Alpha</p>
</figure>
<br clear="all">

This health document query interface diagram is describing steps 1 and 2 from Diagram 1. The client application searches the document registry via the health document query interface to retrieve a list of image studies / reports.

### IHE XDS/MHD(XDSonFHIR)

TODO Is a specific version of XDS specified i.e. XDS.b or MHD (XDSonFHIR)?

<figure>
{%include component-health-document-ihe-nir.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE XDS/MHD Interfaces for NIR Alpha</p>
</figure>
<br clear="all">

The health document post interface defines how entries in the document registry are populated and maintained. The use case for this is not present.

### Radiology Integration

<figure>
{%include component-entity-imagingstudy.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Radiology Integration</p>
</figure>
<br clear="all">

The client application will call the imaging study or report interface which will return either DICOM KOS or imaging report via an interface defined in IHE MHD Retrieve Document [ITI-68].

If the user has chosen to retrieve a DICOM KOS / Imaging Study they can use this to retrieve DICOM images via IHE Web-based Image Access (WIA).
