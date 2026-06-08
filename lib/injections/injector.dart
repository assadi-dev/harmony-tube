import 'package:get_it/get_it.dart';

import 'bloc_injector.dart';
import 'repositories_injector.dart';
import 'services_injector.dart';
import 'usecases_injector.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await servicesInjector(injector);
  await repositoriesInjector(injector);
  await usecasesInjector(injector);
  await blocInjector(injector);
}
