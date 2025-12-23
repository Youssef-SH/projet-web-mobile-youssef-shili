# openapi.model.AdminEventRequestDetailResponseDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Event request identifier. | 
**clubId** | **String** | Club that submitted this request. | 
**submittedBy** | [**JsonObject**](.md) | Information about the club leader who submitted the request. | 
**title** | **String** | Title of the requested event. | 
**description** | **String** | Description / context of the event. | 
**eventType** | **String** | Type of the event. | 
**startTime** | [**DateTime**](DateTime.md) | Planned start date/time for the event. | 
**endTime** | [**DateTime**](DateTime.md) | Planned end date/time for the event. | 
**expectedStudents** | **num** | Expected number of attendees/students. | 
**roomId** | [**JsonObject**](.md) | Internal room where the event will take place. Mutually exclusive with externalAddress. | 
**externalAddress** | [**JsonObject**](.md) | External address (for off-campus events). Mutually exclusive with roomId. | 
**status** | **String** | Current status of the event request. | 
**adminComment** | [**JsonObject**](.md) | Admin comment associated with the approval/rejection of this request. | 
**submittedAt** | [**DateTime**](DateTime.md) | Date/time when the club submitted this request. | 
**annexes** | [**BuiltList&lt;AnnexViewDto&gt;**](AnnexViewDto.md) | List of annexes attached to this event request. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


