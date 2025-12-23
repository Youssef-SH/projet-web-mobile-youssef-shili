# openapi.model.CreateEventRequestDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **String** | Publicly visible title of the event. | 
**description** | **String** | Detailed description of the event. | 
**eventType** | **String** | Type / category of this event. | 
**startTime** | [**DateTime**](DateTime.md) | Start date/time (ISO 8601, UTC recommended). | 
**endTime** | [**DateTime**](DateTime.md) | End date/time (must be > startTime, checked in service). | 
**expectedStudents** | **num** | Estimated attendance. | 
**roomId** | **String** | Internal room ID (on-campus). Mutually exclusive with externalAddress. | [optional] 
**externalAddress** | **String** | External, off-campus location. Mutually exclusive with roomId. | [optional] 
**submittedBy** | **String** | Club leader (President / VicePresident) responsible for this request. Must belong to the authenticated club. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


