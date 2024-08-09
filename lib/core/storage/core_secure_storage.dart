import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CoreSecureStorage {
  static const key = 'key';
  static const save = 'save';

  final FlutterSecureStorage _secureStorage;
  final AndroidOptions _androidOption;
  final IOSOptions _iosOptions;

  CoreSecureStorage(this._secureStorage, this._androidOption, this._iosOptions);

  Future<void> setString(String key, String value) async {
    await _secureStorage.write(
        key: key,
        value: value,
        aOptions: _androidOption,
        iOptions: _iosOptions);
  }

  Future<void> setListString(String key, List<String> value) async {
    await _secureStorage.write(
        key: key,
        value: value.join(','),
        aOptions: _androidOption,
        iOptions: _iosOptions);
  }

  Future<String> getString(String key) async {
    var data = await _secureStorage.read(
      key: key,
      aOptions: _androidOption,
      iOptions: _iosOptions,
    );
    return data ?? '';
  }

  Future<List<String>> getList(String key) async {
    var data = await _secureStorage.read(
      key: key,
      aOptions: _androidOption,
      iOptions: _iosOptions,
    );
    return data?.split(',') ?? [];
  }

  Future<void> setInt(String key, int value) async {
    await _secureStorage.write(
        key: key,
        value: value.toString(),
        aOptions: _androidOption,
        iOptions: _iosOptions);
  }

  Future<int> getInt(String key) async {
    var data = await _secureStorage.read(
        key: key, aOptions: _androidOption, iOptions: _iosOptions);
    return int.parse(data ?? '0');
  }

  Future<void> setDouble(String key, double value) async {
    await _secureStorage.write(
        key: key,
        value: value.toString(),
        aOptions: _androidOption,
        iOptions: _iosOptions);
  }

  Future<double> getDouble(String key) async {
    var data = await _secureStorage.read(
        key: key, aOptions: _androidOption, iOptions: _iosOptions);
    return double.parse(data ?? '0.0');
  }

  // Future<void> setBoolean(String key, bool value) async {
  //   await _secureStorage.write(
  //       key: key,
  //       value: value.toString(),
  //       aOptions: _androidOption,
  //       iOptions: _iosOptions);
  // }
  //
  // Future<bool> getBoolean(String key) async {
  //   var data = await _secureStorage.read(
  //       key: key, aOptions: _androidOption, iOptions: _iosOptions);
  //   return data?.toBoolean() ?? false;
  // }

  Future<void> deleteData(String key) async {
    await _secureStorage.delete(
        key: key, aOptions: _androidOption, iOptions: _iosOptions);
  }

  Future<void> deleteAllData() async {
    await _secureStorage.deleteAll(
        aOptions: _androidOption, iOptions: _iosOptions);
  }
}
