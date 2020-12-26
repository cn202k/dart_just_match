library just_match;

typedef Action0<R> = R Function();

typedef Action<T, R> = R Function(T it);

typedef Cond<T> = bool Function(T it);

abstract class Case<T, R> {
  bool match(Object target);
  R eval(Object target);
}

class ValueCase<T, R> extends Case<T, R> {
  final T _pattern;
  final Action<T, R> _action;

  ValueCase._(this._pattern, this._action);

  @override
  bool match(Object target) => target == _pattern;

  @override
  R eval(Object target) => _action(target as T);
}

class TypeCase<T, R> extends Case<T, R> {
  final Action<T, R> _action;

  TypeCase._(this._action);

  @override
  bool match(Object target) => target is T;

  @override
  R eval(Object target) => _action(target as T);
}

class OtherwiseCase<R> extends Case<Object, R> {
  final Action0<R> _action;

  OtherwiseCase._(this._action);

  @override
  bool match(Object target) => true;

  @override
  R eval(Object target) => _action();
}

class CondCase<T, R> extends Case<T, R> {
  final Cond<T> _condition;
  final Action<T, R> _action;

  CondCase._(this._condition, this._action);

  @override
  bool match(Object target) =>
      target is T && _condition(target);

  @override
  R eval(Object target) => _action(target as T);
}

Case<T, R> value<T, R>(T pattern, Action<T, R> action) =>
    ValueCase<T, R>._(pattern, action);

Case<T, R> type<T, R>(Action<T, R> action) =>
    TypeCase<T, R>._(action);

Case<Object, R> otherwise<R>(Action0<R> action) =>
    OtherwiseCase<R>._(action);

Case<T, R> cond<T, R>(
        Cond<T> condition, Action<T, R> action) =>
    CondCase<T, R>._(condition, action);

R match<T, P extends T, R>(
        T target, List<Case<P, R>> cases) =>
    cases
        .firstWhere(
          (it) => it.match(target),
          orElse: () => throw Exception(),
        )
        .eval(target);
