import 'package:just_match/just_match.dart' as just;

extension JustMatchExt<T extends Object> on T {
  just.Case<T, R> then<R>(just.Action<T, R> action) =>
      just.value<T, R>(this, action);

  R match<U, R>(List<just.Case<U, R>> cases) =>
      just.match(this, cases);
}
