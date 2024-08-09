import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/search/services/search_api_service.dart';
import 'package:pilem/data/search/services/search_repository.dart';

Future configureSearchDependencies() async {
  serviceLocator.registerFactory<SearchApiService>(
    () => SearchApiService(serviceLocator<CoreHttpBuilder>()),
  );

  serviceLocator.registerFactory<SearchRepository>(
    () => SearchRepository(
      serviceLocator.get<SearchApiService>(),
    ),
  );
}
