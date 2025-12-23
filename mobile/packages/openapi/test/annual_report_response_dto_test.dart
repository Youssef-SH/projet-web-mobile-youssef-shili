import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for AnnualReportResponseDto
void main() {
  final instance = AnnualReportResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(AnnualReportResponseDto, () {
    // Unique identifier of the club this report belongs to. Null for institution-wide reports.
    // JsonObject clubId
    test('to test the property `clubId`', () async {
      // TODO
    });

    // Academic year covered by this report.
    // num year
    test('to test the property `year`', () async {
      // TODO
    });

    // ISO 8601 UTC timestamp when the report was generated.
    // DateTime generatedAt
    test('to test the property `generatedAt`', () async {
      // TODO
    });

    // Signed URL to access the generated report PDF.
    // String reportUrl
    test('to test the property `reportUrl`', () async {
      // TODO
    });

  });
}
