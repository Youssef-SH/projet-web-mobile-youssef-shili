# openapi.model.InvitePreviewSummaryDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accountType** | **String** | Type of invite being processed (Student or Club) | 
**mode** | **String** | Import mode: add new or replace existing invites | 
**totalRows** | **num** | Total number of rows detected in the uploaded CSV file | 
**willCreate** | **num** | Number of new invites that will be created | 
**willSkip** | **num** | Number of existing valid entries that will be skipped | 
**willDeactivate** | **num** | Number of accounts that will be deactivated due to replace mode | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


