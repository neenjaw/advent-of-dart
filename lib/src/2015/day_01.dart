import 'dart:async';
import 'dart:convert';

import 'package:advent_of_dart/src/reader.dart';

/// Day 1 solution for Advent of code
class Day01 {
  Future<int> part1(String input) async {
    final transformer = StreamTransformer.fromHandlers(
        handleData: (String value, EventSink<int> sink) {
      sink.add(tally(value));
    });

    final result = await Reader().readInput<int>(input, transformer);

    return result.first;
  }
}

int tally(String s) {
  return s.split('').fold(
      0, (balance, bracket) => (bracket == '(') ? balance + 1 : balance - 1);
}
