import 'package:jackson/jackson.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:test/test.dart';

import 'lib/fake_path_provider_platform.dart';

void main() {
  PathProviderPlatform.instance = FakePathProviderPlatform();

  test('initialization', () {
    Logger();

    Logger().t("trace");
  });
}
