extension StreamListExtension<T, K> on Stream<List<T>> {
  Stream<List<K>> mapList<K>(K Function(T) mapper) {
    return map((list) => list.map(mapper).toList());
  }
}
