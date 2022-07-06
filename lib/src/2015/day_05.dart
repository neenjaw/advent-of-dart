import 'dart:convert';

import 'package:advent_of_dart/src/reader.dart';
import 'package:characters/characters.dart';

/// Day 4 solution for Advent of code
class Day05 {
  Future<int> part1(String input) async {
    final lines = await Reader().readInput(input, LineSplitter()).toList();
    var count = 0;
    for (var line in lines) {
      if (isNice(line)) {
        count += 1;
      }
    }
    return count;
  }

  Future<int> part2(String input) async {
    final lines = await Reader().readInput(input, LineSplitter()).toList();
    var count = 0;
    for (var line in lines) {
      if (isReallyNice(line)) {
        count += 1;
      }
    }
    return count;
  }

  bool isNice(String word) {
    final chars = word.characters;

    return hasMinimumVowelCount(chars) &&
        hasDoubleLetter(chars) &&
        !hasRestrictedPair(chars);
  }

  bool hasMinimumVowelCount(Characters chars, {int count = 3}) {
    var sum = 0;
    for (var char in chars) {
      if (vowels.contains(char)) {
        sum += 1;
      }
    }
    return sum >= count;
  }

  bool hasDoubleLetter(Characters chars) {
    String? prev;
    for (var char in chars) {
      if (prev == char) {
        return true;
      }
      prev = char;
    }
    return false;
  }

  bool hasRestrictedPair(Characters chars) {
    String? prev;
    for (var char in chars) {
      if (restrictedPairs.any((pair) => pair[0] == prev && pair[1] == char)) {
        return true;
      }
      prev = char;
    }
    return false;
  }

  bool isReallyNice(String line) {
    final pairSeparatedByOneLetter = RegExp(r'(\w)\w\1');
    final recurringPair = RegExp(r'(\w\w).*\1');

    return pairSeparatedByOneLetter.hasMatch(line) &&
        recurringPair.hasMatch(line);
  }
}

const vowels = ['a', 'e', 'i', 'o', 'u'];

const restrictedPairs = [
  ['a', 'b'],
  ['c', 'd'],
  ['p', 'q'],
  ['x', 'y']
];
