import 'package:pilem/core/dependency_injection/core_dependency_module.dart';

Future configureCoreDependencies() async {
  final coreModule = CoreModule();
  await coreModule.dependencyConfiguration();
}
