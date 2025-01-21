import 'package:jackson/jackson.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import 'lib/fake_path_provider_platform.dart';

void main() {
  PathProviderPlatform.instance = FakePathProviderPlatform();

  late Logger logger;

  group("silent running |", () {
    test('initialization - without args', () {
      expect(() => logger = Logger(), returnsNormally);
    });
  });

  group("Console output |", () {
    test('initialization - with console output', () {
      expect(() {
        logger = Logger(
          outputs: [
            ConsoleOutput(),
          ],
        );
      }, returnsNormally);
    });

    test('initialization - with console output - with non standard opts', () {
      expect(() {
        logger = Logger(
          outputs: [
            ConsoleOutput(
                level: Level.trace, enableDate: false, enableEmoji: false),
          ],
        );
      }, returnsNormally);
    });

    test('initialization - with console output - with non default level', () {
      expect(() {
        logger = Logger(
          outputs: [
            ConsoleOutput(level: Level.trace),
          ],
        );
      }, returnsNormally);
    });

    test('execution - trace', () {
      expect(() {
        logger.t("trace message");
      }, returnsNormally);
    });

    test('execution - debug', () {
      expect(() {
        logger.d("trace message");
      }, returnsNormally);
    });

    test('execution - info', () {
      expect(() {
        logger.i("trace message");
      }, returnsNormally);
    });

    test('execution - warning', () {
      expect(() {
        logger.w("trace message");
      }, returnsNormally);
    });

    test('execution - error', () {
      expect(() {
        logger.e("trace message");
      }, returnsNormally);
    });

    test('execution - critical', () {
      expect(() {
        logger.c("trace message");
      }, returnsNormally);
    });

    test('execution - exception', () {
      expect(() {
        logger.ex(Exception("exception message"));
      }, returnsNormally);
    });
  });
}
