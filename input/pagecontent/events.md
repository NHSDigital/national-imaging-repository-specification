

## Types of Notifications

### Direct

Is normally using in the absence of **enterprise** messaging middleware such as Trust Integration Engines (TIE) or Message Queues (MQ).
It is typically found in **application** based integrations and may be used in the interface to **enterprise** infrstructure.

[Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Message.html)

<img style="max-width: 50%" alt="Direct" src="events-direct.png"/>
<br clear="all"/>



### Event Notification (Point to Point)

[point to point](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PointToPointChannel.html), note this is often combined with middleware to support  [Message Routing Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRoutingIntro.html) 

<img style="max-width: 50%" alt="Direct" src="events-direct.png"/>
<br clear="all"/>

### Subscription (Topic) Notification

Is a more modern way of converying events. It is assumed this will be topic based (colle)
[publish subscribe](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PublishSubscribeChannel.html)

<img style="max-width: 50%" alt="Direct" src="events-subscription.png"/>
<br clear="all"/>

### Topic Notifications

Is related to Subscription Notification and uses [Message Routing Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRoutingIntro.html) instead.
This is equivalent to Rabbit MQ *Topic Exchange*

<img style="max-width: 50%" alt="Direct" src="events-topic.png"/>
<br clear="all"/>

## Assumptions

It is not believed to be practical to define a single method for events or messages. So it assumed [pipes+filters](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PipesAndFilters.html) will be used in the enterprise and this will contain a mix of approaches.

For examples Encounter events in FHIR will often start as existing HL7 v2 ADT Messages. They may become Topic Messages, Subscription or remain as Message

Message metadata (HL7 v2 MHS, FHIR MessageHeader or http headers) **MUST** be decoupled from the payload, i.e. Organization resources **should not** be added to the message payload in order to meet data requirements of the header.

The events and messages are not considered to be a record entity, they are not a method of defining record storage. Using events and messages to perform record transfer ([Data Transfer Object (DTO)](https://martinfowler.com/eaaCatalog/dataTransferObject.html)) is strongly discouraged in Enterprise settings.

<img style="max-width: 50%" alt="Direct" src="events-pipes.png"/>
<br clear="all"/>

### Events or Topics

Events can be fine-grained, for example HL7 v2 defined several events associated with a patient discharge. Topics on the other hand are coarser and can be considered a grouping of events, for example social services are probably interested in all the events associated with a patient discharge and so would want all events associated with the `patient-discharge` topic 

<figure>
{%include entity-subscription-topic.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Relationship between Topics and Events</p>
</figure>
<br clear="all">

## Standards Map

| Name                                                                                                                                                         | Direct   | Point To Point <br/> Event Notification | Subscription Notification                      | Topic Notification |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------------------------------|------------------------------------------------|--------------------|
| [IHE Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html) / HL7 v2 Admission, Discharge and Transfers (ADT)          |          | &#10003;                                |                                                |                    |
| HL7 v2 Observation Result (ORU)                                                                                                                              |          | &#10003;                                |                                                |                    |
| [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html)                                                   | &#10003; |                                         |                                                |                    |
| [IHE Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/)                                                                            |          |                                         | &#10003; (subcription based)                   |                    |
| [IHE Document Subscription for Mobile (DSUBm)](https://profiles.ihe.net/ITI/DSUBm/index.html)                                                                |          |                                         | &#10003; (topic based)                         |                    |
| [FHIR Cast](https://fhircast.org/)                                                                                                                           | &#10003; |                                         |                                                |                    |
| [FHIR Subscription R5](https://hl7.org/fhir/R5/subscriptions.html) [R4/R4B Backport](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/index.html) |          |                                         | &#10003;                                       |                    |
| [NHS England Multicast Notification Service API](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)                              |          |                                         | &#10003; (subscription based, references only) |                    |

TODO do we fold in Topic Message into Point to Point, differences are minor but the move towards working alongside Subcription Topics rather than HL7 v2 like events probably needs to be highlighted.

[National Events Management Service (NEMS)](https://digital.nhs.uk/services/national-events-management-service) should really be included in this list but is difficult to map to other standards as it focuses on [Data Transfer Objects (DTO)](https://martinfowler.com/eaaCatalog/dataTransferObject.html)/FHIR Message exchanges.

## Message Metadata Mapping

For detailed HL7 v2 to FHIR Mappings see [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)

| Name                | Direct / REST Headers (NHS England) | Point to Point <br/> FHIR Message R4B          | Point to Point <br/> MSH HL7 v2     | Topic Notification <br/>  FHIR Message R4B                                                     | Subscription Notification <br/>FHIR Subscription R4B | Point to Point MESH <br/> REST Headers | Subscription MNS <br/> [CloudEvents](https://cloudevents.io/)                       |
|---------------------|-------------------------------------|------------------------------------------------|-------------------------------------|------------------------------------------------------------------------------------------------|------------------------------------------------------|----------------------------------------|-------------------------------------------------------------------------------------|
| From (Organisation) | NHSD-End-User-Organisation          | MessageHeader .sender .identifier              | MSH-4 Sending Facility (ODS Code)   | MessageHeader.sender .identifier                                                               |                                                      |                                        |                                                                                     |   
| To (Organisation)   |                                     | MessageHeader.destination .receiver.identifier | MSH-6 Receiving Facility (ODS Code) | MessageHeader.destination .receiver.identifier                                                 |                                                      |                                        |                                                                                     |    
| From (System)       |                                     | MessageHeader.source .endpoint                 | MSH-3 Sending Application           | MessageHeader.source .endpoint                                                                 |                                                      | mex-from                               | source                                                                              |
| To (System)         |                                     | MessageHeader.destination .endpoint            | MSH-5 Receiving Application         | MessageHeader.destination .endpoint                                                            |                                                      | mex-to                                 |                                                                                     |
| Topic               |                                     | &#10007;                                       |                                     | MessageHeader.eventUri (SubscriptionTopic)                                                                   | SubscriptionStatus.topic                             |                                        | subject?                                                                            |         
| Event               |                                     | MessageHeader.eventCoding                      | MSH-9 Message Type                  | &#10007;                                                                                       |                                                      | mex-workflowid                         | type?                                                                               |
| Event Number        |                                     |                                                |                                     |                                                                                                | SubscriptionStatus.notificationEvent                 |                                        |                                                                                     |
| Reason              |                                     |                                                | MSH-9 Message Type                  | MessageHeader.reason ([hl7v2 events](https://terminology.hl7.org/6.0.2/ValueSet-v2-0003.html)) |                                                      |                                        |                                                                                     |
| Subscription        |                                     |                                                |                                     |                                                                                                | SubscriptionStatus.subscription                      |                                        |                                                                                     |
| Timestamp           |                                     | Bundle.timestamp                               | MSH-7 Date/Time of Message          | Bundle .timestamp                                                                              | SubscriptionStatus.notificationEvent .timestamp      |                                        | time                                                                                | 
| Correlation ID      | X-Correlation-Id                    | Bundle.identifier                              | MSH-10 Message Control ID           | Bundle .identifier                                                                             |                                                      | mex-localid                            |                                                                                     |
| Message ID          | X-Request-Id                        | MessageHeader.id                               | MSH-10 Message Control ID           | MessageHeader .id                                                                              |                                                      | mex-messageid                          | id                                                                                  |
| Payload             | event data                          | event data                                     | event data                          | event data (and referenced event?)                                                             | event data (and referenced event)                    | event data                             | event reference (dataref but cloud watch also support data, is this filter in MNS?) |
