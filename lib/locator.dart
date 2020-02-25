import 'package:muses/deps/get_it/get_it.dart';

import 'package:muses/services/navigation.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
