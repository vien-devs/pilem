import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/person/services/person_api_service.dart';
import 'package:pilem/data/person/services/person_repository.dart';

Future configurePersonDependencies() async {
  serviceLocator.registerFactory<PersonApiService>(
    () => PersonApiService(serviceLocator<CoreHttpBuilder>()),
  );

  serviceLocator.registerFactory<PersonRepository>(
    () => PersonRepository(
      serviceLocator.get<PersonApiService>(),
    ),
  );
}
