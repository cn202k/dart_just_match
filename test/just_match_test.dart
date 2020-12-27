import 'package:just_match/just_match.dart';
import 'package:test/test.dart';

void main() {
  test('value', () {
    final x = 10;
    final result = match(x, [
      value(0, (int it) => 'x is 0'),
      value(10, (int it) => 'x is 10'),
    ]);
    expect(result, 'x is 10');
  });

  test('cond', () {
    final isNatural = (int value) => value > 0;
    final isNegative = (int value) => value < 0;
    final x = 10;
    final result = match(x, [
      cond(isNegative, (int it) => 'x is a negative number'),
      cond(isNatural, (int it) => 'x is a natural number'),
    ]);
    expect(result, 'x is a natural number');
  });

  test('type', () {
    final Object x = [1, 2, 3];
    final result = match(x, [
      type((String it) => 'x is String'),
      type((int it) => 'x is int'),
      type((List<int> it) => 'x is List<int>')
    ]);
    expect(result, 'x is List<int>');
  });

  test('otherwise', () {
    final x = 10;
    final result = match(x, [
      value(0, (int it) => 'x is 0'),
      otherwise(() => 'unkown'),
    ]);
    expect(result, 'unkown');
  });
}
