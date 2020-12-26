import 'package:just_match/just_match.dart';
import 'package:just_match/just_match_ext.dart';

class Bar {
  static Case<Bar, R> then<R>(
    Action<Bar, R> action,
  ) =>
      type(action);
}

bool isNatural(int value) => 0 < value;

bool isValidName(String value) =>
    4 < value.length && value.length < 10;

void main() {
  final Object target = 100;
  final num result = target.match([
    '3.14'.then((it) => double.parse(it)),
    109.then((it) => it),
    isNatural.then((it) => -it),
    isValidName.then((it) => it.length),
    Bar.then((it) => null),
    otherwise(() => -1),
  ]);
}
