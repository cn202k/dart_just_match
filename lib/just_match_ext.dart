import 'package:just_match/just_match.dart' as just;

extension JustMatchExt<T extends Object> on T {
  just.Case<T, R> then<R>(just.Action<T, R> action) =>
      just.value<T, R>(this, action);

  R match<P extends T, R>(List<just.Case<P, R>> cases) =>
      just.match(this, cases);
}

extension JustMatchCondExt<T> on just.Cond<T> {
  just.Case<T, R> then<R>(just.Action<T, R> action) =>
      just.cond(this, action);
}
