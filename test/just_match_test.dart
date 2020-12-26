import 'package:just_match/just_match.dart';

class Bar {}

void main() {
  final target = 100;
  final num result = match(target, [
    // it == '3.14'
    value('3.14', (String it) => double.parse(it)),
    // it == 109
    value(109, (int it) => it),
    // it is String == true
    type((String it) => null),
    // it is List<String> == true
    type((List<String> it) => null),
    // it is List<int> == true
    type((List<int> it) => it.reduce((p, e) => p + e)),
    // it is Bar == true
    type((Bar it) => null),
    otherwise(() => -1),
  ]);
}
