# openapi.model.AdminEventRequestListItemResponseDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Event request identifier. | 
**title** | **String** | Title of the requested event. | 
**eventType** | **String** | Type/category of the event. | 
**clubName** | **String** | Name of the club that submitted the request. | 
**status** | **String** | Current workflow status of the request. | 
**startTime** | [**DateTime**](DateTime.md) | Event start time (from the request). | 
**endTime** | [**DateTime**](DateTime.md) | Event end time (from the request). | 
**submittedAt** | [**DateTime**](DateTime.md) | When this request was submitted by the club. | 
**submittedByRole** | **String** | Role of the club leader who submitted the request. Exposed here to let admin see accountability level without PII. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


