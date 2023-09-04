Map<K, List<T>> groupByProperty<T, K>(List<T> list, K Function(T) getProperty) {
  final groupedMap = <K, List<T>>{};

  for (final item in list) {
    final key = getProperty(item);
    groupedMap.putIfAbsent(key, () => <T>[]).add(item);
  }

  return groupedMap;
}