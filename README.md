# just_match

`just_match` **just** provides a naive pattern **match**ing for Dart.

```dart
import 'package:just_match/just_match.dart';
import 'package:just_match/just_match_ext.dart';

void main() {
  print(interpret(100)); // 'The value is 100'
}

String interpret(Object value) {
  return value.match([
    '3.14'.then((it) => 'The value is pi'),
    100.then((it) => 'The value is 100'),
    Bar.then((it) => 'The value is a Bar'),
    isValidUserName.then((it) => 'The value is a valid user name'),
    otherwise(() => "I'm sorry, I can't understand"),
  ]);
}

class Bar {
  static Case<Bar, R> then<R>(
    Action<Bar, R> action,
  ) =>
      type(action);
}

bool isValidUserName(String value) =>
    4 < value.length && value.length < 10;

```