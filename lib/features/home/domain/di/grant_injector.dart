



import 'package:new_project/features/home/domain/usecases/grant_usecases.dart';

import '../../../../core/di/di_config.dart';
import '../../data/datasource/grant_remote_datasource.dart';
import '../../data/repositories/grant_repository.dart';
import '../repositories/grant_repositories.dart';
import '../usecases/explore_grants.dart';
import '../usecases/get_dashboard_data.dart';
import '../usecases/get_grant_detail.dart';
import '../usecases/like_grant.dart';
import '../usecases/saved_grants.dart';

Future<void> grantInjector() async {
  inject.registerLazySingleton<GrantRemoteDataSource>(() => GrantRemoteDataSourceImpl(inject()));
  inject.registerLazySingleton<GrantRepository>(() => GrantRepositoryImpl(inject()));
  inject.registerLazySingleton<ExploreGrants>(() => ExploreGrants(inject()));
  inject.registerLazySingleton<GetDashboardData>(() => GetDashboardData(inject()));
  inject.registerLazySingleton<GetGrantDetail>(() => GetGrantDetail(inject()));
  inject.registerLazySingleton<LikeGrant>(() => LikeGrant(inject()));
  inject.registerLazySingleton<GetSavedGrants>(() => GetSavedGrants(inject()));
  inject.registerLazySingleton<GrantUsecases>(() => GrantUsecases(inject(), inject(), inject(), inject(),  inject()));
}