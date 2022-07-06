import 'package:advent_of_dart/advent_of_dart_2015.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

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

  group('Day 03', () {
    final input = './test/2015/day_03_input.txt';
    final day03 = Day03();

    test('simulate', () {
      final result = day03.simulate('>');
      expect(result.item1, equals(Tuple2(1, 0)));
      expect(result.item2, equals({Tuple2(1, 0): 1, Tuple2(0, 0): 1}));
    });

    test('part 1', () {
      expect(day03.part1(input), completion(equals(2592)));
    });

    test('part 2', () {
      expect(day03.part2(input), completion(equals(2360)));
    });
  });
  group('Day 04', () {
    final day04 = Day04();

    test('example 1', () {
      final example1Key = 'abcdef';
      expect(day04.part1(example1Key), equals(609043));
    });
    test('example 2', () {
      final example1Key = 'pqrstuv';
      expect(day04.part1(example1Key), equals(1048970));
    });
    test('part 1', () {
      final example1Key = 'iwrupvqb';
      expect(day04.part1(example1Key), equals(346386));
    });
    test('part 2', () {
      final example1Key = 'iwrupvqb';
      expect(day04.part1(example1Key, 6), equals(9958218));
    });
  });
}
