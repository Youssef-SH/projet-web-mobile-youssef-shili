import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for HealthApi
void main() {
  final instance = Openapi().getHealthApi();

  group(HealthApi, () {
    // Service health status check
    //
    // Used by uptime monitors, containers, load balancers, and cloud workloads to verify the service is healthy.
    //
    //Future<ApiResponseDto> healthCheck() async
    test('test healthCheck', () async {
      // TODO
    });

  });
}
