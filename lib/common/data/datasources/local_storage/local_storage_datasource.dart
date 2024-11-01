import 'package:app_challenge/common/data/interfaces/local_storage_datasource_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDatasource implements LocalStorageDatasourceInterface {
  final SharedPreferences local;

  LocalStorageDatasource({required SharedPreferences sharedPreferences})
      : local = sharedPreferences;

  @override
  String getData({required String key}) {
    return local.getString(key) ?? '';
  }

  @override
  Future<bool> setData({required String key, required String value}) async {
    return await local.setString(key, value);
  }
}
