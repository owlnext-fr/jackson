import 'package:proper_filesize/proper_filesize.dart';

class SingleFileLimitMode {
  late int size;
  late String mode;

  SingleFileLimitMode._({
    required this.size,
    required this.mode,
  });

  factory SingleFileLimitMode.size(String size) {
    int binaryBytes = FileSize.parse(size).size.toInt();

    return SingleFileLimitMode._(
      size: binaryBytes,
      mode: 'size',
    );
  }

  factory SingleFileLimitMode.lineCount(int count) {
    return SingleFileLimitMode._(
      size: count,
      mode: 'lineCount',
    );
  }
}

void main() {
  SingleFileLimitMode.size('10MB');
  SingleFileLimitMode.lineCount(1000);
}
