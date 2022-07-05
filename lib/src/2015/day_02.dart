import 'dart:async';
import 'dart:convert';

import 'package:advent_of_dart/src/reader.dart';

/// Day 2 solution for Advent of code
class Day02 {
  Future<int> part1(String input) async {
    final boxes = await getBoxes(input);
    return sumBoxes(boxes);
  }

  Future<int> part2(String input) async {
    final boxes = await getBoxes(input);
    return sumRibbons(boxes);
  }

  Future<List<Box>> getBoxes(String input) async {
    final boxTransformer = StreamTransformer.fromHandlers(
        handleData: (String encoded, EventSink<Box> sink) {
      sink.add(Box.fromCode(encoded));
    });

    return await Reader()
        .readInput<String>(input, LineSplitter())
        .transform(boxTransformer)
        .toList();
  }

  int sumBoxes(List<Box> boxes) => boxes.fold<int>(
      0, (sum, box) => sum + box.totalSurfaceArea + box.smallestSideArea);

  int sumRibbons(List<Box> boxes) => boxes.fold<int>(
      0, (sum, box) => sum + box.smallestPerimeter + box.totalVolume);
}

class Box {
  int length, width, height;

  Box(this.length, this.width, this.height);

  factory Box.fromCode(String code) {
    final dimensions =
        code.split('x').map((dimension) => int.parse(dimension)).toList();
    return Box(dimensions[0], dimensions[1], dimensions[2]);
  }

  int get totalSurfaceArea =>
      2 * length * width + 2 * width * height + 2 * height * length;

  int get totalVolume => length * width * height;

  List<int> get orderedDimensions {
    final sides = <int>[length, width, height];
    sides.sort();
    return sides;
  }

  int get smallestPerimeter {
    final sides = orderedDimensions;
    return sides[0] + sides[0] + sides[1] + sides[1];
  }

  int get smallestSideArea {
    final sides = orderedDimensions;
    return sides[0] * sides[1];
  }
}
