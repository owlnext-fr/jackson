import 'dart:convert';

import 'package:jackson/enums/level.dart';
import 'package:jackson/outputs/Impl/abstract_output.dart';
import 'package:logger/logger.dart' as i_logger;

class ConsoleOutput implements AbstractOutput {
  late i_logger.Logger _innerLogger;
  late i_logger.Logger _exceptionInnerLogger;

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
        errorMethodCount: 0,
        levelEmojis: levelEmojis,
        printEmojis: enableEmoji,
      ),
    );

    _exceptionInnerLogger = i_logger.Logger(
      printer: i_logger.PrettyPrinter(
        noBoxingByDefault: true,
        stackTraceBeginIndex: 0,
        methodCount: 0,
        errorMethodCount: 8,
        levelEmojis: levelEmojis,
        printEmojis: enableEmoji,
      ),
    );
  }

  @override
  void trace(String message, {String? zone, Map<String, dynamic>? context}) {
    _innerLogger.t(_craftText(message, zone: zone, context: context));
  }

  @override
  void debug(String message, {String? zone, Map<String, dynamic>? context}) {
    _innerLogger.d(_craftText(message, zone: zone, context: context));
  }

  @override
  void info(String message, {String? zone, Map<String, dynamic>? context}) {
    _innerLogger.i(_craftText(message, zone: zone, context: context));
  }

  @override
  void warning(String message, {String? zone, Map<String, dynamic>? context}) {
    _innerLogger.w(_craftText(message, zone: zone, context: context));
  }

  @override
  void error(String message, {String? zone, Map<String, dynamic>? context}) {
    _innerLogger.e(_craftText(message, zone: zone, context: context));
  }

  @override
  void critical(String message, {String? zone, Map<String, dynamic>? context}) {
    _innerLogger.f(_craftText(message, zone: zone, context: context));
  }

  @override
  void exception(Exception exception,
      {String? zone, Map<String, dynamic>? context}) {
    _exceptionInnerLogger.e(
        _craftText(exception.toString(), zone: zone, context: context),
        error: exception);
  }

  String _craftText(String message,
      {String? zone, Map<String, dynamic>? context}) {
    String text = "";

    if (enableDate) {
      text += DateTime.now().toIso8601String();
      text += " ";
    }

    if (null != zone) {
      text += "[$zone] ";
    }

    text += message;

    if (null != context) {
      text += "\t";
      text += jsonEncode(context);
    }

    return text;
  }
}
