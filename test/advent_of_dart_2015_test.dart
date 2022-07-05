import 'package:advent_of_dart/advent_of_dart_2015.dart';
import 'package:advent_of_dart/src/2015/day_02.dart';
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
  group('Day 02', () {
    final input = './test/2015/day_02_input.txt';
    final day02 = Day02();

    test('box.surfaceArea', () {
      expect(Box.fromCode('1x1x1').totalSurfaceArea, equals(6));
      expect(Box.fromCode('2x2x2').totalSurfaceArea, equals(24));
      expect(Box.fromCode('1x2x3').totalSurfaceArea, equals(22));
    });

    test('box.smallestDimension', () {
      expect(Box.fromCode('1x1x1').smallestSideArea, equals(1));
      expect(Box.fromCode('2x2x2').smallestSideArea, equals(4));
      expect(Box.fromCode('1x2x3').smallestSideArea, equals(2));
      expect(Box.fromCode('3x2x1').smallestSideArea, equals(2));
    });

    test('part 1', () {
      expect(day02.part1(input), completion(equals(1606483)));
    });

    test('part 2', () {
      expect(day02.part2(input), completion(equals(3842356)));
    });
  });
}
