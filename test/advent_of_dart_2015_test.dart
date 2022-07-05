import 'package:advent_of_dart/advent_of_dart_2015.dart';
import 'package:test/test.dart';

void main() {
  group('Day 01', () {
    final day01 = Day01();

    test('part 1', () {
      expect(
          day01.part1('./test/2015/day_01_input.txt'), completion(equals(280)));
    });

    test('part 2', () {
      expect(day01.part2('./test/2015/day_01_input.txt'),
          completion(equals(1797)));
    });
  });
}
