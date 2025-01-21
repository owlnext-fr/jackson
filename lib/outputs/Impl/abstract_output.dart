import 'package:jackson/enums/level.dart';

abstract class AbstractOutput {
  Level level = Level.warning;

  void trace(String message, {String? zone, Map<String, dynamic>? context});
  void debug(String message, {String? zone, Map<String, dynamic>? context});
  void info(String message, {String? zone, Map<String, dynamic>? context});
  void warning(String message, {String? zone, Map<String, dynamic>? context});
  void error(String message, {String? zone, Map<String, dynamic>? context});
  void critical(String message, {String? zone, Map<String, dynamic>? context});
  void exception(Exception exception,
      {String? zone, Map<String, dynamic>? context});
}
