import 'dart:io';

import 'package:alice/alice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:pilem/core/network/http/core_base_client.dart';
import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/network/repository/core_http_repository.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/core/storage/core_secure_storage.dart';

class CoreModule {
  GlobalKey<NavigatorState> navigatorKey() => GlobalKey();
  static const _defaultHeaders = 'defaultHeaders';

  Alice aliceHttpInspector() {
    return Alice(
      navigatorKey: serviceLocator.get(),
      showNotification: true,
      showInspectorOnShake: true,
      showShareButton: true,
    );
  }

  Future<Map<String, String>> defaultHttpHeaders() async {
    // final packageInfo = await PackageInfo.fromPlatform();
    return Map.unmodifiable({
      // 'X-App-Version': packageInfo.buildNumber,
      // 'X-App-Name': 'amarthafin-flutter',
      // 'X-App-OS': Platform.operatingSystem,
      // HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    });
  }

  CoreHttpRepository coreHttpRepository(CoreSecureStorage coreSecureStorage) {
    return CoreHttpRepository(coreSecureStorage);
  }

  CoreHttpBuilder coreHttpBuilder(
    Map<String, String> defaultHeaders,
    Alice httpInspector,
    CoreHttpRepository coreHttpRepository,
  ) {
    return CoreHttpBuilder(
      defaultHeaders: defaultHeaders,
      coreClient: () => CoreBaseClient(Client()),
      httpInspector: httpInspector,
      coreHttpRepository: coreHttpRepository,
    );
  }

  CoreSecureStorage coreSecureStorage() => CoreSecureStorage(
        const FlutterSecureStorage(),
        const AndroidOptions(encryptedSharedPreferences: true),
        const IOSOptions(),
      );

  Future dependencyConfiguration() async {
    serviceLocator.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey());
    serviceLocator.registerSingleton<CoreSecureStorage>(coreSecureStorage());
    serviceLocator.registerSingleton<Alice>(aliceHttpInspector());

    serviceLocator.registerSingleton<Map<String, String>>(
      await defaultHttpHeaders(),
      instanceName: _defaultHeaders,
    );

    serviceLocator.registerFactory<CoreHttpRepository>(
      () => coreHttpRepository(
        serviceLocator<CoreSecureStorage>(),
      ),
    );
    serviceLocator.registerFactory(
      () => coreHttpBuilder(
        serviceLocator(instanceName: _defaultHeaders),
        serviceLocator(),
        serviceLocator(),
      ),
    );
  }
}
