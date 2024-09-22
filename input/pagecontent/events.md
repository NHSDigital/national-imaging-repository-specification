
## Types of Events

### Direct

Is normally using in the absence of **enterprise** messaging middleware such as Trust Integration Engines (TIE) or Message Queues (MQ).

[Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Message.html)

<img style="max-width: 50%" alt="Direct" src="events-direct.png"/>
<br clear="all"/>

### Point to Point Notification

[point to point](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PointToPointChannel.html), note this is often combined with middleware to support  [Message Routing Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRoutingIntro.html) 

<img style="max-width: 50%" alt="Direct" src="events-direct.png"/>
<br clear="all"/>

### Subscription Notification

Is a more modern way of converying events.
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

<img style="max-width: 50%" alt="Direct" src="events-pipes.png"/>
<br clear="all"/>

## Event Headers Mapping

For detailed HL7 v2 to FHIR Mappings see [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)

| Name                | Direct / REST Headers (NHS England) | Point to Point <br/> FHIR Message R4B            | Point to Point <br/> MSH HL7 v2     | Topic Notification <br/>  FHIR Message R4B       | Subscription Notification <br/>FHIR Subscription R4B | Point to Point MESH <br/> REST Headers | 
|---------------------|-------------------------------------|--------------------------------------------------|-------------------------------------|--------------------------------------------------|------------------------------------------------------|----------------------------------------|
| From (Organisation) | NHSD-End-User-Organisation                                    | MessageHeader .sender .identifier                | MSH-4 Sending Facility (ODS Code)   | MessageHeader .sender .identifier                |                                                      |                                        |           
| To (Organisation)   |           | MessageHeader .destination .receiver .identifier | MSH-6 Receiving Facility (ODS Code) | MessageHeader .destination .receiver .identifier |                                                      |                                        |           
| From (System)       |                                     | MessageHeader .source .endpoint                  | MSH-3 Sending Application           | MessageHeader .source .endpoint                  |                                                      | mex-from                               |
| To (System)         |                                     | MessageHeader .destination .endpoint             | MSH-5 Receiving Application         | MessageHeader .destination .endpoint             |                                                      | mex-to                                 |
| Topic               |                                     | &#10007;                                         |                                     | eventUri (SubscriptionTopic)                     | SubscriptionStatus .topic                            |                                        |           
| Event               |                                     | MessageHeader .eventCoding                       | MSH-9 Message Type                  | &#10007;                                         |                                                      | mex-workflowid                         |
| Event Number        |                                     |                                                  |                                     |                                                  | SubscriptionStatus .notificationEvent                |                                        |
| Reason              |                                     |                                                  |                                     |                                                  |                                                      |                                        |
| Subscription        |                                     |                                                  |                                     |                                                  | SubscriptionStatus.subscription                      |                                        |
| Timestamp           |                                     | Bundle .timestamp                                | MSH-7 Date/Time of Message          | Bundle .timestamp                                | SubscriptionStatus .notificationEvent .timestampe    |                                        |
| Correlation ID      | X-Correlation-Id                    | Bundle .identifier                               | MSH-10 Message Control ID           | Bundle .identifier                               |                                                      | mex-localid                            |
| Message ID          | X-Request-Id                        | MessageHeader .id                                | MSH-10 Message Control ID           | MessageHeader .id                                |                                                      | mex-messageid                          |
 
