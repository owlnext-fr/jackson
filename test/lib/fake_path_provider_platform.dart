import 'dart:io';

import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
// ignore: depend_on_referenced_packages
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:test/fake.dart';

const String kTemporaryPath = '.dart_tool/fake/temporaryPath';
const String kApplicationSupportPath = '.dart_tool/fake/applicationSupportPath';
const String kDownloadsPath = '.dart_tool/fake/downloadsPath';
const String kLibraryPath = '.dart_tool/fake/libraryPath';
const String kApplicationDocumentsPath =
    '.dart_tool/fake/applicationDocumentsPath';
const String kExternalCachePath = '.dart_tool/fake/externalCachePath';
const String kExternalStoragePath = '.dart_tool/fake/externalStoragePath';

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    await Directory(kTemporaryPath).create(recursive: true);
    return kTemporaryPath;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    await Directory(kApplicationSupportPath).create(recursive: true);
    return kApplicationSupportPath;
  }

  @override
  Future<String?> getLibraryPath() async {
    await Directory(kLibraryPath).create(recursive: true);
    return kLibraryPath;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    await Directory(kApplicationDocumentsPath).create(recursive: true);
    return kApplicationDocumentsPath;
  }

  @override
  Future<String?> getExternalStoragePath() async {
    await Directory(kExternalStoragePath).create(recursive: true);
    return kExternalStoragePath;
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    await Directory(kExternalCachePath).create(recursive: true);
    return <String>[kExternalCachePath];
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    await Directory(kExternalStoragePath).create(recursive: true);
    return <String>[kExternalStoragePath];
  }

  @override
  Future<String?> getDownloadsPath() async {
    await Directory(kDownloadsPath).create(recursive: true);
    return kDownloadsPath;
  }
}
