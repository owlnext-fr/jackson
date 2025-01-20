import 'package:jackson/enums/level.dart';

abstract class AbstractOutput {
  Level level = Level.warning;

  void trace(String message, Map<String, dynamic> context);
  void debug(String message, Map<String, dynamic> context);
  void info(String message, Map<String, dynamic> context);
  void warning(String message, Map<String, dynamic> context);
  void error(String message, Map<String, dynamic> context);
  void critical(String message, Map<String, dynamic> context);
}
