import 'dart:async';

import 'package:advent_of_dart/src/reader.dart';

/// Day 1 solution for Advent of code
class Day01 {
  Future<int> part1(String input) async {
    final transformer = StreamTransformer.fromHandlers(
        handleData: (String value, EventSink<int> sink) {
      sink.add(fold(value));
    });

    final result = await Reader().readInput<int>(input, transformer).toList();

    return result.first;
  }

  Future<int> part2(String input) async {
    final transformer = StreamTransformer.fromHandlers(
        handleData: (String value, EventSink<int> sink) {
      sink.add(findPosition(value));
    });

    final result = await Reader().readInput<int>(input, transformer).toList();

    return result.first;
  }
}

int fold(String s) {
  return s
      .split('')
      .fold(0, (balance, bracket) => toDirection(bracket) + balance);
}

int findPosition(String s) {
  var floor = 0;
  for (var entry in s.split('').asMap().entries) {
    floor += toDirection(entry.value);

    if (floor == -1) {
      return entry.key + 1;
    }
  }
  throw 'did not reach basement';
}

int toDirection(String c) {
  return c == '(' ? 1 : -1;
}
