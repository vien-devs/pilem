import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/homepage/services/homepage_api_service.dart';
import 'package:pilem/data/homepage/services/homepage_repository.dart';

Future configureHomepageDependencies() async {
  serviceLocator.registerFactory<HomepageApiService>(
    () => HomepageApiService(serviceLocator<CoreHttpBuilder>()),
  );

  serviceLocator.registerFactory<HomepageRepository>(
    () => HomepageRepository(
      serviceLocator.get<HomepageApiService>(),
    ),
  );
}
