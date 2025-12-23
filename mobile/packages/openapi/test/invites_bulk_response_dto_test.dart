import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for InvitesBulkResponseDto
void main() {
  final instance = InvitesBulkResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(InvitesBulkResponseDto, () {
    // Type of invite being processed (Student or Club)
    // String accountType
    test('to test the property `accountType`', () async {
      // TODO
    });

    // Import mode: add new invites or replace existing ones
    // String mode
    test('to test the property `mode`', () async {
      // TODO
    });

    // Number of new invites successfully created
    // num created
    test('to test the property `created`', () async {
      // TODO
    });

    // Number of invites skipped (already valid or duplicates)
    // num skipped
    test('to test the property `skipped`', () async {
      // TODO
    });

    // Number of accounts deactivated due to replace mode
    // num deactivated
    test('to test the property `deactivated`', () async {
      // TODO
    });

  });
}
