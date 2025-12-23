import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for InvitesResendResponseDto
void main() {
  final instance = InvitesResendResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(InvitesResendResponseDto, () {
    // Number of invite emails successfully resent
    // num accepted
    test('to test the property `accepted`', () async {
      // TODO
    });

    // Number of invite emails that failed to resend (invalid, expired, or already accepted)
    // num failed
    test('to test the property `failed`', () async {
      // TODO
    });

  });
}
