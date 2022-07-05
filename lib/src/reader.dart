import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Reader {
  Stream<T> readInput<T>(
      String filename, StreamTransformer<String, T> transformer) {
    final file = File(filename);
    return file.openRead().transform(utf8.decoder).transform(transformer);
  }
}
