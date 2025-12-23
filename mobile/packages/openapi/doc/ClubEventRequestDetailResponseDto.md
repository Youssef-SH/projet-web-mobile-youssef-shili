# openapi.model.ClubEventRequestDetailResponseDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Event request identifier. | 
**title** | **String** | Title of the requested event. | 
**description** | **String** | Description / context of the event. | 
**eventType** | **String** | Type of the event. | 
**startTime** | [**DateTime**](DateTime.md) | Planned start date/time for the event. | 
**endTime** | [**DateTime**](DateTime.md) | Planned end date/time for the event. | 
**roomId** | [**JsonObject**](.md) | If the event is internal, this is the chosen room. | 
**externalAddress** | [**JsonObject**](.md) | If the event is external, this is the chosen location. Mutually exclusive with roomId. | 
**status** | **String** | Current status of the request from the club perspective. | 
**adminComment** | [**JsonObject**](.md) | Admin comment if the request was approved/rejected, shown to the club. | 
**submittedBy** | [**JsonObject**](.md) | Club role of the leader who sent the request. We only show the role to the club. | 
**submittedAt** | [**DateTime**](DateTime.md) | Date/time when the club submitted this request. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


