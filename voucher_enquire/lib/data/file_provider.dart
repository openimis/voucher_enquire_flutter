import 'package:path/path.dart' as path;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class FileProvider {
  final String basePath;

  FileProvider({required this.basePath});

  Future<bool> exists(String path) async {
    var file = _getFileFromRelativePath(path);
    return file.exists();
  }

  Future<void> write(String path, String content) async {
    var file = _getFileFromRelativePath(path);
    if (!await exists(path)) {
      file.create(recursive: true);
    }
    file.openWrite().write(content);
  }

  Future<String> read(String path) async {
    var file = _getFileFromRelativePath(path);
    return file.openRead().transform(utf8.decoder).join("");
  }

  File _getFileFromRelativePath(String relativePath) {
    var targetPath = path.join(basePath, relativePath);
    return File(targetPath);
  }
}
