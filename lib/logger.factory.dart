import 'package:logger/logger.dart';

/// Logger factory class.
///
/// This class is used to create a logger instance.
class LoggerFactory {
  /// Get a logger instance.
  /// 
  /// If [debugEnabled] is true, the logger will be in debug mode and output logs.
  static Logger getInstance(bool debugEnabled) {
    Logger logger;

    if (true == debugEnabled) {
      Map<Level, String> levelEmojis = PrettyPrinter.defaultLevelEmojis;
      levelEmojis.update(Level.trace, (value) => '🔍');

      logger = Logger(
        printer: PrettyPrinter(
          noBoxingByDefault: true,
          stackTraceBeginIndex: 0,
          methodCount: 0,
          levelEmojis: levelEmojis,
        ),
      );
    } else {
      logger = Logger(level: Level.off);
    }

    return logger;
  }
}
