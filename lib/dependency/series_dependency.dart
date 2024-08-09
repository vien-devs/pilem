import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/series/services/series_api_service.dart';
import 'package:pilem/data/series/services/series_repository.dart';

Future configureSeriesDependencies() async {
  serviceLocator.registerFactory<SeriesApiService>(
    () => SeriesApiService(serviceLocator<CoreHttpBuilder>()),
  );

  serviceLocator.registerFactory<SeriesRepository>(
    () => SeriesRepository(
      serviceLocator.get<SeriesApiService>(),
    ),
  );
}
