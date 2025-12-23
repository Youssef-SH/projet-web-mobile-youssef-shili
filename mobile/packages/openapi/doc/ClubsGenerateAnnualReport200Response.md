# openapi.model.ClubsGenerateAnnualReport200Response

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | Machine-readable status code (e.g. OK, CREATED, VALIDATION_ERROR) | 
**message** | **String** | Human readable result summary | 
**data** | [**AnnualReportResponseDto**](AnnualReportResponseDto.md) |  | [optional] 
**error** | [**ResponseErrorDetails**](ResponseErrorDetails.md) | Error details for failed operations | [optional] 
**requestId** | **String** | Correlation ID for tracing | 
**timestamp** | **String** | Timestamp (UTC) for the response | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


