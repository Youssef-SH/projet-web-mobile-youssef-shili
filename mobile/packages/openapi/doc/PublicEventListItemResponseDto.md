# openapi.model.PublicEventListItemResponseDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Public event identifier. | 
**title** | **String** | Title of the event. | 
**clubName** | **String** | Name of the organizing club. | 
**startTime** | [**DateTime**](DateTime.md) | Start time of the event. | 
**endTime** | [**DateTime**](DateTime.md) | End time of the event. | 
**location** | **String** | Location to be displayed to users. Either an internal room name or an external address. | 
**isCancelled** | **bool** | Whether this event was cancelled. Cancelled events are still returned. | 
**description** | **String** | Short description to show under the title in calendar/list. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


