import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/movie/services/movie_api_service.dart';
import 'package:pilem/data/movie/services/movie_repository.dart';

Future configureMovieDependencies() async {
  serviceLocator.registerFactory<MovieApiService>(
    () => MovieApiService(serviceLocator<CoreHttpBuilder>()),
  );

  serviceLocator.registerFactory<MovieRepository>(
    () => MovieRepository(
      serviceLocator.get<MovieApiService>(),
    ),
  );
}
