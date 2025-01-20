import 'package:jackson/enums/level.dart';
import 'package:jackson/outputs/Impl/abstract_output.dart';
import 'package:logger/logger.dart' as i_logger;

class ConsoleOutput implements AbstractOutput {
  late i_logger.Logger _innerLogger;

  bool enableEmoji;
  bool enableDate;

  @override
  Level level;

  ConsoleOutput({
    this.level = Level.warning,
    this.enableEmoji = true,
    this.enableDate = true,
  }) {
    Map<i_logger.Level, String> levelEmojis =
        i_logger.PrettyPrinter.defaultLevelEmojis;
    levelEmojis.update(i_logger.Level.trace, (value) => '🔍');

    _innerLogger = i_logger.Logger(
      printer: i_logger.PrettyPrinter(
        noBoxingByDefault: true,
        stackTraceBeginIndex: 0,
        methodCount: 0,
        levelEmojis: levelEmojis,
        printEmojis: enableEmoji,
      ),
    );
  }

  @override
  void trace(String message, Map<String, dynamic> context) {
    // TODO: implement trace
  }

  @override
  void debug(String message, Map<String, dynamic> context) {
    // TODO: implement debug
  }

  @override
  void info(String message, Map<String, dynamic> context) {
    // TODO: implement info
  }

  @override
  void warning(String message, Map<String, dynamic> context) {
    // TODO: implement warning
  }

  @override
  void error(String message, Map<String, dynamic> context) {
    // TODO: implement error
  }

  @override
  void critical(String message, Map<String, dynamic> context) {
    // TODO: implement critical
  }
}
