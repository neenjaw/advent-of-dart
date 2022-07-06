import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Day 4 solution for Advent of code
class Day04 {
  int part1(String key, [int zeroPlaces = 5]) {
    // final n = 609043;

    for (var n = 0; n < 10000000; n++) {
      final hash = md5.convert(utf8.encode("$key$n"));
      final header = hash.bytes.take(bytesToTake(zeroPlaces)).toList();
      if (zeroPlaces.isOdd) {
        header[header.length - 1] >>= 4;
      }
      if (header.every((element) => element == 0)) {
        return n;
      }
    }
    throw 'not it';
  }
}

int bytesToTake(int places) {
  final adjust = places.isOdd ? 1 : 0;
  return places ~/ 2 + adjust;
}
