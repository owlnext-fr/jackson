import 'package:jackson/enums/level.dart';
import 'package:jackson/outputs/Impl/abstract_output.dart';

class Logger {
  // region fields
  static final Logger _instance = Logger._internal();
  static List<AbstractOutput> _outputs = [];
  static Level _defaultLevel = Level.warning;
  // endregion

  // region constructors
  Logger._internal();

  factory Logger({
    Level defaultLevel = Level.warning,
    List<AbstractOutput> outputs = const [],
  }) {
    _defaultLevel = defaultLevel;
    _outputs = outputs;
    return _instance;
  }
  // endregion

  // region getters
  static List<AbstractOutput> get outputs => _outputs;
  static Level get defaultLevel => _defaultLevel;
  // endregion

  // region methods

  void t(String message, {String? zone, Map<String, dynamic>? context}) {
    for (var output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.trace(message, zone: zone, context: context);
      }
    }
  }

  void d(String message, {String? zone, Map<String, dynamic>? context}) {
    for (var output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.debug(message, zone: zone, context: context);
      }
    }
  }

  void i(String message, {String? zone, Map<String, dynamic>? context}) {
    for (var output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.info(message, zone: zone, context: context);
      }
    }
  }

  void w(String message, {String? zone, Map<String, dynamic>? context}) {
    for (var output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.warning(message, zone: zone, context: context);
      }
    }
  }

  void e(String message, {String? zone, Map<String, dynamic>? context}) {
    for (var output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.error(message, zone: zone, context: context);
      }
    }
  }

  void c(String message, {String? zone, Map<String, dynamic>? context}) {
    for (var output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.critical(message, zone: zone, context: context);
      }
    }
  }

  void ex(Exception ex, {String? zone, Map<String, dynamic>? context}) {
    for (var output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.exception(ex, zone: zone, context: context);
      }
    }
  }
}
