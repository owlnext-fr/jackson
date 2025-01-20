enum Level {
  trace(1),
  debug(2),
  info(3),
  warning(4),
  error(5),
  critical(6),
  off(0);

  final int value;

  const Level(this.value);
}
