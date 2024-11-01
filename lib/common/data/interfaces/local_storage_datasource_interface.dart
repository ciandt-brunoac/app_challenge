abstract class LocalStorageDatasourceInterface {
  String getData({
    required String key,
  });
  Future<bool> setData({
    required String key,
    required String value,
  });
}
