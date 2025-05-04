import 'package:get_it/get_it.dart';
import 'package:new_project/core/di/core_di.dart';

import '../../features/auth/domain/di/auth_injector.dart';
import '../../features/home/domain/di/grant_injector.dart';
import 'mappers.dart';

GetIt inject = GetIt.instance;

/// Registration of service dependencies with  service locator GetIt
///
/// Add any such dependency here
Future<void> initInjectors() async {
  // await Firebase.initializeApp();
  await coreInjector();
  await authInjector();
  await setupMappers();
  await grantInjector();
}
