# openapi.model.AnnualReportResponseDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**clubId** | [**JsonObject**](.md) | Unique identifier of the club this report belongs to. Null for institution-wide reports. | 
**year** | **num** | Academic year covered by this report. | 
**generatedAt** | [**DateTime**](DateTime.md) | ISO 8601 UTC timestamp when the report was generated. | 
**reportUrl** | **String** | Signed URL to access the generated report PDF. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


