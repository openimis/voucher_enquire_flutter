class Result<T, E> {
  T? data;
  E? error;

  Result({this.data, this.error});

  bool get isOk => error == null;

  bool get isError => error != null;
}
