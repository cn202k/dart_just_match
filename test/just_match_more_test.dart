import 'package:just_match/just_match.dart';
import 'package:just_match/just_match_ext.dart';

class Bar {
  static Case<Bar, R> then<R>(
    Action<Bar, R> action,
  ) =>
      type(action);
}

void main() {
  final target = 100;
  final num result = target.match([
    '3.14'.then((it) => double.parse(it)),
    109.then((it) => it),
    Bar.then((it) => null),
    otherwise(() => -1),
  ]);
}
