Profile:        ASID
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             accredited-system
Title:          "Accredited System Identifiers"
Description:     """
From [eRS ASID Description](https://digital.nhs.uk/services/e-referral-service/api/integration-process/security-and-authorisation#accredited-system-identifiers-and-message-sets)

Accredited System Identifier is an identifier used in Spine Directory Service (SDS) to reference an IT system which has been accredited for use in a specific health or care organisation.

The application created within API Management will be bound to an ASID. This is a one-to-one mapping and the ASID is representative of the end-user organisation. If you're working with many end-user organisations you will need multiple ASIDs.
"""


* system 1..1
* system = "https://fhir.nhs.uk/Id/accredited-system"
* value 1..1
