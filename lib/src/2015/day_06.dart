import 'dart:convert';

import 'package:advent_of_dart/src/reader.dart';

const SIZE = 1000;

class Day06 {
  int process(List<String> instructions, {bool levels = false}) {
    final lights = instructions
        .map<Instruction>((instruction) => Instruction.fromString(instruction))
        .fold<LightGrid>(
            LightGrid(),
            (grid, instruction) =>
                grid.applyInstruction(instruction, levels: levels));

    return levels ? lights.totalBrightness : lights.countOn;
  }

  Future<int> processFile(String filename, {bool levels = false}) async {
    final lines = await Reader().readInput(filename, LineSplitter()).toList();
    return process(lines, levels: levels);
  }
}

class LightGrid {
  late List<List<int>> grid;

  LightGrid() {
    grid = List.generate(SIZE, (i) => List.filled(SIZE, 0, growable: false),
        growable: false);
  }

  int get countOn => grid.fold<int>(
      0,
      (total, row) =>
          row.fold<int>(0, (sum, light) => light == 1 ? sum + 1 : sum) + total);

  LightGrid applyInstruction(Instruction instruction, {bool levels = false}) {
    for (var x = instruction.from.x; x <= instruction.to.x; x++) {
      for (var y = instruction.from.y; y <= instruction.to.y; y++) {
        if (levels) {
          if (instruction.action == Action.on) {
            grid[y][x] += 1;
          } else if (instruction.action == Action.off) {
            grid[y][x] -= 1;
            if (grid[y][x] < 0) {
              grid[y][x] = 0;
            }
          } else if (instruction.action == Action.toggle) {
            grid[y][x] += 2;
          }
        } else {
          if (instruction.action == Action.on) {
            grid[y][x] = 1;
          } else if (instruction.action == Action.off) {
            grid[y][x] = 0;
          } else if (instruction.action == Action.toggle) {
            grid[y][x] = grid[y][x] == 1 ? 0 : 1;
          }
        }
      }
    }
    return this;
  }

  int get totalBrightness {
    var total = 0;
    for (var x = 0; x < grid[0].length; x++) {
      for (var y = 0; y < grid.length; y++) {
        total += grid[y][x];
      }
    }
    return total;
  }
}

const turnOff = 'turn off';
const turnOn = 'turn on';
const toggle = 'toggle';

enum Action { on, off, toggle }

Action actionFromString(String s) {
  switch (s) {
    case turnOff:
      return Action.off;
    case turnOn:
      return Action.on;
    case toggle:
      return Action.toggle;
    default:
      throw 'value not in enum';
  }
}

List<String> splitAction(String s) {
  final startsWith =
      [turnOff, turnOn, toggle].firstWhere((action) => s.startsWith(action));

  return [startsWith, s.substring(startsWith.length).trimLeft()];
}

class Coordinate {
  int x = 0, y = 0;

  Coordinate(this.x, this.y);

  Coordinate.fromString(String s) {
    final values = s.split(',').map((p) => int.parse(p));
    x = values.first;
    y = values.last;
  }
}

class Instruction {
  late Action action;
  late Coordinate from, to;

  Instruction.fromString(String s) {
    final parts = splitAction(s);
    action = actionFromString(parts[0]);
    final rangeParts = parts[1].split(' ');
    from = Coordinate.fromString(rangeParts[0]);
    to = Coordinate.fromString(rangeParts[2]);
  }
}
