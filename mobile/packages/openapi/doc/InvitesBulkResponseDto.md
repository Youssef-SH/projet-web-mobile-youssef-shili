# openapi.model.InvitesBulkResponseDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accountType** | **String** | Type of invite being processed (Student or Club) | 
**mode** | **String** | Import mode: add new invites or replace existing ones | 
**created** | **num** | Number of new invites successfully created | 
**skipped** | **num** | Number of invites skipped (already valid or duplicates) | 
**deactivated** | **num** | Number of accounts deactivated due to replace mode | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


