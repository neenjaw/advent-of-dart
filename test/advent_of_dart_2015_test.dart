import 'package:advent_of_dart/advent_of_dart_2015.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final day01 = Day01();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(
          day01.part1('./test/2015/day_01_input.txt'), completion(equals(280)));
    });
  });
}
