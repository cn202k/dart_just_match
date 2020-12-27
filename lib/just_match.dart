library just_match;

typedef Action<T, R> = R Function(T it);

typedef Cond<T> = bool Function(T it);

class Case<T, R> {
  final Cond<T> _condition;
  final Action<T, R> _action;

  Case(this._condition, this._action);

  bool match(Object target) =>
      target is T && _condition(target);

  R eval(Object target) => _action(target as T);
}

Case<T, R> value<T, R>(T pattern, Action<T, R> action) =>
    Case<T, R>((target) => target == pattern, action);

Case<T, R> type<T, R>(Action<T, R> action) =>
    Case<T, R>((target) => target is T, action);

Case<Object, R> otherwise<R>(R action()) =>
    Case<Object, R>((_) => true, (_) => action());

Case<T, R> cond<T, R>(
        Cond<T> condition, Action<T, R> action) =>
    Case<T, R>(condition, action);

R match<T, R>(
        Object target, List<Case<T, R>> cases) =>
    cases
        .firstWhere(
          (it) => it.match(target),
          orElse: () => throw Exception(),
        )
        .eval(target);
