import 'dart:async';
import 'dart:convert';

import 'package:advent_of_dart/src/reader.dart';
import 'package:tuple/tuple.dart';

typedef Coord = Tuple2<int, int>;
typedef SimResult = Tuple2<Coord, Map<Coord, int>>;
typedef Sim2Result = Tuple3<Coord, Coord, Map<Coord, int>>;

/// Day 3 solution for Advent of code
class Day03 {
  Future<int> part1(String input) async {
    final directions = await parseInput(input);
    final result = simulate(directions);
    return result.item2.length;
  }

  Future<int> part2(String input) async {
    final directions = await parseInput(input);
    final result = simulate2(directions);
    return result.item3.length;
  }

  Future<String> parseInput(String input) async {
    final lines =
        await Reader().readInput<String>(input, LineSplitter()).toList();

    return lines.first;
  }

  SimResult simulate(String directions) {
    var position = Tuple2(0, 0);
    final houses = <Coord, int>{position: 1};

    for (var direction in directions.split('')) {
      position = moveDirection(position, direction);
      houses.update(position, (value) => value + 1, ifAbsent: () => 1);
    }

    return Tuple2(position, houses);
  }

  Sim2Result simulate2(String directions) {
    var moveSanta = true;
    final origin = Tuple2(0, 0);
    var santaPosition = origin;
    var robotPosition = origin;
    final houses = <Coord, int>{origin: 1};

    for (var direction in directions.split('')) {
      var position =
          moveDirection(moveSanta ? santaPosition : robotPosition, direction);
      houses.update(position, (value) => value + 1, ifAbsent: () => 1);

      if (moveSanta) {
        santaPosition = position;
      } else {
        robotPosition = position;
      }

      moveSanta = !moveSanta;
    }

    return Tuple3(santaPosition, robotPosition, houses);
  }
}

Coord moveDirection(Coord position, String direction) {
  switch (direction) {
    case '^':
      return position.withItem2(position.item2 + 1);
    case 'v':
      return position.withItem2(position.item2 - 1);
    case '>':
      return position.withItem1(position.item1 + 1);
    case '<':
      return position.withItem1(position.item1 - 1);
    default:
      throw 'not a direction';
  }
}
