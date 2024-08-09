import 'package:pilem/core/storage/core_secure_storage.dart';

class CoreHttpRepository {
  static const coreTokenKey = 'token';
  // static const coreRefreshTokenKey = 'refresh_token';
  // static const coreSessionTokenKey = 'session_token';
  // static const coreEnv = 'current_environment';

  final CoreSecureStorage secureStorage;

  CoreHttpRepository(this.secureStorage);

  Future<void> setToken(String token) =>
      secureStorage.setString(coreTokenKey, token);

  // can be empty
  Future<String> getToken() => secureStorage.getString(coreTokenKey);

  // Future<void> setRefreshToken(String refreshToken) =>
  //     secureStorage.setString(coreRefreshTokenKey, refreshToken);
  //
  // Future<String> getRefreshToken() =>
  //     secureStorage.getString(coreRefreshTokenKey);
  //
  // Future<void> setSessionToken(String sessionToken) =>
  //     secureStorage.setString(coreSessionTokenKey, sessionToken);
  //
  // Future<String> getSessionToken() =>
  //     secureStorage.getString(coreSessionTokenKey);

  // Future<ApiEnv> getEnv() {
  //   return secureStorage.getString(coreEnv).then((envName) {
  //     if (envName.isNotEmpty) {
  //       return ApiEnv.values.firstWhere((element) => element.name == envName);
  //     }
  //     return defaultEnv();
  //   });
  // }
  //
  // Future setEnv(ApiEnv env) => secureStorage.setString(coreEnv, env.name);
  //
  // ApiEnv defaultEnv() => kReleaseMode ? ApiEnv.prod : ApiEnv.dev;
  //
  // List<ApiEnv> allEnvs() => ApiEnv.values;

  Future<void> clear() async {
    await secureStorage.deleteData(coreTokenKey);
    // await secureStorage.deleteData(coreRefreshTokenKey);
    // await secureStorage.deleteData(coreSessionTokenKey);
    // await secureStorage.deleteData(coreEnv);
  }
}
