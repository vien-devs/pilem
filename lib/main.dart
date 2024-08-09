import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:pilem/dependency/core_dependency.dart';
import 'package:pilem/dependency/homepage_dependency.dart';
import 'package:pilem/dependency/movie_dependency.dart';
import 'package:pilem/dependency/person_dependency.dart';
import 'package:pilem/dependency/search_dependency.dart';
import 'package:pilem/dependency/series_dependency.dart';
import 'package:pilem/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureDependencies();
  await initializeDateFormatting('id_ID');
  runApp(const MyApp());
}

Future _configureDependencies() async {
  await configureCoreDependencies();
  await configureHomepageDependencies();
  await configureMovieDependencies();
  await configureSeriesDependencies();
  await configurePersonDependencies();
  await configureSearchDependencies();
}
