import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for InvitePreviewSummaryDto
void main() {
  final instance = InvitePreviewSummaryDtoBuilder();
  // TODO add properties to the builder and call build()

  group(InvitePreviewSummaryDto, () {
    // Type of invite being processed (Student or Club)
    // String accountType
    test('to test the property `accountType`', () async {
      // TODO
    });

    // Import mode: add new or replace existing invites
    // String mode
    test('to test the property `mode`', () async {
      // TODO
    });

    // Total number of rows detected in the uploaded CSV file
    // num totalRows
    test('to test the property `totalRows`', () async {
      // TODO
    });

    // Number of new invites that will be created
    // num willCreate
    test('to test the property `willCreate`', () async {
      // TODO
    });

    // Number of existing valid entries that will be skipped
    // num willSkip
    test('to test the property `willSkip`', () async {
      // TODO
    });

    // Number of accounts that will be deactivated due to replace mode
    // num willDeactivate
    test('to test the property `willDeactivate`', () async {
      // TODO
    });

  });
}
