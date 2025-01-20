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
  void t(
    String message, {
    Map<String, dynamic>? context,
  }) {
    for (AbstractOutput output in _outputs) {
      if (output.level.index <= Level.trace.index) {
        output.trace(message, context ?? {});
      }
    }
  }

  void d(
    String message, {
    Map<String, dynamic>? context,
  }) {
    for (AbstractOutput output in _outputs) {
      if (output.level.index <= Level.debug.index) {
        output.debug(message, context ?? {});
      }
    }
  }

  void i(
    String message, {
    Map<String, dynamic>? context,
  }) {
    for (AbstractOutput output in _outputs) {
      if (output.level.index <= Level.info.index) {
        output.info(message, context ?? {});
      }
    }
  }

  void w(
    String message, {
    Map<String, dynamic>? context,
  }) {
    for (AbstractOutput output in _outputs) {
      if (output.level.index <= Level.warning.index) {
        output.warning(message, context ?? {});
      }
    }
  }

  void e(
    String message, {
    Map<String, dynamic>? context,
  }) {
    for (AbstractOutput output in _outputs) {
      if (output.level.index <= Level.error.index) {
        output.error(message, context ?? {});
      }
    }
  }

  void c(
    String message, {
    Map<String, dynamic>? context,
  }) {
    for (AbstractOutput output in _outputs) {
      if (output.level.index <= Level.critical.index) {
        output.critical(message, context ?? {});
      }
    }
  }
}
