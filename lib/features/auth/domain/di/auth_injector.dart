import 'package:new_project/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:new_project/features/auth/domain/repositotries%20/auth_repositories.dart';
import 'package:new_project/features/auth/domain/usecases/authentication_usecases.dart';
import 'package:new_project/features/auth/domain/usecases/login.dart';
import 'package:new_project/features/auth/domain/usecases/request_paswordreset.dart';
import 'package:new_project/features/auth/domain/usecases/reset_password.dart';
import 'package:new_project/features/auth/domain/usecases/update_user.dart';

import '../../../../core/di/di_config.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../usecases/create_organisation.dart';
import '../usecases/register_user.dart';
import '../usecases/update_profile_image.dart';

Future<void> authInjector() async {
  inject.registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImpl(inject()));
  inject.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(inject()));
  inject.registerLazySingleton<Login>(() => Login(inject()));
  inject.registerLazySingleton<RegisterUser>(() => RegisterUser(inject()));
  inject.registerLazySingleton<CreateOrganisation>(() => CreateOrganisation(inject()));
  inject.registerLazySingleton<RequestPasswordReset>(() => RequestPasswordReset(inject()));
  inject.registerLazySingleton<ResetPassword>(() => ResetPassword(inject()));
  inject.registerLazySingleton<UpdateProfileImage>(() => UpdateProfileImage(inject()));
  inject.registerLazySingleton<UpdateUser>(() => UpdateUser(inject()));

  inject.registerLazySingleton<AuthenticationUsecases>(() => AuthenticationUsecases(inject(), inject(), inject(), inject(), inject(), inject(), inject()));
}
