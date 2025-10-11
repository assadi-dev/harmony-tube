import 'package:get_it/get_it.dart';

import 'bloc_injector.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  //Dependencies
//  await audioHandlerInjector(injector);


  //Services
 // await servicesInjector(injector);


  //Bloc
  await blocInjector(injector);
}
