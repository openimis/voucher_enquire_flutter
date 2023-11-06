class Result<T, E> {
  T? result;
  E? error;

  Result({this.result, this.error});

  bool get isOk => result != null;
  bool get isError => error != null;
}